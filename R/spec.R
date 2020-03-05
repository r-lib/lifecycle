
spec_validate_what <- function(what, arg, signaller) {
  call <- parse_expr(what)

  if (!is_call(call)) {
    if (is_symbol(what) || is_string(what)) {
      what <- as_string(what)
    } else {
      what <- "myfunction"
    }
    abort(glue::glue(
      "
      Internal error: `what` must have function call syntax.

        # Good:
        { signaller }(\"{what}()\")

        # Bad:
        { signaller }(\"{what}\")

      "
    ))
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

spec_validate_fn <- function(call) {
  fn <- node_car(call)

  if (!is_symbol(fn)) {
    abort("Internal error: `what` must refer to a function name.")
  }

  # Deparse so non-syntactic names are backticked
  expr_deparse(fn)
}

spec_validate_arg <- function(call, signaller) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (length(arg) != 1L) {
    abort("Internal error: `what` can't refer to more than one argument.")
  }

  if (is_null(node_tag(arg))) {
    fn <- as_string(node_car(call))
    abort(glue::glue(
      "
        Internal error: `what` must refer to arguments in the LHS of `=`.

          # Good:
          {signaller}(\"{fn}(arg = )\")

          # Bad:
          {signaller}(\"{fn}(arg)\")

        "
    ))
  }

  as_string(node_tag(arg))
}

spec_validate_reason <- function(call, signaller) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (length(arg) != 1L) {
    abort("Internal error: `what` can't refer to more than one argument.")
  }

  if (is_missing(node_car(arg))) {
    reason <- "is deprecated"
  } else if (is_string(node_car(arg)))  {
    reason <- node_car(arg)
  } else {
    fn <- as_string(node_car(call))
    abort(glue::glue(
      "
        Internal error: `what` must contain reason as a string in the LHS of `=`.

          # Good:
          {signaller}(\"{fn}(arg = 'must be a string')\")

          # Bad:
          {signaller}(\"{fn}(arg = 42)\")

        "
    ))
  }

  reason
}
