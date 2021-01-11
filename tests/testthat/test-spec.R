test_that("feature_spec() builds feature data", {
  expect_identical(
    feature_spec("foo()"),
    spec_data(fn = "foo")
  )
  expect_identical(
    feature_spec("pkg::foo()"),
    spec_data(fn = "foo", pkg = "pkg")
  )

  expect_identical(
    feature_spec("foo(bar = )"),
    spec_data(fn = "foo", arg = "bar")
  )
  expect_identical(
    feature_spec("pkg::foo(bar = )"),
    spec_data(fn = "foo", arg = "bar", pkg = "pkg")
  )

  expect_identical(
    feature_spec("foo(bar = 'baz')"),
    spec_data(fn = "foo", arg = "bar", details = "baz")
  )
  expect_identical(
    feature_spec("pkg::foo(bar = 'baz')"),
    spec_data(fn = "foo", arg = "bar", pkg = "pkg", details = "baz")
  )
})

test_that("feature_spec() gives useful errors", {
  expect_snapshot(feature_spec(1), error = TRUE)
  expect_snapshot(feature_spec("foo"), error = TRUE)
  expect_snapshot(feature_spec("foo()()"), error = TRUE)
  expect_snapshot(feature_spec("foo(arg = , arg = )"), error = TRUE)
  expect_snapshot(feature_spec("foo(arg)"), error = TRUE)
  expect_snapshot(feature_spec("foo(arg = arg)"), error = TRUE)
})

test_that("feature_spec() works with methods", {
  expect_identical(
    feature_spec("A$foo()"),
    spec_data(fn = "A$foo")
  )
  expect_identical(
    feature_spec("A$foo(bar = )"),
    spec_data(fn = "A$foo", arg = "bar")
  )

  expect_snapshot(feature_spec("A$foo(bar)"), error = TRUE)
  expect_snapshot(feature_spec("A$foo(bar = 1)"), error = TRUE)
})
