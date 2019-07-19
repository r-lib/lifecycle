#' Control the verbosity of deprecation signals
#'
#' @description
#'
#' There are 3 levels of verbosity for deprecated functions: silence,
#' warning, and error. Which level of verbosity is applicable when you
#' call a deprecated function depends on its lifecycle status, on the
#' context of the caller, and on the state of the session (see the
#' help for [deprecation functions][deprecate_soft]).
#'
#' The default verbosity of deprecated functions can be controlled
#' with global options. You'll generally want to set these options
#' locally with one of these helpers:
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
#' particularly useful in testthat blocks. Whereas `with_` helpers
#' enforce a verbosity level during the evaluation of an expression,
#' `scoped_` helpers enforce a verbosity level for the duration of the
#' enclosing scope.
#'
#' @param expr For `with_` functions, an expression to evaluate with
#'   the verbosity settings.
#' @param frame For `scoped_` functions, the frame environment whose
#'   lifetime determines the duration of the verbosity settings.
#'
#' @examples
#' if (rlang::is_installed("testthat")) {
#'   library(testthat)
#'
#'   mytool <- function() {
#'     deprecate_soft("1.0.0", "mytool()")
#'     10 * 10
#'   }
#'
#'   # Forcing the verbosity level is useful for unit testing. You can
#'   # force errors to test that the function is indeed deprecated:
#'   test_that("mytool is deprecated", {
#'     scoped_lifecycle_errors()
#'     expect_error(mytool(), class = "defunctError")
#'   })
#'
#'   # Or you can enforce silence to safely test that the function
#'   # still works:
#'   test_that("mytool still works", {
#'     scoped_lifecycle_silence()
#'     expect_equal(mytool(), 100)
#'   })
#' }
#'
#' @export
scoped_lifecycle_silence <- function(frame = caller_env()) {
  scoped_options(.frame = frame,
    lifecycle_quiet_warnings = TRUE
  )
}
#' @rdname scoped_lifecycle_silence
#' @export
with_lifecycle_silence <- function(expr) {
  scoped_lifecycle_silence()
  expr
}

#' @rdname scoped_lifecycle_silence
#' @export
scoped_lifecycle_warnings <- function(frame = caller_env()) {
  scoped_options(.frame = frame,
    lifecycle_quiet_warnings = FALSE,
    lifecycle_force_warnings = TRUE
  )
}
#' @rdname scoped_lifecycle_silence
#' @export
with_lifecycle_warnings <- function(expr) {
  scoped_lifecycle_warnings()
  expr
}

#' @rdname scoped_lifecycle_silence
#' @export
scoped_lifecycle_errors <- function(frame = caller_env()) {
  scoped_lifecycle_warnings(frame = frame)
  scoped_options(.frame = frame,
    lifecycle_force_errors = TRUE
  )
}
#' @rdname scoped_lifecycle_silence
#' @export
with_lifecycle_errors <- function(expr) {
  scoped_lifecycle_errors()
  expr
}

