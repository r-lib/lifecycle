
test_that("deprecation warning is displayed with backtrace", {
  skip_on_cran()
  skip_on_os("windows")

  init_warnings()

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

test_that("deprecation warnings are not recorded unless they are handled", {
  init_warnings()

  f <- function() list(g(), catch_cnd(h()))
  g <- function() deprecate_warn("1.0.0", "recorded()")
  h <- function() deprecate_warn("1.0.0", "not_recorded()")
  expect_warning(f())

  wrns <- last_warnings()
  expect_length(wrns, 1)
  expect_match(wrns[[1]]$message, "`recorded()`", fixed = TRUE)
})
