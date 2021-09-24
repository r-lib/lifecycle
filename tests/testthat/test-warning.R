test_that("deprecation warning is displayed with backtrace", {
  skip_on_cran()
  skip_on_os("windows")

  init_warnings()

  local_options(
    rlang_trace_top_env = current_env(),
    rlang_trace_format_srcrefs = FALSE,
    crayon.enabled = FALSE
  )

  f <- function() g()
  g <- function() h()
  h <- function() deprecate_warn("1.0.0", "trace()")

  expect_deprecated(f())

  expect_snapshot({
    last_lifecycle_warnings()
  })
})
