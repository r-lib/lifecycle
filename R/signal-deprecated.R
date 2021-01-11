#' Deprecate functions and arguments
#'
#' @description
#'
#' These functions provide three levels of verbosity for deprecated
#' functions.
#'
#' * `deprecate_soft()` warns only if the deprecated function is
#'   called from the global environment (so the user can change their
#'   script) or from the package currently being tested (so the
#'   package developer can fix the package). Use for soft-deprecated
#'   functions.
#'
#' * `deprecate_warn()` warns unconditionally. Use for deprecated functions.
#'
#' * `deprecate_stop()` fails unconditionally. Use for defunct functions.
#'
#' Warnings are only issued once every 8 hours to avoid overwhelming
#' the user. See the [verbosity option][verbosity] to control this
#' behaviour.
#'
#' Deprecation warnings have class
#' `lifecycle_warning_deprecated`. Deprecation errors have class
#' `lifecycle_error_deprecated`.
#'
#' @param when A string giving the version when the behaviour was deprecated.
#' @param what A string describing what is deprecated:
#'
#'   * Deprecate a whole function with `"foo()"`.
#'   * Deprecate an argument with `"foo(arg)"`.
#'   * Partially deprecate an argument with
#'     `"foo(arg = 'must be a scalar integer')"`.
#'
#'   You can optionally supply the namespace: `"ns::foo()"`, but this is
#'   usually not needed as it will be inferred from the caller environment.
#' @param with An optional string given a recommended replacement for the
#'   deprecated behaviour. This takes the same form as `what`.
#' @param details In most cases the deprecation message can be automatically
#'   generated from `with`. When it can't, use `details` to provide a
#'   hand-written message. `details` can either be a single string or a
#'   character vector, which will be converted to a bulleted list.
#' @param id The id of the deprecation. A warning is issued only once
#'   for each `id`. Defaults to the generated message, but you should
#'   give a unique ID when the message in `details` is built
#'   programmatically and depends on inputs, or when you'd like to
#'   deprecate multiple functions but warn only once for all of them.
#' @param env The environment in which the deprecated function
#'   was called. A warning is issued if called from the global
#'   environment. If testthat is running, a warning is also called if
#'   the deprecated function was called from the package being tested.
#'
#'   This typically doesn't need to be specified, unless you call
#'   `deprecate_soft()` or `deprecate_warn()` from an internal helper.
#'   In that case, you need to forward the calling environment.
#' @return `NULL`, invisibly.
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
#' # A partially deprecated argument `arg`:
#' deprecate_warn("1.0.0", "foo(arg = 'must be a scalar integer')")
#'
#' # A deprecated function with a function replacement:
#' deprecate_warn("1.0.0", "foo()", "bar()")
#'
#' # A deprecated function with a function replacement from a
#' # different package:
#' deprecate_warn("1.0.0", "foo()", "otherpackage::bar()")
#'
#' # A deprecated function with custom message:
#' deprecate_warn(
#'   when = "1.0.0",
#'   "foo()",
#'   details = "Please use `otherpackage::bar(foo = TRUE)` instead"
#' )
#'
#' # A deprecated function with custom bulleted list:
#' deprecate_warn(
#'   when = "1.0.0",
#'   "foo()",
#'   details = c(
#'     x = "This is dangerous",
#'     i = "Did you mean `safe_foo()` instead?"
#'   )
#' )
#' @export
deprecate_soft <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL,
                           env = caller_env(2)) {
  verbosity <- lifecycle_verbosity()

  if (verbosity == "quiet") {
    return(invisible(NULL))
  }

  if (verbosity %in% c("warning", "error") || env_inherits_global(env)) {
    deprecate_warn(when, what, with = with, details = details, id = id)
    return(invisible(NULL))
  }

  msg <- lifecycle_build_message(when, what, with, details, "deprecate_soft")
  signal(msg, "lifecycle_soft_deprecated")
}

#' @rdname deprecate_soft
#' @export
deprecate_warn <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL,
                           env = caller_env(2)) {
  msg <- lifecycle_build_message(when, what, with, details, "deprecate_warn")
  verbosity <- lifecycle_verbosity()

  id <- id %||% msg
  stopifnot(is_string(id))

  if (verbosity == "quiet") {
    return(invisible(NULL))
  }

  if (verbosity == "default" && !needs_warning(id)) {
    return(invisible(NULL))
  }

  if (verbosity == "error") {
    deprecate_stop(when, what, with = with, details = details)
  }

  if (verbosity == "default") {
    # Prevent warning from being displayed again
    env_poke(deprecation_env, id, Sys.time())

    footer <- paste_line(
      silver("This warning is displayed once every 8 hours."),
      silver("Call `lifecycle::last_warnings()` to see where this warning was generated.")
    )
  } else {
    footer <- NULL
  }

  trace <- trace_back(bottom = caller_env())
  wrn <- new_deprecated_warning(msg, trace, footer = footer)

  # Record muffled warnings if testthat is running because it
  # muffles all warnings but we still want to examine them after a
  # run of `devtools::test()`
  maybe_push_warning <- function() {
    if (Sys.getenv("TESTTHAT_PKG") != "") {
      push_warning(wrn)
    }
  }

  withRestarts(muffleWarning = maybe_push_warning, {
    signalCondition(wrn)
    push_warning(wrn)
    warning(wrn)
  })
}

#' @rdname deprecate_soft
#' @export
deprecate_stop <- function(when,
                           what,
                           with = NULL,
                           details = NULL) {
  msg <- lifecycle_build_message(when, what, with, details, "deprecate_stop")

  stop(cnd(
    c("lifecycle_error_deprecated", "defunctError", "error", "condition"),
    old = NULL,
    new = NULL,
    package = NULL,
    message = msg
  ))
}

lifecycle_build_message <- function(when,
                                    what,
                                    with = NULL,
                                    details = chr(),
                                    signaller) {
  details <- details %||% chr()
  if (length(details) > 1) {
    details <- format_error_bullets(details)
  }

  stopifnot(
    is_string(when),
    is_null(with) || is_string(with),
    is_character(details)
  )

  what <- spec_validate_what(what, "what", signaller)
  fn <- spec_validate_fn(what$call)
  arg <- spec_validate_arg(what$call, signaller)
  reason <- signal_validate_reason(what$call, signaller)

  if (is_null(what$pkg)) {
    env <- topenv(caller_env(2))
    pkg <- signal_validate_pkg(env)
  } else {
    pkg <- what$pkg
  }

  if (is_null(arg)) {
    if (signaller == "deprecate_stop") {
      msg <- glue::glue("`{ fn }()` was deprecated in { pkg } { when } and is now defunct.")
    } else {
      msg <- glue::glue("`{ fn }()` was deprecated in { pkg } { when }.")
    }
  } else {
    if (signaller == "deprecate_stop" && reason == "is deprecated") {
      msg <- glue::glue("The `{ arg }` argument of `{ fn }()` was deprecated in { pkg } { when } and is now defunct.")
    } else {
      msg <- glue::glue("The `{ arg }` argument of `{ fn }()` { reason } as of { pkg } { when }.")
    }
  }

  if (!is_null(with)) {
    with <- spec_validate_what(with, "with", signaller)
    with_fn <- spec_validate_fn(with$call)
    with_arg <- spec_validate_arg(with$call, signaller)

    with_pkg <- with$pkg %||% pkg
    if (!is_null(with_pkg) && pkg != with_pkg) {
      with_fn <- glue::glue("{ with_pkg }::{ with_fn }")
    }

    if (is_null(with_arg)) {
      please <- glue::glue("Please use `{ with_fn }()` instead.")
    } else if (fn == with_fn) {
      please <- glue::glue("Please use the `{ with_arg }` argument instead.")
    } else {
      please <- glue::glue("Please use the `{ with_arg }` argument of `{ with_fn }()` instead.")
    }

    msg <- paste0(msg, "\n", please)
  }

  paste_line(msg, details)
}

signal_validate_pkg <- function(env) {
  if (is_reference(env, global_env())) {
    # Convenient for experimenting interactively
    return("<NA>")
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

# Helpers -----------------------------------------------------------------

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

needs_warning <- function(id) {
  last <- deprecation_env[[id]]
  if (is_null(last)) {
    return(TRUE)
  }

  if (!inherits(last, "POSIXct")) {
    lifecycle_abort("Expected `POSIXct` value in `needs_warning()`.")
  }

  # Warn every 8 hours
  (Sys.time() - last) > (8 * 60 * 60)
}

signal_validate_reason <- function(call, signaller) {
  details <- spec_validate_details(call, signaller)

  if (is_null(details)) {
    "is deprecated"
  } else {
    details
  }
}
