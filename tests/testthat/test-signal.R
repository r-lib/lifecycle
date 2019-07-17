context("signal")

test_that("signallers require function call syntax for `what`", {
  expect_error(stop_defunct("1.0.0", "foo"), "must have function call syntax")
  expect_error(stop_defunct("1.0.0", "foo()()"), "must refer to a function name")
  expect_error(stop_defunct("1.0.0", "foo(arg = , arg = )"), "more than one argument")
  expect_error(stop_defunct("1.0.0", "foo(arg)"), "in the LHS")
  expect_error(stop_defunct("1.0.0", "foo(arg = arg)"), "in the LHS")
})

test_that("deprecation messages are constructed", {
  expect_known_output(file = test_path("output", "test-signal-message.txt"), {
    cat_line(c(
      "Normal:\n",
      lifecycle_build_message("1.0.0", "foo()", chr(), "stop_defunct")
    ))
  })
})
