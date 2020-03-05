
test_that("feature_spec() builds feature data", {
  expect_identical(feature_spec("foo()"), spec_data(fn = "foo"))
  expect_identical(feature_spec("pkg::foo()"), spec_data(fn = "foo", pkg = "pkg"))

  expect_identical(feature_spec("foo(bar = )"), spec_data(fn = "foo", arg = "bar"))
  expect_identical(feature_spec("pkg::foo(bar = )"), spec_data(fn = "foo", arg = "bar", pkg = "pkg"))

  expect_identical(feature_spec("foo(bar = 'baz')"), spec_data(fn = "foo", arg = "bar", details = "baz"))
  expect_identical(feature_spec("pkg::foo(bar = 'baz')"), spec_data(fn = "foo", arg = "bar", pkg = "pkg", details = "baz"))

  verify_errors({
    expect_error(feature_spec("foo"), "")
    expect_error(feature_spec("foo()()"), "")
    expect_error(feature_spec("foo(arg = , arg = )"), "")
    expect_error(feature_spec("foo(arg)"), "")
    expect_error(feature_spec("foo(arg = arg)"), "")
  })
})

test_that("spec.R produces correct error messages", {
  verify_output(test_path("error", "test-spec.txt"), {
    "# feature_spec() builds feature data"
    feature_spec("foo")
    feature_spec("foo()()")
    feature_spec("foo(arg = , arg = )")
    feature_spec("foo(arg)")
    feature_spec("foo(arg = arg)")
  })
})
