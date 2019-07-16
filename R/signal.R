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
    .Signal <- stop_defunct
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
stop_defunct <- function(msg) {
  msg <- lifecycle_validate_message(msg)
  err <- cnd(
    c("defunctError", "error", "condition"),
    old = NULL,
    new = NULL,
    package = NULL,
    message = msg
  )
  stop(err)
}

scoped_lifecycle_silence <- function(frame = caller_env()) {
  scoped_options(.frame = frame,
    lifecycle_disable_warnings = TRUE
  )
}
with_lifecycle_silence <- function(expr) {
  scoped_lifecycle_silence()
  expr
}

scoped_lifecycle_warnings <- function(frame = caller_env()) {
  scoped_options(.frame = frame,
    lifecycle_disable_warnings = FALSE,
    lifecycle_verbose_soft_deprecation = TRUE,
    lifecycle_repeat_warnings = TRUE
  )
}
with_lifecycle_warnings <- function(expr) {
  scoped_lifecycle_warnings()
  expr
}

scoped_lifecycle_errors <- function(frame = caller_env()) {
  scoped_lifecycle_warnings(frame = frame)
  scoped_options(.frame = frame,
    lifecycle_warnings_as_errors = TRUE
  )
}
with_lifecycle_errors <- function(expr) {
  scoped_lifecycle_errors()
  expr
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
