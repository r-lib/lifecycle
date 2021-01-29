# what deprecation messages are readable

    Code
      cat_line(lifecycle_message("1.0.0", "foo()"))
    Output
      `foo()` was deprecated in base 1.0.0.
    Code
      cat_line(lifecycle_message("1.0.0", "foo()", signaller = "deprecate_stop"))
    Output
      `foo()` was deprecated in base 1.0.0 and is now defunct.
    Code
      cat_line(lifecycle_message("1.0.0", "foo(arg)"))
    Output
      The `arg` argument of `foo()` is deprecated as of base 1.0.0.
    Code
      cat_line(lifecycle_message("1.0.0", "foo(arg)", signaller = "deprecate_stop"))
    Output
      The `arg` argument of `foo()` was deprecated in base 1.0.0 and is now defunct.

# replace deprecation messages are readable

    Code
      cat_line(lifecycle_message("1.0.0", "foo()", "package::bar()"))
    Output
      `foo()` was deprecated in base 1.0.0.
      Please use `package::bar()` instead.
    Code
      cat_line(lifecycle_message("1.0.0", "foo()", "bar()"))
    Output
      `foo()` was deprecated in base 1.0.0.
      Please use `bar()` instead.
    Code
      cat_line(lifecycle_message("1.0.0", "foo(arg1)", "foo(arg2)"))
    Output
      The `arg1` argument of `foo()` is deprecated as of base 1.0.0.
      Please use the `arg2` argument instead.
    Code
      cat_line(lifecycle_message("1.0.0", "foo(arg)", "bar(arg)"))
    Output
      The `arg` argument of `foo()` is deprecated as of base 1.0.0.
      Please use the `arg` argument of `bar()` instead.

# unusual names are handled gracefully

    Code
      cat_line(lifecycle_message("1.0.0", "`foo-fy`(`qu-ux` = )"))
    Output
      The `qu-ux` argument of `foo-fy` is deprecated as of base 1.0.0.
    Code
      cat_line(lifecycle_message("1.0.0", "`foo<-`()"))
    Output
      `foo<-` was deprecated in base 1.0.0.
    Code
      cat_line(lifecycle_message("1.0.0", "`+`()"))
    Output
      `+` was deprecated in base 1.0.0.

# can use bullets in details 

    Code
      cat_line(lifecycle_message("1.0.0", "foo()", details = c("Unnamed", i = "Informative",
        x = "Error"), signaller = "deprecate_stop"))
    Output
      `foo()` was deprecated in base 1.0.0 and is now defunct.
      * Unnamed
      i Informative
      x Error

# checks input types

    Code
      lifecycle_message(1)
    Error <rlang_error>
      Internal error in lifecycle: `when` must be a string

---

    Code
      lifecycle_message("1", details = 1)
    Error <rlang_error>
      Internal error in lifecycle: `details` must be a character vector

# needs_warning works as expected

    Code
      needs_warning(1)
    Error <rlang_error>
      Internal error in lifecycle: `id` must be a string

---

    Internal error in lifecycle: Expected `POSIXct` value in `needs_warning()`.

