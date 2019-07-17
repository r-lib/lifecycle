context("signal")

test_that("signallers require function call syntax for `what`", {
  expect_error(stop_defunct("1.0.0", "foo"), "must have function call syntax")
  expect_error(stop_defunct("1.0.0", "foo()()"), "must refer to a function name")
  expect_error(stop_defunct("1.0.0", "foo(arg = , arg = )"), "more than one argument")
  expect_error(stop_defunct("1.0.0", "foo(arg)"), "in the LHS")
  expect_error(stop_defunct("1.0.0", "foo(arg = arg)"), "in the LHS")
})

test_that("deprecation messages are constructed for functions", {
  expect_known_output(file = test_path("output", "test-signal-message.txt"), {
    cat_ruler("Inferred package name (here it is base b/c of testthat's eval env)")
    cat_line(lifecycle_build_message("1.0.0", "foo()", signaller = "stop_defunct"))

    cat_ruler("Overridden package name")
    cat_line(lifecycle_build_message("1.0.0", "mypkg::foo()", signaller = "stop_defunct"))

    cat_ruler("Replacement function")
    cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", signaller = "stop_defunct"))

    cat_ruler("Replacement function with overridden package names (1)")
    cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "foofy()", signaller = "stop_defunct"))

    cat_ruler("Replacement function with overridden package names (2)")
    cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "bar::foofy()", signaller = "stop_defunct"))

    cat_ruler("Details")
    details <- glue::glue(
      "

        # Before:
        foo()

        # After:
        bar()
      "
    )
    cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", details = details, signaller = "stop_defunct"))
  })
})

test_that("deprecation messages are constructed for arguments", {
  expect_known_output(file = test_path("output", "test-signal-message-args.txt"), {
    cat_ruler("Deprecated argument")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", signaller = "stop_defunct"))

    cat_ruler("Deprecated argument with function replacement")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar()", signaller = "stop_defunct"))

    cat_ruler("Deprecated argument with argument replacement (same function)")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "foo(foofy = )", signaller = "stop_defunct"))

    cat_ruler("Deprecated argument with argument replacement (different function)")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar(foofy = )", signaller = "stop_defunct"))

    cat_ruler("Deprecated argument with argument replacement (different function, different package)")
    cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = )", "zzz::bar(foofy = )", signaller = "stop_defunct"))
  })
})
