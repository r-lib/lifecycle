#' Signal deprecation
#'
#' @description
#'
#' These functions provide two levels of verbosity for deprecation
#' warnings.
#'
#' * `signal_soft_deprecated()` warns only if called from the global
#'   environment (so the user can change their script) or from the
#'   package currently being tested (so the package developer can fix
#'   the package).
#'
#' * `warn_deprecated()` warns unconditionally.
#'
#' * `stop_defunct()` fails unconditionally.
#'
#' Both functions warn only once per session by default to avoid
#' overwhelming the user with repeated warnings.
#'
#' @param msg The deprecation message.
#' @param id The id of the deprecation. A warning is issued only once
#'   for each `id`. Defaults to `msg`, but you should give a unique ID
#'   when the message is built programmatically and depends on inputs.
#' @param env The environment in which the soft-deprecated function
#'   was called. A warning is issued if called from the global
#'   environment. If testthat is running, a warning is also called if
#'   the retired function was called from the package being tested.
#'
#' @section Controlling verbosity:
#'
#' The verbosity of retirement warnings can be controlled with global
#' options. You'll generally want to set these options locally with
#' one of these helpers:
#'
#' * `with_lifecycle_silence()` disables all soft-deprecation and
#'   deprecation warnings.
#'
#' * `with_lifecycle_warnings()` enforces warnings for both
#'   soft-deprecated and deprecated functions. The warnings are
#'   repeated rather than signalled once per session.
#'
#' * `with_lifecycle_errors()` enforces errors for both
#'   soft-deprecated and deprecated functions.
#'
#' All the `with_` helpers have `scoped_` variants that are
#' particularly useful in testthat blocks.
#'
#' @seealso [lifecycle()]
#'
#' @export
signal_soft_deprecated <- function(msg, id = msg, env = caller_env(2)) {
  msg <- lifecycle_validate_message(msg)
  stopifnot(
    is_string(id),
    is_environment(env)
  )

  if (is_true(peek_option("lifecycle_disable_warnings"))) {
    return(invisible(NULL))
  }

  if (is_true(peek_option("lifecycle_verbose_soft_deprecation")) ||
      env_inherits_global(env)) {
    warn_deprecated(msg, id)
    return(invisible(NULL))
  }

  # Test for environment names rather than reference/contents because
  # testthat clones the namespace
  tested_package <- Sys.getenv("TESTTHAT_PKG")
  if (nzchar(tested_package) &&
        identical(Sys.getenv("NOT_CRAN"), "true") &&
        env_name(topenv(env)) == env_name(ns_env(tested_package))) {
    warn_deprecated(msg, id)
    return(invisible(NULL))
  }

  signal(msg, "lifecycle_soft_deprecated")
}

#' @rdname signal_soft_deprecated
#' @export
warn_deprecated <- function(msg, id = msg) {
  msg <- lifecycle_validate_message(msg)
  stopifnot(is_string(id))

  if (is_true(peek_option("lifecycle_disable_warnings"))) {
    return(invisible(NULL))
  }

  if (!is_true(peek_option("lifecycle_repeat_warnings")) &&
        env_has(deprecation_env, id)) {
    return(invisible(NULL))
  }

  env_poke(deprecation_env, id, TRUE);

  if (is_true(peek_option("lifecycle_warnings_as_errors"))) {
    .Signal <- function(msg) stop_defunct("TODO", "TODO()", details = msg)
  } else {
    .Signal <- .Deprecated
  }

  if (!is_true(peek_option("lifecycle_repeat_warnings"))) {
    msg <- paste0(msg, "\n", silver("This warning is displayed once per session."))
  }

  .Signal(msg = msg)
}
deprecation_env <- new.env(parent = emptyenv())

#' @rdname signal_soft_deprecated
#' @export
stop_defunct <- function(when, what, with = NULL, details = NULL) {
  msg <- lifecycle_build_message(when, what, with, details, "stop_defunct")

  stop(cnd(
    c("defunctError", "error", "condition"),
    old = NULL,
    new = NULL,
    package = NULL,
    message = msg
  ))
}

env_inherits_global <- function(env) {
  # `topenv(emptyenv())` returns the global env. Return `FALSE` in
  # that case to allow passing the empty env when the
  # soft-deprecation should not be promoted to deprecation based on
  # the caller environment.
  if (is_reference(env, empty_env())) {
    return(FALSE)
  }

  is_reference(topenv(env), global_env())
}

lifecycle_validate_message <- function(msg) {
  stopifnot(is_character(msg))
  paste0(msg, collapse = "\n")
}

lifecycle_build_message <- function(when,
                                    what,
                                    with = NULL,
                                    details = chr(),
                                    signaller) {
  details <- details %||% chr()

  stopifnot(
    is_string(when),
    is_string(what),
    is_null(with) || is_string(with),
    is_character(details)
  )

  what <- signal_validate_what(what, "what", signaller)
  fn <- signal_validate_fn(what$call)
  arg <- signal_validate_arg(what$call, signaller)

  if (is_null(what$pkg)) {
    env <- topenv(caller_env(2))
    pkg <- signal_validate_pkg(env)
  } else {
    pkg <- what$pkg
  }

  if (is_null(arg)) {
    msg <- glue::glue("`{ fn }()` is deprecated as of { pkg } { when }.")
  } else {
    abort("TODO")
  }

  if (!is_null(with)) {
    with <- signal_validate_what(with, "with", signaller)
    with_fn <- signal_validate_fn(with$call)
    with_arg <- signal_validate_arg(with$call, signaller)

    with_pkg <- with$pkg %||% pkg
    if (!is_null(with_pkg)) {
      with_fn <- glue::glue("{ with_pkg }::{ with_fn }")
    }

    if (is_null(with_arg)) {
      msg <- glue::glue(
        "{ msg }
       Please use `{ with_fn }()` instead."
      )
    } else {
      abort("TODO")
    }
  }

  msg
}

signal_validate_what <- function(what, arg, signaller) {
  call <- parse_expr(what)

  if (!is_call(call)) {
    abort(glue::glue(
      "
      Internal error: `what` must have function call syntax.

        # Good:
        { signaller }({ what } = \"myfunction()\")

        # Bad:
        { signaller }({ what } = \"myfunction\")

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

signal_validate_fn <- function(call) {
  fn <- node_car(call)

  if (!is_symbol(fn)) {
    abort("Internal error: `what` must refer to a function name.")
  }

  # Deparse so non-syntactic names are backticked
  expr_deparse(fn)
}

signal_validate_arg <- function(call, signaller) {
  arg <- node_cdr(call)

  if (is_null(arg)) {
    return(NULL)
  }

  if (length(arg) != 1L) {
    abort("Internal error: `what` can't refer to more than one argument.")
  }

  if (is_null(node_tag(arg)) || !is_missing(node_car(arg))) {
    abort(glue::glue(
      "
        Internal error: `what` must refer to arguments in the LHS of `=`.

          # Good:
          { signaller }(what = \"myfunction(arg = )\")

          # Bad:
          { signaller }(what = \"myfunction(arg)\")

        "
    ))
  }

  # Deparse so non-syntactic names are backticked
  expr_deparse(node_tag(arg))
}

signal_validate_pkg <- function(env) {
  if (is_reference(env, global_env())) {
    # Convenient for experimenting interactively
    return("<NA>")
  }

  if(is_namespace(env)) {
    return(ns_env_name(env))
  }

  abort(glue::glue(
    "
    Internal error: Can't detect the package of the deprecated function.
    Please mention the namespace:

      # Good:
      { signaller }(what = \"namespace::myfunction()\")

      # Bad:
      { signaller }(what = \"myfunction()\")
    "
  ))
}
