test_that("deprecate_soft() warns when called from global env", {
  local_options(lifecycle_verbosity = NULL)

  fn <- function(id) {
    deprecate_soft("1.0.0", "foo()", id = id)
  }
  expect_no_warning(fn("called from local env"))

  local_bindings(.env = global_env(), fn = fn)
  env_bind_lazy(
    current_env(),
    do = fn("called from global env"),
    .eval_env = global_env()
  )

  expect_deprecated(do, "foo")
})

test_that("deprecate_soft() warns when called from package being tested", {
  old <- Sys.getenv("NOT_CRAN")
  on.exit(Sys.setenv("NOT_CRAN" = old))

  Sys.setenv("NOT_CRAN" = "true")
  retired <- function() deprecate_soft("1.0.0", "foo()")
  expect_warning(retired(), "was deprecated")
})

test_that("deprecate_soft() warns when option is set", {
  retired <- function(id) deprecate_soft("1.0.0", "foo()", id = id)
  with_options(lifecycle_verbosity = "warning", {
    expect_warning(retired("rlang_test5"), "was deprecated")
  })
})

test_that("deprecate_warn() repeats warnings when option is set", {
  local_options(lifecycle_verbosity = "warning")

  retired1 <- function() deprecate_soft("1.0.0", "foo()", id = "signal repeat")
  retired2 <- function() deprecate_warn("1.0.0", "foo()", id = "warn repeat")

  expect_warning(retired1(), "was deprecated")
  expect_warning(retired2(), "was deprecated")

  expect_warning(retired1(), "was deprecated")
  expect_warning(retired2(), "was deprecated")
})

test_that("can promote lifecycle warnings to errors", {
  local_options(lifecycle_verbosity = "error")
  expect_lifecycle_defunct(deprecate_soft("1.0.0", "foo()"), "was deprecated")
  expect_lifecycle_defunct(deprecate_warn("1.0.0", "foo()"), "was deprecated")
})

test_that("soft-deprecation warnings are issued when called from child of global env as well", {
  fn <- function() deprecate_soft("1.0.0", "foo()", id = "child of global env")
  expect_warning(eval_bare(call2(fn), env(global_env())), "was deprecated")
})

test_that("deprecation warnings are not displayed again", {
  local_options(lifecycle_verbosity = NULL)

  wrn <- catch_cnd(
    deprecate_warn("1.0.0", "foo()", id = "once-every-8-hours-note"),
    classes = "warning"
  )
  footer <- wrn$internal$footer
  expect_true(is_string(footer) && grepl("once every 8 hours", footer))

  local_options(lifecycle_verbosity = "warning")

  wrn <- catch_cnd(deprecate_warn("1.0.0", "foo()", id = "once-every-8-hours-no-note"))
  expect_false(grepl("once every 8 hours", wrn$message))
})

test_that("the topenv of the empty env is not the global env", {
  local_options(lifecycle_verbosity = NULL)
  expect_silent(deprecate_soft("1.0.0", "foo()", env = empty_env(), id = "topenv of empty env"))
})

test_that("expect_deprecated() matches regexp", {
  expect_deprecated(deprecate_soft("1.0", "fn()", details = "foo"), "foo")
  expect_deprecated(deprecate_warn("1.0", "fn()", details = "foo.["), "foo.[", fixed = TRUE)

  expect_deprecated(expect_failure(
    expect_deprecated(deprecate_soft("1.0", "fn()"), "foo")
  ))
})
