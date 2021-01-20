
spec <- function(spec, env = caller_env(), signaller = "signal_lifecycle") {
  what <- spec_what(spec, "spec", signaller)
  fn <- spec_fn(what$call)
  arg <- spec_arg(what$call, signaller)
  reason <- spec_reason(what$call, signaller)

  if (is_null(what$pkg) && !is.null(env)) {
    pkg <- spec_package(env, signaller = signaller)
  } else {
    pkg <- what$pkg
  }

  list(
    fn = fn,
    arg = arg,
    pkg = pkg,
    reason = reason,
    from = signaller
  )
}

spec_what <- function(what, arg, signaller) {
  if (is_string(what)) {
    call <- parse_expr(what)
  } else {
    lifecycle_abort("`what` must be a string.")
  }

  if (!is_call(call)) {
    what <- as_string(what)
    lifecycle_abort(
      "
      `what` must have function call syntax.

        # Good:
        { signaller }(\"{what}()\")

        # Bad:
        { signaller }(\"{what}\")

      "
    )
  }

  head <- node_car(call)
  if (is_call(head, "::")) {
    pkg <- as_string(node_cadr(head))
    call[[1]] <- node_cadr(node_cdr(head))
  } else {
    pkg <- NULL
  }

  list(pkg = pkg, call = call)
}

spec_fn <- function(call) {
  fn <- node_car(call)

  if (!is_symbol(fn) && !is_call(fn, "$")) {
    lifecycle_abort("`what` must be a function or method call.")
  }

  # Deparse so non-syntactic names are backticked
  expr_deparse(fn)
}

spec_arg <- function(call, signaller) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (length(arg) != 1L) {
    fn <- as_label(node_car(call))
    n <- length(arg)
    lifecycle_abort("Function in `what` ({fn}) must have 1 argument, not {n}.")
  }

  if (is_null(node_tag(arg))) {
    as_string(node_car(arg))
  } else {
    as_string(node_tag(arg))
  }
}

spec_reason <- function(call, signaller) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (is_null(node_tag(arg))) {
    return(NULL)
  }

  if (is_missing(node_car(arg))) {
    return(NULL)
  }

  if (is_string(node_car(arg)))  {
    return(node_car(arg))
  }

  fn <- expr_deparse(node_car(call))
  lifecycle_abort(
    "
    `what` must contain reason as a string on the RHS of `=`.

      # Good:
      {signaller}(\"{fn}(arg = 'must be a string')\")

      # Bad:
      {signaller}(\"{fn}(arg = 42)\")

    "
  )
}

spec_package <- function(env, signaller) {
  env <- topenv(env)
  if (is_reference(env, global_env())) {
    # Convenient for experimenting interactively
    return(getOption("lifecycle:::calling_package", "<NA>"))
  }

  if(is_namespace(env)) {
    return(ns_env_name(env))
  }

  lifecycle_abort(
    "
    Can't detect the package of the deprecated function.
    Please mention the namespace:

      # Good:
      { signaller }(what = \"namespace::myfunction()\")

      # Bad:
      { signaller }(what = \"myfunction()\")
    "
  )
}
