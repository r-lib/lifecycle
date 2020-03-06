context("lifecycle")

test_that("deprecate_soft() warns when called from global env", {
  old <- Sys.getenv("TESTTHAT_PKG")
  Sys.setenv("TESTTHAT_PKG" = "")
  on.exit(Sys.setenv("TESTTHAT_PKG" = old))

  fn <- function(id) deprecate_soft("1.0.0", "foo()", id = id)
  scoped_bindings(.env = global_env(), fn = fn)

  locally(
    expect_no_warning(fn("called from local env"))
  )

  with_options(lifecycle_verbosity = "default", {
    with_env(global_env(), {
      expect_warning(fn("called from global env"), "foo")
    })
  })
})

test_that("deprecate_soft() warns when called from package being tested", {
  old <- Sys.getenv("NOT_CRAN")
  on.exit(Sys.setenv("NOT_CRAN" = old))

  Sys.setenv("NOT_CRAN" = "true")
  retired <- function() deprecate_soft("1.0.0", "foo()")
  expect_warning(retired(), "is deprecated")
})

test_that("deprecate_soft() warns when option is set", {
  retired <- function(id) deprecate_soft("1.0.0", "foo()", id = id)
  with_options(lifecycle_verbosity = "warning", {
    expect_warning(retired("rlang_test5"), "is deprecated")
  })
})

test_that("deprecate_warn() repeats warnings when option is set", {
  scoped_options(lifecycle_verbosity = "warning")

  retired1 <- function() deprecate_soft("1.0.0", "foo()", id = "signal repeat")
  retired2 <- function() deprecate_warn("1.0.0", "foo()", id = "warn repeat")

  expect_warning(retired1(), "is deprecated")
  expect_warning(retired2(), "is deprecated")

  expect_warning(retired1(), "is deprecated")
  expect_warning(retired2(), "is deprecated")
})

test_that("can promote lifecycle warnings to errors", {
  scoped_options(lifecycle_verbosity = "error")
  expect_defunct(deprecate_soft("1.0.0", "foo()"), "is deprecated")
  expect_defunct(deprecate_warn("1.0.0", "foo()"), "is deprecated")
})

test_that("soft-deprecation warnings are issued when called from child of global env as well", {
  fn <- function() deprecate_soft("1.0.0", "foo()", id = "child of global env")
  expect_warning(eval_bare(call2(fn), env(global_env())), "is deprecated")
})

test_that("deprecation warnings are not displayed again", {
  wrn <- catch_cnd(deprecate_warn("1.0.0", "foo()", id = "once-every-8-hours-note"))
  expect_true(grepl("once every 8 hours", wrn$message))

  scoped_options(lifecycle_verbosity = "warning")

  wrn <- catch_cnd(deprecate_warn("1.0.0", "foo()", id = "once-every-8-hours-no-note"))
  expect_false(grepl("once every 8 hours", wrn$message))
})

test_that("the topenv of the empty env is not the global env", {
  expect_silent(deprecate_soft("1.0.0", "foo()", env = empty_env(), id = "topenv of empty env"))
})
