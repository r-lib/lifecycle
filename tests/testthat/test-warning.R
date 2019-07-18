
test_that("deprecation warning is displayed with backtrace", {
  skip_on_cran()
  skip_on_os("windows")

  scoped_options(
    rlang_trace_top_env = current_env(),
    rlang_trace_format_srcrefs = FALSE,
    crayon.enabled = FALSE
  )

  f <- function() g()
  g <- function() h()
  h <- function() deprecate_warn("1.0.0", "trace()")

  expect_warning(f(), class = "lifecycle_warning_deprecated")

  expect_known_output(file = test_path("output", "test-warning-backtrace.txt"), {
    cat_ruler("default")
    print(last_warning())

    cat_ruler("full")
    print(last_warning(), simplify = "none")
  })
})
