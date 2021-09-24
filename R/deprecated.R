#' Deprecate functions and arguments
#'
#' @description
#' These functions provide three levels of verbosity for deprecated
#' functions. Learn how to use them in `vignette("communicate")`.
#'
#' * `deprecate_soft()` warns only if the deprecated function is
#'   called from the global environment or from the package currently
#'   being tested.
#'
#' * `deprecate_warn()` warns unconditionally.
#'
#' * `deprecate_stop()` fails unconditionally.
#'
#' Warnings are only issued once every 8 hours to avoid overwhelming
#' the user. Control with [`options(lifecycle_verbosity)`][verbosity].
#'
#' @section Conditions:
#' * Deprecation warnings have class `lifecycle_warning_deprecated`.
#' * Deprecation errors have class `lifecycle_error_deprecated`.
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
#' @param with An optional string giving a recommended replacement for the
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
#' @param env,user_env Pair of environments that define where `deprecate_*()`
#'   was called (used to determine the package name) and where the function
#'   called the deprecating function was called (used to determine if
#'   `deprecate_soft()` should message).
#'
#'   These are only needed if you're calling `deprecate_*()` from an internal
#'   helper, in which case you should forward `env = caller_env()` and
#'   `user_env = caller_env(2)`.
#' @return `NULL`, invisibly.
#'
#' @seealso [lifecycle()]
#'
#' @examples
#' # A deprecated function `foo`:
#' deprecate_warn("1.0.0", "foo()")
#'
#' # A deprecated argument `arg`:
#' deprecate_warn("1.0.0", "foo(arg)")
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
#'   what = "foo()",
#'   details = "Please use `otherpackage::bar(foo = TRUE)` instead"
#' )
#'
#' # A deprecated function with custom bulleted list:
#' deprecate_warn(
#'   when = "1.0.0",
#'   what = "foo()",
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
                           env = caller_env(),
                           user_env = caller_env(2)) {
  msg <- NULL # trick R CMD check
  msg %<~~% lifecycle_message(when, what, with, details, env, "deprecate_soft")
  signal_stage("deprecated", what)

  verbosity <- lifecycle_verbosity()
  if (verbosity == "quiet") {
    NULL
  } else if (verbosity %in% "warning" ||
             (is_string(verbosity, "default") && env_inherits_global(user_env))) {
    trace <- trace_back(bottom = caller_env())
    deprecate_warn0(msg, trace)
  } else if (verbosity == "error") {
    deprecate_stop0(msg)
  } else {
    deprecate_soft0(msg)
  }

  invisible(NULL)
}

#' @rdname deprecate_soft
#' @export
deprecate_warn <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL,
                           env = caller_env()) {
  msg <- NULL # trick R CMD check
  msg %<~~% lifecycle_message(when, what, with, details, env, "deprecate_warn")
  signal_stage("deprecated", what)

  verbosity <- lifecycle_verbosity()
  if (verbosity == "quiet") {
    NULL
  } else if (verbosity == "warning") {
    trace <- trace_back(bottom = caller_env())
    deprecate_warn0(msg, trace)
  } else if (verbosity == "error") {
    deprecate_stop0(msg)
  } else {
    id <- id %||% msg

    if (needs_warning(id)) {
      # Prevent warning from being displayed again
      env_poke(deprecation_env, id, Sys.time())

      footer <- paste_line(
        silver("This warning is displayed once every 8 hours."),
        silver("Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.")
      )

      trace <- trace_back(bottom = caller_env())
      deprecate_warn0(msg, trace, footer)
    }
  }

  invisible(NULL)
}

#' @rdname deprecate_soft
#' @export
deprecate_stop <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           env = caller_env()) {
  msg <- NULL # trick R CMD check
  msg %<~~% lifecycle_message(when, what, with, details, env, "deprecate_stop")
  signal_stage("deprecated", what)
  deprecate_stop0(msg)
}

# Signals -----------------------------------------------------------------

deprecate_soft0 <- function(msg) {
  signal(msg, "lifecycle_soft_deprecated")
}

deprecate_warn0 <- function(msg, trace = NULL, footer = NULL) {
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

deprecate_stop0 <- function(msg) {
  stop(cnd(
    c("lifecycle_error_deprecated", "defunctError", "error", "condition"),
    old = NULL,
    new = NULL,
    package = NULL,
    message = msg
  ))
}

# Messages ----------------------------------------------------------------

lifecycle_message <- function(when,
                              what,
                              with = NULL,
                              details = NULL,
                              env = caller_env(2),
                              signaller = "signal_lifecycle") {
  if (!is_string(when)) {
    lifecycle_abort("`when` must be a string")
  }

  details <- details %||% chr()
  if (!is.character(details)) {
    lifecycle_abort("`details` must be a character vector")
  }
  if (length(details) > 1) {
    details <- format_error_bullets(details)
  }

  what <- spec(what, env, signaller)
  msg <- lifecycle_message_what(what, when)

  if (!is_null(with)) {
    with <- spec(with, NULL, signaller)
    msg <- paste0(msg, "\n", lifecycle_message_with(with, what))
  }

  paste_line(msg, details)
}

lifecycle_message_what <- function(what, when) {
  glue_what <- function(x) glue::glue_data(what, x)

  what$fn <- fun_label(what$fn)

  if (is_null(what$arg)) {
    if (what$from == "deprecate_stop") {
      glue_what("{ fn } was deprecated in { pkg } { when } and is now defunct.")
    } else {
      glue_what("{ fn } was deprecated in { pkg } { when }.")
    }
  } else {
    if (what$from == "deprecate_stop" && is_null(what$reason)) {
      glue_what("The `{ arg }` argument of { fn } was deprecated in { pkg } { when } and is now defunct.")
    } else {
      what$reason <- what$reason %||% "is deprecated"
      glue_what("The `{ arg }` argument of { fn } { reason } as of { pkg } { when }.")
    }
  }
}

fun_label <- function(fn) {
  if (grepl("^`", fn)) {
    fn
  } else {
    paste0("`", fn , "()`")
  }
}

lifecycle_message_with <- function(with, what) {
  glue_with <- function(x) glue::glue_data(with, x)

  if (!is_null(with$pkg) && what$pkg != with$pkg) {
    with$fn <- glue_with("{ pkg }::{ fn }")
  }

  if (is_null(with$arg)) {
    glue_with("Please use `{ fn }()` instead.")
  } else if (what$fn == with$fn) {
    glue_with("Please use the `{ arg }` argument instead.")
  } else {
    glue_with("Please use the `{ arg }` argument of `{ fn }()` instead.")
  }
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
  if (!is_string(id)) {
    lifecycle_abort("`id` must be a string")
  }

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
