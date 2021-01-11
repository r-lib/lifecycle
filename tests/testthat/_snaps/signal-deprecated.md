# deprecation messages are constructed for functions

    Code
      NULL
    Output
      NULL
    Code
      {
        "Inferred package name (here it is base b/c of testthat's eval env)"
        cat_line(lifecycle_build_message("1.0.0", "foo()", signaller = "deprecate_stop"))
      }
    Output
      `foo()` was deprecated in base 1.0.0 and is now defunct.
    Code
      {
        "Overridden package name"
        cat_line(lifecycle_build_message("1.0.0", "mypkg::foo()", signaller = "deprecate_stop"))
      }
    Output
      `foo()` was deprecated in mypkg 1.0.0 and is now defunct.
    Code
      {
        "Replacement function"
        cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", signaller = "deprecate_stop"))
      }
    Output
      `foo()` was deprecated in base 1.0.0 and is now defunct.
      Please use `bar()` instead.
    Code
      {
        "Replacement function with overridden package names (1)"
        cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "foofy()",
          signaller = "deprecate_stop"))
      }
    Output
      `quux()` was deprecated in foo 1.0.0 and is now defunct.
      Please use `foofy()` instead.
    Code
      {
        "Replacement function with overridden package names (2)"
        cat_line(lifecycle_build_message("1.0.0", "foo::quux()", "bar::foofy()",
          signaller = "deprecate_stop"))
      }
    Output
      `quux()` was deprecated in foo 1.0.0 and is now defunct.
      Please use `bar::foofy()` instead.
    Code
      {
        details <- glue::glue(
          "\n\n        # Before:\n        foo()\n\n        # After:\n        bar()\n      ")
        cat_line(lifecycle_build_message("1.0.0", "foo()", "bar()", details = details,
          signaller = "deprecate_stop"))
      }
    Output
      `foo()` was deprecated in base 1.0.0 and is now defunct.
      Please use `bar()` instead.
      
        # Before:
        foo()
      
        # After:
        bar()

# deprecation messages are constructed for arguments

    Code
      NULL
    Output
      NULL
    Code
      {
        "Deprecated argument"
        cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` was deprecated in base 1.0.0 and is now defunct.
    Code
      {
        "Deprecated argument with function replacement"
        cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar()", signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` was deprecated in base 1.0.0 and is now defunct.
      Please use `bar()` instead.
    Code
      {
        "Deprecated argument with argument replacement (same function)"
        cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "foo(foofy = )",
          signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` was deprecated in base 1.0.0 and is now defunct.
      Please use the `foofy` argument instead.
    Code
      {
        "Deprecated argument with argument replacement (different function)"
        cat_line(lifecycle_build_message("1.0.0", "foo(quux = )", "bar(foofy = )",
          signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` was deprecated in base 1.0.0 and is now defunct.
      Please use the `foofy` argument of `bar()` instead.
    Code
      {
        "Deprecated argument with argument replacement (different function, different package)"
        cat_line(lifecycle_build_message("1.0.0", "aaa::foo(quux = )",
          "zzz::bar(foofy = )", signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` was deprecated in aaa 1.0.0 and is now defunct.
      Please use the `foofy` argument of `zzz::bar()` instead.
    Code
      {
        "Deprecated argument with reason"
        cat_line(lifecycle_build_message("1.0.0",
          "aaa::foo(quux = 'can\\'t be a baz')", signaller = "deprecate_stop"))
      }
    Output
      The `quux` argument of `foo()` can't be a baz as of aaa 1.0.0.

# non-syntactic names are handled gracefully

    Code
      cat_line(lifecycle_build_message("1.0.0", "bar::`foo-fy`(`qu-ux` = )",
        signaller = "deprecate_stop"))
    Output
      The `qu-ux` argument of ``foo-fy`()` was deprecated in bar 1.0.0 and is now defunct.

# needs_warning works as expected

    Internal error in lifecycle: Expected `POSIXct` value in `needs_warning()`.

