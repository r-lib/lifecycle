# lifecycle verbosity -----------------------------------------------------

test_that("deprecation functions generate expected signals", {
  local_options(lifecycle_verbosity = "warning")

  expect_deprecated(deprecate_soft("1.0.0", "foo()"))
  expect_deprecated(deprecate_warn("1.0.0", "foo()"))
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("quiet suppresses _soft and _warn", {
  local_options(lifecycle_verbosity = "quiet")

  expect_warning(deprecate_soft("1.0.0", "foo()"), NA)
  expect_warning(deprecate_warn("1.0.0", "foo()"), NA)
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("error coverts _soft and _warn to errors", {
  local_options(lifecycle_verbosity = "error")

  expect_defunct(deprecate_soft("1.0.0", "foo()"))
  expect_defunct(deprecate_warn("1.0.0", "foo()"))
  expect_defunct(deprecate_stop("1.0.0", "foo()"))
})

test_that("warning conditions are signaled only once if warnings are suppressed", {
  local_options(lifecycle_verbosity = "warning")

  x <- 0L
  suppressWarnings(withCallingHandlers(
    warning = function(...) x <<- x + 1L,
    deprecate_warn("1.0.0", "foo()")
  ))

  expect_identical(x, 1L)
})

# messaging ---------------------------------------------------------------

test_that("deprecation messages are constructed for functions", {
  expect_snapshot({
    # https://github.com/r-lib/rlang/issues/1087
    NULL

    {
      "Inferred package name (here it is base b/c of testthat's eval env)"
      cat_line(lifecycle_build_message("1.0.0", "foo()", signaller = "deprecate_stop"))
    }

    {
      "Overridden package name"
      cat_line(lifecycle_build_message("1.0.0", "mypkg::foo()", signaller = "deprecate_stop"))
    }

    {
      "Replacement function"
      cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", signaller = "deprecate_stop"))
    }

    {
      "Replacement function with overridden package names (1)"
      cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "foofy()", signaller = "deprecate_stop"))
    }

    {
      "Replacement function with overridden package names (2)"
      cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "bar::foofy()", signaller = "deprecate_stop"))
    }

    {
      details <- glue::glue(
        "

        # Before:
        foo()

        # After:
        bar()
      "
      )
      cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", details = details, signaller = "deprecate_stop"))
    }
  })
})

test_that("deprecation messages are constructed for arguments", {
  expect_snapshot({
    # https://github.com/r-lib/rlang/issues/1087
    NULL

    {
      "Deprecated argument"
      cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", signaller = "deprecate_stop"))
    }

    {
      "Deprecated argument with function replacement"
      cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar()", signaller = "deprecate_stop"))
    }

    {
      "Deprecated argument with argument replacement (same function)"
      cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "foo(foofy = )", signaller = "deprecate_stop"))
    }

    {
      "Deprecated argument with argument replacement (different function)"
      cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar(foofy = )", signaller = "deprecate_stop"))
    }

    {
      "Deprecated argument with argument replacement (different function, different package)"
      cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = )", "zzz::bar(foofy = )", signaller = "deprecate_stop"))
    }

    {
      "Deprecated argument with reason"
      cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = 'can\\'t be a baz')", signaller = "deprecate_stop"))
    }
  })
})

test_that("non-syntactic names are handled gracefully", {
  expect_snapshot({
    cat_line(lifecycle_build_message("1.0.0", "bar::`foo-fy`(`qu-ux` = )", signaller = "deprecate_stop"))
  })
})

test_that("can use bullets in details ", {
  expect_snapshot({
    cat_line(lifecycle_build_message(
      "1.0.0", "foo()",
      details = c(
        "Unnamed",
        i = "Informative",
        x = "Error"
      ),
      signaller = "deprecate_stop"
    ))
  })
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
