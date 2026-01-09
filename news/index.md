# Changelog

## lifecycle 1.0.5

CRAN release: 2026-01-08

- [`signal_stage()`](https://lifecycle.r-lib.org/reference/signal_stage.md)
  no longer does anything, and is now purely a way to express intent at
  the call site of whether a function is superseded or experimental
  ([\#203](https://github.com/r-lib/lifecycle/issues/203)).

- [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  and
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  are faster thanks to some internal refactoring
  ([\#191](https://github.com/r-lib/lifecycle/issues/191),
  [\#194](https://github.com/r-lib/lifecycle/issues/194),
  [\#195](https://github.com/r-lib/lifecycle/issues/195),
  [\#201](https://github.com/r-lib/lifecycle/issues/201)).

- [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  and
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  now only warn once per session rather than attempting to warn once
  every 8 hours. This never actually worked
  ([\#196](https://github.com/r-lib/lifecycle/issues/196)).

- Improvements to
  [`lint_lifecycle()`](https://lifecycle.r-lib.org/reference/lifecycle_linter.md)
  and
  [`lint_tidyverse_lifecycle()`](https://lifecycle.r-lib.org/reference/lifecycle_linter.md)
  ([@AshesITR](https://github.com/AshesITR)):

  - Updated to support lintr \>= 3.0.0
    ([\#178](https://github.com/r-lib/lifecycle/issues/178)).
  - Fixed default `pattern=` argument to only find R files
    ([\#165](https://github.com/r-lib/lifecycle/issues/165)).
  - Fixed
    [`lint_tidyverse_lifecycle()`](https://lifecycle.r-lib.org/reference/lifecycle_linter.md)
    ignoring the `pattern=` argument
    ([\#179](https://github.com/r-lib/lifecycle/issues/179)).
  - Added support for Quarto qmd files to the default `pattern=`
    argument ([\#155](https://github.com/r-lib/lifecycle/issues/155)).
  - Added support for Rnw, Rhtml, Rrst, Rtex and Rtxt files to the
    default `pattern=` argument.
  - Exported
    [`lifecycle_linter()`](https://lifecycle.r-lib.org/reference/lifecycle_linter.md)
    to allow including the linter in `.lintr` configurations when using
    `lintr` ([\#122](https://github.com/r-lib/lifecycle/issues/122)).

## lifecycle 1.0.4

CRAN release: 2023-11-07

- Repeated calls to
  [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  and
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  are faster thanks to some internal refactoring
  ([\#177](https://github.com/r-lib/lifecycle/issues/177)).

- Switch from `expr_deparse()` to
  [`deparse()`](https://rdrr.io/r/base/deparse.html). This improves
  performance considerably and the cost of making some unusual function
  calls mildly less appealing
  ([\#167](https://github.com/r-lib/lifecycle/issues/167)).

## lifecycle 1.0.3

CRAN release: 2022-10-07

- The `with` line is now an info bullet. The `details` lines are info
  bullets by default, unless the argument is named.

- Indirect usages of deprecated features now mention the package that
  likely used the deprecated feature and recommends contacting the
  authors ([\#135](https://github.com/r-lib/lifecycle/issues/135)).

- Indirect usages of
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  no longer warn repeatedly, even if `always = TRUE`
  ([\#135](https://github.com/r-lib/lifecycle/issues/135)).

- In tests,
  [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  will only warn if the deprecated function is called directly from the
  package being tested, not one of its dependencies. This ensures that
  you only see the warning when it’s your responsibility to do something
  about it ([\#134](https://github.com/r-lib/lifecycle/issues/134)).

- Soft deprecations now only warn every 8 hours in non-package code
  ([\#134](https://github.com/r-lib/lifecycle/issues/134)).

## lifecycle 1.0.2

CRAN release: 2022-09-09

- You can now generate arbitrary text in a deprecation message by
  wrapping `what` or `with` in [`I()`](https://rdrr.io/r/base/AsIs.html)
  ([\#120](https://github.com/r-lib/lifecycle/issues/120)).

- [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  gains an `always = TRUE` argument to force warnings to occur every
  time, not every 8 hours. This adds an extra step in between
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  and
  [`deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  ([\#124](https://github.com/r-lib/lifecycle/issues/124)).

- [`signal_stage()`](https://lifecycle.r-lib.org/reference/signal_stage.md)
  now supports `with`
  ([\#116](https://github.com/r-lib/lifecycle/issues/116)).

## lifecycle 1.0.1

CRAN release: 2021-09-24

- [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  now follows the verbosity option when called from the global
  environment ([\#113](https://github.com/r-lib/lifecycle/issues/113)).

- `last_warnings()` has been renamed to
  [`last_lifecycle_warnings()`](https://lifecycle.r-lib.org/reference/last_lifecycle_warnings.md)
  and `last_warning()` has been removed. This is for compatibility with
  the future
  [`rlang::last_warnings()`](https://rlang.r-lib.org/reference/last_warnings.html)
  function to be released in the next rlang version.

## lifecycle 1.0.0

CRAN release: 2021-02-15

- New vignettes:

  - [`vignette("stages")`](https://lifecycle.r-lib.org/articles/stages.md)
    describes the lifecycle stages
  - [`vignette("manage")`](https://lifecycle.r-lib.org/articles/manage.md)
    teaches you how to manage lifecycle changes in functions you *use*.
  - [`vignette("communicate")`](https://lifecycle.r-lib.org/articles/communicate.md)
    shows how to use lifecycle in functions that you *write*.

- In
  [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md),
  [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md),
  and
  [`deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md):

  - You can deprecate an argument with `foo(arg)` instead of
    `foo(arg =)` ([\#78](https://github.com/r-lib/lifecycle/issues/78)).
    This syntax is similar in spirit to the formal arguments of function
    definitions.

  - You can deprecate R6 methods by using `class$method()`
    ([\#54](https://github.com/r-lib/lifecycle/issues/54)).

  - A character vector `details` is now converted into a bulleted list
    ([\#55](https://github.com/r-lib/lifecycle/issues/55)).

  - Messages for non-prefix functions (like “`x<-`()” and “`%>%`()”)
    look a little nicer
    ([\#95](https://github.com/r-lib/lifecycle/issues/95)).

  - Manually printed warnings now omit the advice footer
    ([\#68](https://github.com/r-lib/lifecycle/issues/68)).

- Experimental
  [`signal_stage()`](https://lifecycle.r-lib.org/reference/signal_stage.md)
  can be used to signal that a function is experimental or superseded.
  These signals are not currently hooked up to any behaviour, but we’ll
  add tools in a future release
  ([\#44](https://github.com/r-lib/lifecycle/issues/44)).

- `lifecycle_cnd_data()` has been removed; as far as I can tell it
  wasn’t used by anyone.

## lifecycle 0.2.0

CRAN release: 2020-03-06

- Lifecycle warnings are now displayed once every 8 hours.

- Added experimental
  [`signal_experimental()`](https://lifecycle.r-lib.org/reference/deprecated-signallers.md)
  and
  [`signal_superseded()`](https://lifecycle.r-lib.org/reference/deprecated-signallers.md)
  functions.

- Added the “superseded” lifecycle stage to the documentation.

- [`deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md)
  now mentions that function is defunct
  ([\#28](https://github.com/r-lib/lifecycle/issues/28)).

- New
  [`expect_deprecated()`](https://lifecycle.r-lib.org/reference/expect_deprecated.md)
  and
  [`expect_defunct()`](https://lifecycle.r-lib.org/reference/expect_deprecated.md)
  functions for testting lifecycle warnings and errors.
  [`expect_deprecated()`](https://lifecycle.r-lib.org/reference/expect_deprecated.md)
  automatically sets the `lifecycle_verbosity` option to `"warning"` to
  enforce warnings at each invocation rather than once per session.

- New syntax `"foo(arg = 'can\\'t be a baz')"` to describe that specific
  inputs for an argument are deprecated
  ([\#30](https://github.com/r-lib/lifecycle/issues/30),
  [@krlmlr](https://github.com/krlmlr)).

- New
  [`is_present()`](https://lifecycle.r-lib.org/reference/deprecated.md)
  function to test whether the caller has supplied a
  [`deprecated()`](https://lifecycle.r-lib.org/reference/deprecated.md)
  function.

## lifecycle 0.1.0

CRAN release: 2019-08-01

- Deprecated functions under the control of the developer now warn
  repeatedly in unit tests.

- Deprecation warnings now record a backtrace. Call
  [`lifecycle::last_lifecycle_warnings()`](https://lifecycle.r-lib.org/reference/last_lifecycle_warnings.md)
  and `lifecycle::last_warning()` to print the warnings that occurred
  during the last command, along with their backtraces.

- The naming scheme of signaller functions has been simplified:

  - `signal_soft_deprecated()` is now
    [`deprecate_soft()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md).
  - `warn_deprecated()` is now
    [`deprecate_warn()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md).
  - `stop_defunct()` is now
    [`deprecate_stop()`](https://lifecycle.r-lib.org/reference/deprecate_soft.md).

- The signaller functions now take a version and two descriptors for the
  deprecated feature and its replacement (the latter is optional). The
  deprecation message is built from these components. You can pass a
  `details` argument to append additional information to the generated
  deprecation message.

- Helpers from rlang’s `compat-lifecycle.R` drop-in file are now
  exported in this package.
