#' Does expression produce lifecycle warnings or errors?
#'
#' @description
#' These functions are equivalent to [testthat::expect_warning()] and
#' [testthat::expect_error()] but check specifically for lifecycle
#' warnings or errors.
#'
#' To test whether a deprecated feature still works without causing a
#' deprecation warning, set the `lifecycle_verbosity` option to
#' `"quiet"`.
#'
#' ```
#' test_that("feature still works", {
#'   withr::local_options(lifecycle_verbosity = "quiet")
#'   expect_true(my_deprecated_function())
#' })
#' ```
#'
#' @param expr Expression that should produce a lifecycle warning or
#'   error.
#' @param regexp Optional regular expression matched against the
#'   expected warning message.
#' @inheritParams testthat::expect_warning
#'
#' @details
#' `expect_deprecated()` sets the [lifecycle_verbosity][verbosity]
#' option to `"warning"` to enforce deprecation warnings which are
#' otherwise only shown once every 8 hours.
#'
#' @export
expect_deprecated <- function(expr, regexp = NULL, ...) {
  local_options(lifecycle_verbosity = "warning")

  if (!is_null(regexp) && is_na(regexp)) {
    abort("`regexp` can't be `NA`.")
  }

  testthat::expect_warning(
    {{ expr }},
    regexp = regexp,
    class = "lifecycle_warning_deprecated",
    ...
  )
}
#' @rdname expect_deprecated
#' @export
expect_defunct <- function(expr) {
  testthat::expect_error(
    {{ expr }},
    class = "lifecycle_error_deprecated"
  )
}
