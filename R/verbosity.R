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
#' * `"quiet"` to suppress all deprecation messages.
#' * `"default"` or `NULL` to warn once every 8 hours.
#' * `"warning"` to warn every time.
#' * `"error"` to error instead of warning.
#'
#' Note that functions calling [deprecate_stop()] invariably throw
#' errors.
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
#'     rlang::local_options(lifecycle_verbosity = "error")
#'     expect_error(mytool(), class = "defunctError")
#'   })
#'
#'   # Or you can enforce silence to safely test that the function
#'   # still works:
#'   test_that("mytool still works", {
#'     rlang::local_options(lifecycle_verbosity = "quiet")
#'     expect_equal(mytool(), 100)
#'   })
#' }
#' @name verbosity
NULL

lifecycle_verbosity <- function() {
  opt <- peek_option("lifecycle_verbosity") %||% "default"

  if (!is_string(opt, c("quiet", "default", "warning", "error"))) {
    options(lifecycle_verbosity = "default")
    warn(glue::glue(
      "
      The `lifecycle_verbosity` option must be set to one of:
      \"quiet\", \"default\", \"warning\", or \"error\".
      Resetting to \"default\".
      "
    ))
  }

  opt
}
