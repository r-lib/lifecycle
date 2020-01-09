context("verbosity")

test_that("verbosity option is validated", {
  opt <- with_options(lifecycle_verbosity = NULL, lifecycle_verbosity())
  expect_identical(opt, "default")

  expect_warning(
    with_options(lifecycle_verbosity = NA, lifecycle_verbosity()),
    "must be set to one of"
  )
})
