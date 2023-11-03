#' Deprecate functions and arguments
#'
#' @description
#' These functions provide three levels of verbosity for deprecated
#' functions. Learn how to use them in `vignette("communicate")`.
#'
#' * `deprecate_soft()` warns only if the deprecated function is called
#'   directly, i.e. a user is calling a function they wrote in the global
#'   environment or a developer is calling it in their package. It does not
#'   warn when called indirectly, i.e. the deprecation comes from code that
#'   you don't control.
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
#'   * Deprecate anything else with a custom message by wrapping it in `I()`.
#'
#'   You can optionally supply the namespace: `"ns::foo()"`, but this is
#'   usually not needed as it will be inferred from the caller environment.
#'
#' @param with An optional string giving a recommended replacement for the
#'   deprecated behaviour. This takes the same form as `what`.
#' @param details In most cases the deprecation message can be
#'   automatically generated from `with`. When it can't, use `details`
#'   to provide a hand-written message.
#'
#'   `details` can either be a single string or a character vector,
#'   which will be converted to a [bulleted list][cli::cli_bullets].
#'   By default, info bullets are used. Provide a named vectors to
#'   override.
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
  msg %<~% lifecycle_message(when, what, with, details, env, signaller = "deprecate_soft")
  signal_stage("deprecated", what)

  verbosity <- lifecycle_verbosity()
  direct <- is_direct(user_env)

  invisible(switch(
    verbosity,
    quiet = NULL,
    warning = ,
    default =
      if (direct) {
        always <- verbosity == "warning"
        trace_env <- caller_env()
        deprecate_warn0(
          msg,
          id,
          always = always,
          direct = TRUE,
          trace_env = trace_env,
          user_env = user_env
        )
      },
    error = deprecate_stop0(msg)
  ))
}

#' @rdname deprecate_soft
#' @param always If `FALSE`, the default, will warn every 8 hours.  If
#'   `TRUE`, will always warn in direct usages. Indirect usages keep
#'   warning every 8 hours to avoid disrupting users who can't fix the
#'   issue. Only use `always = TRUE` after at least one release with
#'   the default.
#' @export
deprecate_warn <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           id = NULL,
                           always = FALSE,
                           env = caller_env(),
                           user_env = caller_env(2)) {
  msg <- NULL # trick R CMD check
  msg %<~% lifecycle_message(when, what, with, details, env, signaller = "deprecate_warn")
  signal_stage("deprecated", what)

  verbosity <- lifecycle_verbosity()

  invisible(switch(
    verbosity,
    quiet = NULL,
    warning = ,
    default = {
      direct <- is_direct(user_env)
      always <- direct && (always || verbosity == "warning")
      trace_env <- caller_env()
      deprecate_warn0(
        msg,
        id,
        always = always,
        direct = direct,
        trace_env = trace_env,
        user_env = user_env
      )
    },
    error = deprecate_stop0(msg),
  ))
}

#' @rdname deprecate_soft
#' @export
deprecate_stop <- function(when,
                           what,
                           with = NULL,
                           details = NULL,
                           env = caller_env()) {
  msg <- NULL # trick R CMD check
  msg %<~% lifecycle_message(when, what, with, details, env, signaller =  "deprecate_stop")
  signal_stage("deprecated", what)
  deprecate_stop0(msg)
}

# Signals -----------------------------------------------------------------

deprecate_warn0 <- function(msg,
                            id = NULL,
                            always = FALSE,
                            direct = FALSE,
                            call = caller_env(),
                            trace_env = caller_env(),
                            user_env = caller_env(2)) {
  id <- id %||% paste_line(msg)
  if (!always && !needs_warning(id, call = call)) {
    return()
  }

  # Prevent warning from being displayed again
  env_poke(deprecation_env, id, Sys.time())

  footer <- function(...) {
    footer <- NULL

    if (!direct) {
      top <- topenv(user_env)

      if (is_namespace(top)) {
        pkg <- ns_env_name(top)
        url <- pkg_url_bug(pkg)

        likely_line <- cli::format_inline(
          "The deprecated feature was likely used in the {.pkg {pkg}} package."
        )

        if (is_null(url)) {
          report_line <-
            "Please report the issue to the authors."
        } else {
          report_line <- cli::format_inline(
            "Please report the issue at {.url {url}}."
          )
        }

        footer <- c(
          footer,
          "i" = likely_line,
          " " = report_line
        )
      }
    }

    if (is_interactive()) {
      footer <- c(
        footer,
        if (!always) silver("This warning is displayed once every 8 hours."),
        silver("Call `lifecycle::last_lifecycle_warnings()` to see where this warning was generated.")
      )
    }

    footer
  }

  trace <- trace_back(bottom = trace_env)

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
  cnd_signal(error_cnd(
    c("lifecycle_error_deprecated", "defunctError"),
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
                              call = caller_env(),
                              signaller = "signal_lifecycle") {
  check_string(when, call = call)

  if (is_null(details)) {
    details <- chr()
  } else {
    check_character(details, call = call)
  }

  what <- spec(what, env, signaller = signaller)
  msg <- lifecycle_message_what(what, when)

  if (!is_null(with)) {
    with <- spec(with, NULL, signaller = signaller)
    msg <- c(msg, "i" = lifecycle_message_with(with, what))
  }

  if (is_null(names(details))) {
    details <- set_names(details, "i")
  }

  c(msg, details)
}

lifecycle_message_what <- function(what, when) {
  glue_what <- function(x) glue::glue_data(what, x)

  if (!inherits(what$fn, "AsIs")) {
    what$fn <- fun_label(what$fn)
  }

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
    paste0("`", fn, "()`")
  }
}

lifecycle_message_with <- function(with, what) {
  glue_with <- function(x) glue::glue_data(with, x)

  if (inherits(with$fn, "AsIs")) {
    glue_with("Please use { fn } instead.")
  } else {
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
}

# Helpers -----------------------------------------------------------------

is_direct <- function(env) {
  env_inherits_global(env) || from_testthat(env)
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

# TRUE if we are in unit tests and the package being tested is the
# same as the package that called
from_testthat <- function(env) {
  tested_package <- Sys.getenv("TESTTHAT_PKG")
  if (!nzchar(tested_package)) {
    return(FALSE)
  }

  top <- topenv(env)
  if (!is_namespace(top)) {
    return(FALSE)
  }

  # Test for environment names rather than reference/contents because
  # testthat clones the namespace
  identical(ns_env_name(top), tested_package)
}

needs_warning <- function(id, call = caller_env()) {
  check_string(id, call = call)

  last <- deprecation_env[[id]]
  if (is_null(last)) {
    return(TRUE)
  }

  if (!inherits(last, "POSIXct")) {
    abort(
      "Expected `POSIXct` value in `needs_warning()`.",
      .internal = TRUE
    )
  }

  # Warn every 8 hours
  (Sys.time() - last) > (8 * 60 * 60)
}
