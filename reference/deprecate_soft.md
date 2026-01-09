# Deprecate functions and arguments

These functions provide three levels of verbosity for deprecated
functions. Learn how to use them in
[`vignette("communicate")`](https://lifecycle.r-lib.org/articles/communicate.md).

- `deprecate_soft()` warns only if the deprecated function is called
  directly, i.e. a user is calling a function they wrote in the global
  environment or a developer is calling it in their package. It does not
  warn when called indirectly, i.e. the deprecation comes from code that
  you don't control.

- `deprecate_warn()` warns unconditionally.

- `deprecate_stop()` fails unconditionally.

Warnings are only issued once per session to avoid overwhelming the
user. Control with
[`options(lifecycle_verbosity)`](https://lifecycle.r-lib.org/reference/verbosity.md).

## Usage

``` r
deprecate_soft(
  when,
  what,
  with = NULL,
  details = NULL,
  id = NULL,
  env = caller_env(),
  user_env = caller_env(2)
)

deprecate_warn(
  when,
  what,
  with = NULL,
  details = NULL,
  id = NULL,
  always = FALSE,
  env = caller_env(),
  user_env = caller_env(2)
)

deprecate_stop(when, what, with = NULL, details = NULL, env = caller_env())
```

## Arguments

- when:

  A string giving the version when the behaviour was deprecated.

- what:

  A string describing what is deprecated:

  - Deprecate a whole function with `"foo()"`.

  - Deprecate an argument with `"foo(arg)"`.

  - Partially deprecate an argument with
    `"foo(arg = 'must be a scalar integer')"`.

  - Deprecate anything else with a custom message by wrapping it in
    [`I()`](https://rdrr.io/r/base/AsIs.html).

  You can optionally supply the namespace: `"ns::foo()"`, but this is
  usually not needed as it will be inferred from the caller environment.

- with:

  An optional string giving a recommended replacement for the deprecated
  behaviour. This takes the same form as `what`.

- details:

  In most cases the deprecation message can be automatically generated
  from `with`. When it can't, use `details` to provide a hand-written
  message.

  `details` can either be a single string or a character vector, which
  will be converted to a [bulleted
  list](https://cli.r-lib.org/reference/cli_bullets.html). By default,
  info bullets are used. Provide a named vectors to override.

- id:

  The id of the deprecation. A warning is issued only once for each
  `id`. Defaults to the generated message, but you should provide a
  unique `id` when the message in `details` is built programmatically
  and depends on inputs, or when you'd like to deprecate multiple
  functions but warn only once for all of them. Repeated calls to
  `deprecate_soft()` and `deprecate_warn()` are also much faster if you
  supply an `id` because it avoids spending time generating the message
  only to immediately exit if the once per session warning has already
  been thrown before.

- env, user_env:

  Pair of environments that define where `deprecate_*()` was called
  (used to determine the package name) and where the function called the
  deprecating function was called (used to determine if
  `deprecate_soft()` should message).

  These are only needed if you're calling `deprecate_*()` from an
  internal helper, in which case you should forward `env = caller_env()`
  and `user_env = caller_env(2)`.

- always:

  If `FALSE`, the default, will warn once per session. If `TRUE`, will
  always warn in direct usages. Indirect usages keep warning once per
  session to avoid disrupting users who can't fix the issue. Only use
  `always = TRUE` after at least one release with the default.

## Value

`NULL`, invisibly.

## Conditions

- Deprecation warnings have class `lifecycle_warning_deprecated`.

- Deprecation errors have class `lifecycle_error_deprecated`.

## See also

[`lifecycle()`](https://lifecycle.r-lib.org/reference/lifecycle-package.md)

## Examples

``` r
# A deprecated function `foo`:
deprecate_warn("1.0.0", "foo()")
#> Warning: `foo()` was deprecated in <NA> 1.0.0.
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A deprecated argument `arg`:
deprecate_warn("1.0.0", "foo(arg)")
#> Warning: The `arg` argument of `foo()` is deprecated as of <NA> 1.0.0.
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A partially deprecated argument `arg`:
deprecate_warn("1.0.0", "foo(arg = 'must be a scalar integer')")
#> Warning: The `arg` argument of `foo()` must be a scalar integer as of <NA>
#> 1.0.0.
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A deprecated function with a function replacement:
deprecate_warn("1.0.0", "foo()", "bar()")
#> Warning: `foo()` was deprecated in <NA> 1.0.0.
#> ℹ Please use `bar()` instead.
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A deprecated function with a function replacement from a
# different package:
deprecate_warn("1.0.0", "foo()", "otherpackage::bar()")
#> Warning: `foo()` was deprecated in <NA> 1.0.0.
#> ℹ Please use `otherpackage::bar()` instead.
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A deprecated function with custom message:
deprecate_warn(
  when = "1.0.0",
  what = "foo()",
  details = "Please use `otherpackage::bar(foo = TRUE)` instead"
)
#> Warning: `foo()` was deprecated in <NA> 1.0.0.
#> ℹ Please use `otherpackage::bar(foo = TRUE)` instead
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.

# A deprecated function with custom bulleted list:
deprecate_warn(
  when = "1.0.0",
  what = "foo()",
  details = c(
    x = "This is dangerous",
    i = "Did you mean `safe_foo()` instead?"
  )
)
#> Warning: `foo()` was deprecated in <NA> 1.0.0.
#> ✖ This is dangerous
#> ℹ Did you mean `safe_foo()` instead?
#> ℹ The deprecated feature was likely used in the base package.
#>   Please report the issue to the authors.
```
