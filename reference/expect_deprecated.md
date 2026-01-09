# Does expression produce lifecycle warnings or errors?

These functions are equivalent to
[`testthat::expect_warning()`](https://testthat.r-lib.org/reference/expect_error.html)
and
[`testthat::expect_error()`](https://testthat.r-lib.org/reference/expect_error.html)
but check specifically for lifecycle warnings or errors.

To test whether a deprecated feature still works without causing a
deprecation warning, set the `lifecycle_verbosity` option to `"quiet"`.

    test_that("feature still works", {
      withr::local_options(lifecycle_verbosity = "quiet")
      expect_true(my_deprecated_function())
    })

## Usage

``` r
expect_deprecated(expr, regexp = NULL, ...)

expect_defunct(expr)
```

## Arguments

- expr:

  Expression that should produce a lifecycle warning or error.

- regexp:

  Optional regular expression matched against the expected warning
  message.

- ...:

  Arguments passed on to
  [`expect_match`](https://testthat.r-lib.org/reference/expect_match.html)

  `fixed`

  :   If `TRUE`, treats `regexp` as a string to be matched exactly (not
      a regular expressions). Overrides `perl`.

  `perl`

  :   logical. Should Perl-compatible regexps be used?

## Details

`expect_deprecated()` sets the
[lifecycle_verbosity](https://lifecycle.r-lib.org/reference/verbosity.md)
option to `"warning"` to enforce deprecation warnings which are
otherwise only shown once per session.
