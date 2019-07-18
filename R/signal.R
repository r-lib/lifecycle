#' Signal deprecation
#'
#' @description
#'
#' These functions provide three levels of verbosity for deprecated
#' functions.
#'
#' * `deprecate_soft()` warns only if the deprecated function is
#'   called from the global environment (so the user can change their
#'   script) or from the package currently being tested (so the
#'   package developer can fix the package).
#'
#' * `deprecate_warn()` warns unconditionally.
#'
#' * `deprecate_stop()` fails unconditionally.
#'
#' These verbosity levels are appropriate for the following lifecycle
#' stages respectively: soft-deprecated, deprecated, and defunct.
#'
#' Warnings are only issued once per session to avoid overwhelming the
#' user with repeated warnings. See [with_lifecycle_warnings()] and
#' variants to force silence, warnings, or errors.
#'
#' @param when The version the feature was deprecated in.
#' @param what If the deprecated feature is a whole function, the
#'   function name: `"foo()"`. If it's an argument that is being
#'   deprecated, the function call should include the argument:
#'   `"foo(arg = )"`.
#'
#'   You can optionally supply the namespace: `"ns::foo()"`. If you
#'   don't, it is inferred from the caller environment.
#' @param with An optional replacement for the deprecated feature.
#'   This should be a string of the same form as `what`.
#' @param details The deprecation message is generated from `when`,
#'   `what`, and `with`. You can additionally supply a string
#'   `details` to be appended to the message.
#' @param id The id of the deprecation. A warning is issued only once
#'   for each `id`. Defaults to the generated message, but you should
#'   give a unique ID when the message in `details` is built
#'   programmatically and depends on inputs, or when you'd like to
#'   deprecate multiple functions but warn only once for all of them.
#' @param env The environment in which the soft-deprecated function
#'   was called. A warning is issued if called from the global
#'   environment. If testthat is running, a warning is also called if
#'   the retired function was called from the package being tested.
#'
#' @seealso [lifecycle()]
#'
#' @examples
#' # A deprecated function `foo`:
#' deprecate_warn("1.0.0", "foo()")
#'
#' # A deprecated argument `arg`:
#' deprecate_warn("1.0.0", "foo(arg = )")
#'
#' # A deprecated function with a function replacement:
#' deprecate_warn("1.0.0", "foo()", "bar()")
#'
#' # A deprecated function with a function replacement from a
#' # different package:
#' deprecate_warn("1.0.0", "foo()", "otherpackage::bar()")
#'
#' # A deprecated function with an argument replacement:
#' deprecate_warn("1.0.0", "foo()", "foo(bar = )")
#'
#' @export
deprecate_soft <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL,
                           env = caller_env(2)) {
  stopifnot(is_environment(env))

  if (is_true(peek_option("lifecycle_disable_warnings"))) {
    return(invisible(NULL))
  }

  if (is_true(peek_option("lifecycle_verbose_soft_deprecation")) ||
      env_inherits_global(env)) {
    deprecate_warn(when, what, with = with, details = details, id = id)
    return(invisible(NULL))
  }

  # Test for environment names rather than reference/contents because
  # testthat clones the namespace
  tested_package <- Sys.getenv("TESTTHAT_PKG")
  if (nzchar(tested_package) &&
        identical(Sys.getenv("NOT_CRAN"), "true") &&
        env_name(topenv(env)) == env_name(ns_env(tested_package))) {
    deprecate_warn(when, what, with = with, details = details, id = id)
    return(invisible(NULL))
  }

  msg <- lifecycle_build_message(when, what, with, details, "deprecate_warn")
  signal(msg, "lifecycle_soft_deprecated")
}

#' @rdname deprecate_soft
#' @export
deprecate_warn <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL) {
  msg <- lifecycle_build_message(when, what, with, details, "deprecate_warn")

  id <- id %||% msg
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
    deprecate_stop(when, what, with = with, details = details)
  } else {
    if (!is_true(peek_option("lifecycle_repeat_warnings"))) {
      msg <- paste0(msg, "\n", silver("This warning is displayed once per session."))
    }
    .Deprecated(msg = msg)
  }
}
deprecation_env <- new.env(parent = emptyenv())

#' @rdname deprecate_soft
#' @export
deprecate_stop <- function(when,
                           what,
                           with = NULL,
                           details = NULL) {
  msg <- lifecycle_build_message(when, what, with, details, "deprecate_stop")

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
    msg <- glue::glue("The `{ arg }` argument of `{ fn }()` is deprecated as of { pkg } { when }.")
  }

  if (!is_null(with)) {
    with <- signal_validate_what(with, "with", signaller)
    with_fn <- signal_validate_fn(with$call)
    with_arg <- signal_validate_arg(with$call, signaller)

    with_pkg <- with$pkg %||% pkg
    if (!is_null(with_pkg) && pkg != with_pkg) {
      with_fn <- glue::glue("{ with_pkg }::{ with_fn }")
    }

    if (is_null(with_arg)) {
      please <- glue::glue("Please use `{ with_fn }()` instead.")
    } else if (fn == with_fn) {
      please <- glue::glue("Please use the argument `{ with_arg }` instead.")
    } else {
      please <- glue::glue("Please use the `{ with_arg }` argument of `{ with_fn }()` instead.")
    }

    msg <- paste0(msg, "\n", please)
  }

  paste_line(msg, details)
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

  as_string(node_tag(arg))
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
