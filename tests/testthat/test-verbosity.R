test_that("verbosity option is validated", {
  opt <- with_options(lifecycle_verbosity = NULL, lifecycle_verbosity())
  expect_identical(opt, "default")

  expect_warning(
    with_options(lifecycle_verbosity = NA, lifecycle_verbosity()),
    "must be set to one of"
  )
})

test_that("verbosity option has precedence over user env (#113)", {
  mytool <- function() {
    deprecate_soft("1.0.0", "mytool()")
    10 * 10
  }

  rlang::local_options(lifecycle_verbosity = "error")

  expect_error(
    exec(mytool, .env = global_env()),
    class = "defunctError"
  )
})

