test_that("spec() builds feature data", {
  expect_identical(
    spec("foo()"),
    spec_data(fn = "foo")
  )
  expect_identical(
    spec("pkg::foo()"),
    spec_data(fn = "foo", pkg = "pkg")
  )

  expect_identical(
    spec("foo(bar)"),
    spec_data(fn = "foo", arg = "bar")
  )
  expect_identical(
    spec("foo(bar = )"),
    spec_data(fn = "foo", arg = "bar")
  )
  expect_identical(
    spec("pkg::foo(bar = )"),
    spec_data(fn = "foo", arg = "bar", pkg = "pkg")
  )

  expect_identical(
    spec("foo(bar = 'baz')"),
    spec_data(fn = "foo", arg = "bar", reason = "baz")
  )
  expect_identical(
    spec("pkg::foo(bar = 'baz')"),
    spec_data(fn = "foo", arg = "bar", pkg = "pkg", reason = "baz")
  )
})

test_that("spec() gives useful errors", {
  expect_snapshot(spec(1), error = TRUE)
  expect_snapshot(spec("foo"), error = TRUE)
  expect_snapshot(spec("foo()()"), error = TRUE)
  expect_snapshot(spec("foo(arg = , arg = )"), error = TRUE)
  expect_snapshot(spec("foo(arg = arg)"), error = TRUE)

  e <- new_environment()
  local_options(topLevelEnvironment = e)
  expect_snapshot(spec("foo()", env = e), error = TRUE)
})

test_that("spec() works with methods", {
  expect_identical(
    spec("A$foo()"),
    spec_data(fn = "A$foo")
  )
  expect_identical(
    spec("A$foo(bar = )"),
    spec_data(fn = "A$foo", arg = "bar")
  )

  expect_snapshot(spec("A$foo(bar = 1)"), error = TRUE)
})
