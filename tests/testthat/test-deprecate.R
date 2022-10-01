# lifecycle verbosity -----------------------------------------------------

test_that("default deprecations behave as expected", {
  on.exit(env_unbind(deprecation_env, "test"))
  local_options(lifecycle_verbosity = "default")

  deprecated_feature <- function(...) deprecate_warn("1.0.0", "foo()", with = "bar()", id = "test", ...)
  c(direct, indirect) %<-% new_callers(deprecated_feature)

  expect_snapshot({
    (expect_warning(direct(), class = "lifecycle_warning_deprecated"))
  })
  expect_warning(indirect(), NA)
  expect_warning(indirect(), NA)

  expect_snapshot({
    (expect_defunct(deprecate_stop("1.0.0", "foo()")))
  })
})

test_that("deprecate_warn() only warns repeatedly if always = TRUE", {
  on.exit(env_unbind(deprecation_env, "test"))
  local_options(lifecycle_verbosity = "default")

  deprecated_feature <- function(...) deprecate_warn("1.0.0", "foo()", id = "test", ...)
  c(direct, indirect) %<-% new_callers(deprecated_feature)

  expect_snapshot({
    direct()
    direct()
    indirect()
    indirect()
  })

  expect_snapshot({
    direct(always = TRUE)
    direct(always = TRUE)
    indirect(always = TRUE)
    indirect(always = TRUE)
  })
})

test_that("indirect usage recommends contacting authors", {
  on.exit(env_unbind(deprecation_env, c("test_base", "test_rlang")))
  local_options(lifecycle_verbosity = "default")

  deprecated_feature <- function(..., id) deprecate_warn("1.0.0", "foo()", id = id, ...)
  c(direct, indirect) %<-% new_callers(deprecated_feature)

  # To test for URL
  indirect_rlang <- indirect
  environment(indirect_rlang) <- ns_env("rlang")

  expect_snapshot({
    indirect(id = "test_base")
    indirect_rlang(id = "test_rlang")
  })
})

test_that("quiet suppresses _soft and _warn", {
  local_options(lifecycle_verbosity = "quiet")

  expect_warning(deprecate_soft("1.0.0", "foo()"), NA)
  expect_warning(deprecate_warn("1.0.0", "foo()"), NA)
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("warning always warns in _soft and _warn", {
  local_options(lifecycle_verbosity = "warning")

  expect_deprecated(deprecate_warn("1.0.0", "foo()"))
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("error coverts _soft and _warn to errors", {
  local_options(lifecycle_verbosity = "error")

  expect_defunct(deprecate_soft("1.0.0", "foo()"))
  expect_defunct(deprecate_warn("1.0.0", "foo()"))
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("soft deprecation uses correct calling envs", {
  withr::local_envvar(TESTTHAT_PKG = "testpackage")

  # Simulate package functions available from global environment
  env <- new_environment(parent = ns_env("lifecycle"))
  local(envir = env, {
    softly <- function() {
      deprecate_soft("1.0.0", "softly()")
    }
    softly_softly <- function() {
      softly()
    }
  })
  local_bindings(!!!as.list(env), .env = global_env())

  # Calling package function directly should warn
  cnd <- catch_cnd(evalq(softly(), global_env()), "warning")
  expect_s3_class(cnd, class = "lifecycle_warning_deprecated")
  expect_match(conditionMessage(cnd), "lifecycle")

  # Calling package function indirectly from global env shouldn't
  cnd <- catch_cnd(evalq(softly_softly(), global_env()), "warning")
  expect_equal(cnd, NULL)
})

test_that("warning conditions are signaled only once if warnings are suppressed", {
  local_options(lifecycle_verbosity = "warning")

  deprecated_feature <- function(...) deprecate_warn(...)
  c(direct, indirect) %<-% new_callers(deprecated_feature)

  x <- 0L
  suppressWarnings(withCallingHandlers(
    warning = function(...) x <<- x + 1L, {
      direct("1.0.0", "foo()")
      indirect("1.0.0", "foo()")
    }
  ))

  expect_identical(x, 1L)
})

# messaging ---------------------------------------------------------------

test_that("what deprecation messages are readable", {
  expect_snapshot({
    cat_line(lifecycle_message("1.0.0", "foo()"))
    cat_line(lifecycle_message("1.0.0", "foo()", signaller = "deprecate_stop"))
    cat_line(lifecycle_message("1.0.0", "foo(arg)"))
    cat_line(lifecycle_message("1.0.0", "foo(arg)", signaller = "deprecate_stop"))
    cat_line(lifecycle_message("1.0.0", I("Use of bananas")))
    cat_line(lifecycle_message("1.0.0", I("Use of bananas"), signaller = "deprecate_stop"))
  })
})

test_that("replace deprecation messages are readable", {
  expect_snapshot({
    cat_line(lifecycle_message("1.0.0", "foo()", "package::bar()"))

    cat_line(lifecycle_message("1.0.0", "foo()", "bar()"))
    cat_line(lifecycle_message("1.0.0", "foo(arg1)", "foo(arg2)"))
    cat_line(lifecycle_message("1.0.0", "foo(arg)", "bar(arg)"))

    cat_line(lifecycle_message("1.0.0", I("Use of bananas"), I("apples")))
  })
})

test_that("unusual names are handled gracefully", {
  expect_snapshot({
    cat_line(lifecycle_message("1.0.0", "`foo-fy`(`qu-ux` = )"))
    cat_line(lifecycle_message("1.0.0", "`foo<-`()"))
    cat_line(lifecycle_message("1.0.0", "`+`()"))
  })
})

test_that("details uses an info bullet by default", {
  on.exit(env_unbind(deprecation_env, "test"))
  expect_snapshot({
    deprecate_warn(
      "1.0.0", "foo()",
      details = "Please do that instead.",
      id = "test"
    )
  })

  env_unbind(deprecation_env, "test")
  expect_snapshot({
    deprecate_warn(
      "1.0.0", "foo()",
      details = c("Please do that instead.", "Also know that."),
      id = "test"
    )
  })
})

test_that("can use bullets in details ", {
  on.exit(env_unbind(deprecation_env, "test"))
  expect_snapshot({
    deprecate_warn(
      "1.0.0", "foo()",
      details = c(
        "Unnamed",
        i = "Informative",
        x = "Error"
      ),
      id = "test"
    )
  })
})

test_that("checks input types", {
  expect_snapshot(lifecycle_message(1), error = TRUE)
  expect_snapshot(lifecycle_message("1", details = 1), error = TRUE)
})

# helpers -----------------------------------------------------------------

test_that("env_inherits_global works for simple cases", {
  expect_false(env_inherits_global(empty_env()))

  env <- new_environment(parent = global_env())
  expect_true(env_inherits_global(env))
})

test_that("needs_warning works as expected", {
  on.exit(env_unbind(deprecation_env, "test"))

  expect_snapshot(needs_warning(1), error = TRUE)
  expect_true(needs_warning("test"))

  env_poke(deprecation_env, "test", Sys.time())
  expect_false(needs_warning("test"))

  env_poke(deprecation_env, "test", Sys.time() - 9 * 60 * 60)
  expect_false(needs_warning("test"))

  env_poke(deprecation_env, "test", "x")
  expect_snapshot_error(needs_warning("test"))
})
