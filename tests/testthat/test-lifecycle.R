context("lifecycle")

test_that("signal_soft_deprecated() warns when called from global env", {
  old <- Sys.getenv("TESTTHAT_PKG")
  Sys.setenv("TESTTHAT_PKG" = "")
  on.exit(Sys.setenv("TESTTHAT_PKG" = old))

  retired <- function(id) signal_soft_deprecated("1.0.0", "foo()", id = id)
  env_bind(global_env(), retired = retired)
  on.exit(env_unbind(global_env(), "retired"), add = TRUE)

  with_options(lifecycle_verbose_soft_deprecation = FALSE, {
    locally({
      expect_no_warning(retired("rlang_test3"), "foo")
    })
  })

  with_options(lifecycle_verbose_soft_deprecation = FALSE, {
    with_env(global_env(), {
      expect_warning(retired("rlang_test4"), "foo")
    })
  })
})

test_that("signal_soft_deprecated() warns when called from package being tested", {
  Sys.setenv("NOT_CRAN" = "true")
  on.exit(Sys.setenv("NOT_CRAN" = ""))
  retired <- function() signal_soft_deprecated("1.0.0", "foo()")
  expect_warning(retired(), "is deprecated")
})

test_that("signal_soft_deprecated() warns when option is set", {
  retired <- function(id) signal_soft_deprecated("1.0.0", "foo()", id = id)
  with_options(lifecycle_verbose_soft_deprecation = TRUE, {
    expect_warning(retired("rlang_test5"), "is deprecated")
  })
})

test_that("warn_deprecated() repeats warnings when option is set", {
  scoped_options(lifecycle_verbose_soft_deprecation = TRUE)

  retired1 <- function() signal_soft_deprecated("1.0.0", "foo()", id = "signal repeat")
  retired2 <- function() warn_deprecated("1.0.0", "foo()", id = "warn repeat")

  expect_warning(retired1(), "is deprecated")
  expect_warning(retired2(), "is deprecated")

  expect_no_warning(retired1())
  expect_no_warning(retired2())

  scoped_options(lifecycle_repeat_warnings = TRUE)
  expect_warning(retired1(), "is deprecated")
  expect_warning(retired2(), "is deprecated")
})

test_that("lifecycle warnings helper enable warnings", {
  retired1 <- function() signal_soft_deprecated("1.0.0", "foo()")
  retired2 <- function() warn_deprecated("1.0.0", "foo()")

  with_options(
    lifecycle_disable_warnings = TRUE,
    {
      evalq({
        scoped_lifecycle_warnings()
        expect_warning(retired1(), "is deprecated")
        expect_warning(retired1(), "is deprecated")
        expect_warning(retired2(), "is deprecated")
        expect_warning(retired2(), "is deprecated")
      })
    }
  )
})

test_that("can disable lifecycle warnings", {
  scoped_lifecycle_silence()
  scoped_options(
    lifecycle_verbose_soft_deprecation = TRUE,
    lifecycle_repeat_warnings = TRUE
  )

  expect_no_warning(signal_soft_deprecated("1.0.0", "foo()"))
  expect_no_warning(warn_deprecated("1.0.0", "foo()"))
})

test_that("can promote lifecycle warnings to errors", {
  scoped_lifecycle_errors()
  expect_defunct(signal_soft_deprecated("1.0.0", "foo()"), "is deprecated")
  expect_defunct(warn_deprecated("1.0.0", "foo()"), "is deprecated")
})

test_that("can enable warnings and errors with `with_` helpers", {
  expect_warning(with_lifecycle_warnings(signal_soft_deprecated("1.0.0", "foo()")), "foo")
  expect_defunct(with_lifecycle_errors(signal_soft_deprecated("1.0.0", "foo()")), "foo")
  expect_no_warning(with_lifecycle_warnings(with_lifecycle_silence(warn_deprecated("1.0.0", "foo()"))))
})

test_that("soft-deprecation warnings are issued when called from child of global env as well", {
  fn <- function() signal_soft_deprecated("1.0.0", "foo()", id = "child of global env")
  expect_warning(eval_bare(call2(fn), env(global_env())), "is deprecated")
})

test_that("once-per-session note is not displayed on repeated warnings", {
  wrn <- catch_cnd(warn_deprecated("1.0.0", "foo()", id = "once-per-session-note"))
  expect_true(grepl("once per session", wrn$message))

  scoped_options(lifecycle_repeat_warnings = TRUE)

  wrn <- catch_cnd(warn_deprecated("1.0.0", "foo()", id = "once-per-session-no-note"))
  expect_false(grepl("once per session", wrn$message))
})

test_that("inputs are type checked", {
  expect_error(signal_soft_deprecated(1), "is_string")
  expect_error(warn_deprecated(1), "is_string")
  expect_error(stop_defunct(1), "is_string")
})

test_that("the topenv of the empty env is not the global env", {
  expect_silent(signal_soft_deprecated("1.0.0", "foo()", env = empty_env(), id = "topenv of empty env"))
})
