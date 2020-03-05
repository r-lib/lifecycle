test_that("signallers require function call syntax for `what`", {
  verify_errors({
    expect_error(deprecate_stop("1.0.0", "foo"), "must have function call syntax")
    expect_error(deprecate_stop("1.0.0", "foo()()"), "must refer to a function name")
    expect_error(deprecate_stop("1.0.0", "foo(arg = , arg = )"), "more than one argument")
    expect_error(deprecate_stop("1.0.0", "foo(arg)"), "in the LHS")
    expect_error(deprecate_stop("1.0.0", "foo(arg = arg)"), "in the LHS")
  })
})

test_that("deprecation messages are constructed for functions", {
  expect_known_output(file = test_path("output", "test-signal-message.txt"), {
    cat_ruler("Inferred package name (here it is base b/c of testthat's eval env)")
    cat_line(lifecycle_build_message("1.0.0", "foo()", signaller = "deprecate_stop"))

    cat_ruler("Overridden package name")
    cat_line(lifecycle_build_message("1.0.0", "mypkg::foo()", signaller = "deprecate_stop"))

    cat_ruler("Replacement function")
    cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", signaller = "deprecate_stop"))

    cat_ruler("Replacement function with overridden package names (1)")
    cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "foofy()", signaller = "deprecate_stop"))

    cat_ruler("Replacement function with overridden package names (2)")
    cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "bar::foofy()", signaller = "deprecate_stop"))

    cat_ruler("Details")
    details <- glue::glue(
      "

        # Before:
        foo()

        # After:
        bar()
      "
    )
    cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", details = details, signaller = "deprecate_stop"))
  })
})

test_that("deprecation messages are constructed for arguments", {
  expect_known_output(file = test_path("output", "test-signal-message-args.txt"), {
    cat_ruler("Deprecated argument")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", signaller = "deprecate_stop"))

    cat_ruler("Deprecated argument with function replacement")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar()", signaller = "deprecate_stop"))

    cat_ruler("Deprecated argument with argument replacement (same function)")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "foo(foofy = )", signaller = "deprecate_stop"))

    cat_ruler("Deprecated argument with argument replacement (different function)")
    cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar(foofy = )", signaller = "deprecate_stop"))

    cat_ruler("Deprecated argument with argument replacement (different function, different package)")
    cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = )", "zzz::bar(foofy = )", signaller = "deprecate_stop"))

    cat_ruler("Deprecated argument with reason")
    cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = 'can\\'t be a baz')", signaller = "deprecate_stop"))
  })
})

test_that("non-syntactic names are handled gracefully", {
  expect_known_output(file = test_path("output", "test-signal-message-non-syntactic.txt"), {
    cat_ruler("Non-syntactic function name and non-syntactic parameter name")
    cat_line(lifecycle_build_message("1.0.0", "bar::`foo-fy`(`qu-ux` = )", signaller = "deprecate_stop"))
  })
})

test_that("defunct errors inherit from lifecycle subclass", {
  expect_error(deprecate_stop("1.0.0", "foo()"), class = "lifecycle_error_deprecated")
})

test_that("warning conditions are signaled only once if warnings are suppressed", {
  scoped_options(lifecycle_verbosity = "warning")

  x <- 0L
  suppressWarnings(withCallingHandlers(
    warning = function(...) x <<- x + 1L,
    deprecate_warn("1.0.0", "foo()")
  ))

  expect_identical(x, 1L)
})

test_that("signal-deprecated.R produces correct error messages", {
  verify_output(test_path("error", "test-signal-deprecated.txt"), {
    "# signallers require function call syntax for `what`"
    deprecate_stop("1.0.0", "foo")
    deprecate_stop("1.0.0", "foo()()")
    deprecate_stop("1.0.0", "foo(arg = , arg = )")
    deprecate_stop("1.0.0", "foo(arg)")
    deprecate_stop("1.0.0", "foo(arg = arg)")
  })
})
