test_that("signal stage captures desired data", {
  f <- function() {
    signal_stage("experimental", "pkg::foo(bar = 'baz')")
  }

  cnd <- expect_condition(f(), class = "lifecycle_stage")
  data <- lifecycle_stage_cnd_data(cnd)

  expect_equal(data$message, "foo(bar) is experimental")
  expect_equal(data$stage, "experimental")
  expect_equal(data$package, "pkg")
  expect_equal(data$function_nm, "foo")
  expect_equal(data$argument, "bar")
  expect_equal(data$reason, "baz")
})

test_that("signal message emits class name, but no message", {
  # See notes on `conditionMessage.lifecycle_stage()`
  expect_snapshot({
    (expect_condition(signal_stage("experimental", "foo()")))
    (expect_condition(signal_stage("superseded", "foo(bar)")))
  })
})

test_that("`signal_stage()` supports `with`", {
  cnd <- catch_cnd(signal_stage("superseded", "foo()", "bar()"))
  expect_snapshot(lifecycle_stage_cnd_data(cnd)$message)

  cnd <- catch_cnd(signal_stage("superseded", "foo(bar=)", "foo(baz=)"))
  expect_snapshot(lifecycle_stage_cnd_data(cnd)$message)
})

test_that("`signal_experimental()` and `signal_superseded()` are deprecated", {
  expect_snapshot({
    signal_experimental("1.1.0", "foo()")
  })
  expect_snapshot({
    signal_superseded("1.1.0", "foo()")
  })
})
