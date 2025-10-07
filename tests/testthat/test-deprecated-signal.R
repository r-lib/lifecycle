test_that("signal stage captures desired data", {
  local_options(lifecycle_verbosity = "quiet")

  f <- function() {
    signal_stage("experimental", "pkg::foo(bar = 'baz')")
  }

  cnd <- expect_condition(f(), class = "lifecycle_stage")
  data <- lifecycle_stage_cnd_data(cnd)
  expect_equal(data$stage, "experimental")
  expect_equal(data$package, "pkg")
  expect_equal(data$function_nm, "foo")
  expect_equal(data$argument, "bar")
  expect_equal(data$reason, "baz")
})

test_that("signal generates user friendly message", {
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot({
    (expect_condition(signal_stage("experimental", "foo()")))
    (expect_condition(signal_stage("superseded", "foo(bar)")))
  })
})

test_that("signal_stage supports with", {
  local_options(lifecycle_verbosity = "quiet")

  expect_snapshot({
    (expect_condition(signal_stage("superseded", "foo()", "bar()")))
    (expect_condition(signal_stage("superseded", "foo(bar=)", "foo(baz=)")))
  })
})

test_that("`signal_stage()` and friends are deprecated", {
  expect_snapshot({
    signal_stage("superseded", "foo()", "bar()")
  })
  expect_snapshot({
    signal_experimental("1.1.0", "foo()")
  })
  expect_snapshot({
    signal_superseded("1.1.0", "foo()")
  })
})
