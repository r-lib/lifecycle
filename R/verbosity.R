#' Control the verbosity of deprecation signals
#'
#' @description
#'
#' There are 3 levels of verbosity for deprecated functions: silence,
#' warning, and error. Since the lifecycle package avoids disruptive
#' warnings, the default level of verbosity depends on the lifecycle
#' stage of the deprecated function, on the context of the caller
#' (global environment or testthat unit tests cause more warnings),
#' and whether the warning was already issued (see the help for
#' [deprecation functions][deprecate_soft]).
#'
#' You can control the level of verbosity with the global option
#' `lifecycle_verbosity`. It can be set to:
#'
#' * `"default"` or `NULL` for the default non-disruptive settings.
#'
#' * `"quiet"`, `"warning"` or `"error"` to force silence, warnings or
#'   errors for deprecated functions.
#'
#' Note that functions calling [deprecate_stop()] invariably throw
#' errors.
#'
#' You'll generally want to set these options locally with one of
#' these helpers:
#'
#' * `with_lifecycle_silence()`
#'
#' * `with_lifecycle_warnings()`
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
  scoped_lifecycle("quiet", frame = frame)
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
  scoped_lifecycle("warning", frame = frame)
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
  scoped_lifecycle("error", frame = frame)
}
#' @rdname scoped_lifecycle_silence
#' @export
with_lifecycle_errors <- function(expr) {
  scoped_lifecycle_errors()
  expr
}

lifecycle_verbosity <- function() {
  opt <- peek_option("lifecycle_verbosity") %||% "default"

  if (!is_string(opt, c("quiet", "default", "warning", "error"))) {
    options(lifecycle_verbosity = "default")
    abort(glue::glue(
      "
      The `lifecycle_verbosity` option must be set to one of:
      \"quiet\", \"default\", \"warning\", or \"error\".
      "
    ))
  }

  opt
}

with_lifecycle <- function(stage, expr) {
  scoped_options(lifecycle_verbosity = stage)
  expr
}
scoped_lifecycle <- function(stage, frame = caller_env()) {
  scoped_options(lifecycle_verbosity = stage, .frame = frame)
}
