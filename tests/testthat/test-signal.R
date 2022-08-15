test_that("signal stage captures desired data", {
  f <- function() {
    signal_stage("experimental", "pkg::foo(bar = 'baz')")
  }

  cnd <- expect_condition(f(), class = "lifecycle_stage")
  expect_equal(cnd$stage, "experimental")
  expect_equal(cnd$package, "pkg")
  expect_equal(cnd$function_nm, "foo")
  expect_equal(cnd$argument, "bar")
  expect_equal(cnd$reason, "baz")
})

test_that("signal generates user friendly message", {
  expect_snapshot({
    (expect_condition(signal_stage("experimental", "foo()")))
    (expect_condition(signal_stage("superseded", "foo(bar)")))
  })
})

test_that("signal_stage supports with", {
  expect_snapshot({
    (expect_condition(signal_stage("superseded", "foo()", "bar()")))
    (expect_condition(signal_stage("superseded", "foo(bar=)", "foo(baz=)")))
  })
})
