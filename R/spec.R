spec <- function(spec,
                 env = caller_env(),
                 signaller = "signal_lifecycle",
                 error_call = caller_env()) {
  ctxt <- list(
    signaller = signaller,
    call = error_call
  )

  if (inherits(spec, "AsIs")) {
    list(
      fn = spec,
      arg = NULL,
      pkg = spec_pkg(NULL, env, ctxt = ctxt),
      reason = NULL,
      from = signaller
    )
  } else {
    what <- parse_what(spec, ctxt = ctxt)

    list(
      fn = spec_fn(what$call, ctxt = ctxt),
      arg = spec_arg(what$call, ctxt = ctxt),
      pkg = spec_pkg(what$pkg, env, ctxt = ctxt),
      reason = spec_reason(what$call, ctxt = ctxt),
      from = signaller
    )
  }
}

parse_what <- function(what, ctxt) {
  check_string(what, call = ctxt$call)

  call <- parse_expr(what)

  if (!is_call(call)) {
    what <- as_string(what)
    cli::cli_abort(
      c(
        "{.arg what} must have function call syntax.",
        "",
        " " = "# Good:",
        " " = "{ ctxt$signaller }(\"{what}()\")",
        "",
        " " = "# Bad:",
        " " = "{ ctxt$signaller }(\"{what}\")"
      ),
      call = ctxt$call,
      arg = "what"
    )
  }

  head <- call[[1]]
  if (is_call(head, "::")) {
    pkg <- as_string(head[[2]])
    call[[1]] <- head[[3]]
  } else {
    pkg <- NULL
  }

  list(pkg = pkg, call = call)
}

spec_fn <- function(call, ctxt) {
  fn <- node_car(call)

  if (!is_symbol(fn) && !is_call(fn, "$")) {
    cli::cli_abort(
      "{.arg what} must be a function or method call.",
      call = ctxt$call,
      arg = "what"
    )
  }

  # Deparse so non-syntactic names are backticked
  deparse(fn)
}

spec_arg <- function(call, ctxt) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (length(arg) != 1L) {
    fn <- as_label(node_car(call))
    n <- length(arg)
    cli::cli_abort(
      "Function in {.arg what} ({fn}) must have 1 argument, not {n}.",
      call = ctxt$call
    )
  }

  if (is_null(node_tag(arg))) {
    as_string(node_car(arg))
  } else {
    as_string(node_tag(arg))
  }
}

spec_reason <- function(call, ctxt) {
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

  if (is_string(node_car(arg))) {
    return(node_car(arg))
  }

  fn <- deparse(node_car(call))
  cli::cli_abort(
    c(
      "{.arg what} must contain reason as a string on the RHS of `=`.",
      "",
      " " = "# Good:",
      " " = "{ctxt$signaller}(\"{fn}(arg = 'must be a string')\")",
      "",
      " " = "# Bad:",
      " " = "{ctxt$signaller}(\"{fn}(arg = 42)\")"
    ),
    call = ctxt$call
  )
}

spec_pkg <- function(pkg, env, ctxt) {
  if (!is_null(pkg) || is_null(env)) {
    return(pkg)
  }

  env <- topenv(env)
  if (is_reference(env, global_env())) {
    # Convenient for experimenting interactively
    return(getOption("lifecycle:::calling_package", "<NA>"))
  }

  if (is_namespace(env)) {
    return(ns_env_name(env))
  }

  cli::cli_abort(
    c(
      "Can't detect the package of the deprecated function.",
      "Please mention the namespace:",
      "",
      " " = "# Good:",
      " " = "{ ctxt$signaller }(what = \"namespace::myfunction()\")",
      "",
      " " = "# Bad:",
      " " = "{ ctxt$signaller }(what = \"myfunction()\")",
      ""
    ),
    call = ctxt$call
  )
}
