test_that("expect_deprecated() expects lifecycle warnings", {
  fn <- function() deprecate_warn("1.0", "pkg::foo()", id = "expect-deprecated")
  expect_success(expect_deprecated(fn()))
  expect_success(expect_deprecated(fn()))
  expect_failure(expect_deprecated(NULL))
})

test_that("expect_defunct() expects lifecycle errors", {
  fn <- function() deprecate_stop("1.0", "pkg::foo()")
  expect_success(expect_defunct(fn()))
  expect_failure(expect_defunct(NULL))
})
