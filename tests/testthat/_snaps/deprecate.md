# deprecate_warn() only warns repeatedly if always = TRUE

    Code
      direct()
    Condition
      Warning:
      `foo()` was deprecated in lifecycle 1.0.0.
    Code
      direct()
      indirect()
      indirect()

---

    Code
      direct(always = TRUE)
    Condition
      Warning:
      `foo()` was deprecated in lifecycle 1.0.0.
    Code
      direct(always = TRUE)
    Condition
      Warning:
      `foo()` was deprecated in lifecycle 1.0.0.
    Code
      indirect(always = TRUE)
      indirect(always = TRUE)

# indirect usage recommends contacting authors

    Code
      indirect(id = "test_base")
    Condition
      Warning:
      `foo()` was deprecated in lifecycle 1.0.0.
      i The deprecated feature was likely used in the base package.
        Please report the issue to the authors.
    Code
      indirect_rlang(id = "test_rlang")
    Condition
      Warning:
      `foo()` was deprecated in lifecycle 1.0.0.
      i The deprecated feature was likely used in the rlang package.
        Please report the issue at <https://github.com/r-lib/rlang/issues>.

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
    Code
      cat_line(lifecycle_message("1.0.0", I("Use of bananas")))
    Output
      Use of bananas was deprecated in base 1.0.0.
    Code
      cat_line(lifecycle_message("1.0.0", I("Use of bananas"), signaller = "deprecate_stop"))
    Output
      Use of bananas was deprecated in base 1.0.0 and is now defunct.

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
    Code
      cat_line(lifecycle_message("1.0.0", I("Use of bananas"), I("apples")))
    Output
      Use of bananas was deprecated in base 1.0.0.
      Please use apples instead.

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
      Unnamed
      i Informative
      x Error

# checks input types

    Code
      lifecycle_message(1)
    Condition
      Error:
      ! `when` must be a single string, not a number.

---

    Code
      lifecycle_message("1", details = 1)
    Condition
      Error:
      ! `details` must be a character vector, not a number.

# needs_warning works as expected

    Code
      needs_warning(1)
    Condition
      Error:
      ! `id` must be a single string, not a number.

---

    Expected `POSIXct` value in `needs_warning()`.
    i This is an internal error in the lifecycle package, please report it to the package authors.

