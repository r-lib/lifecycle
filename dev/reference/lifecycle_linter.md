# Lint usages of functions that have a non-stable life cycle.

- `lifecycle_linter()` creates a linter for lifecycle annotations which
  can be included in a `.lintr` configuration if `lintr` is used
  directly.

- `lint_lifecycle()` dynamically queries the package documentation for
  packages in `packages` for lifecycle annotations and then searches the
  directory in `path` for usages of those functions.

- `lint_tidyverse_lifecycle()` is a convenience function to call
  `lint_lifecycle()` for all the packages in the tidyverse.

- `pkg_lifecycle_statuses()` returns a data frame of functions with
  lifecycle annotations for an installed package.

## Usage

``` r
pkg_lifecycle_statuses(
  package,
  which = c("superseded", "deprecated", "questioning", "defunct", "experimental",
    "soft-deprecated", "retired")
)

lint_lifecycle(
  packages,
  path = ".",
  pattern = "(?i)[.](r|rmd|qmd|rnw|rhtml|rrst|rtex|rtxt)$",
  which = c("superseded", "deprecated", "questioning", "defunct", "experimental",
    "soft-deprecated", "retired"),
  symbol_is_undesirable = FALSE
)

lint_tidyverse_lifecycle(
  path = ".",
  pattern = "(?i)[.](r|rmd|qmd|rnw|rhtml|rrst|rtex|rtxt)$",
  which = c("superseded", "deprecated", "questioning", "defunct", "experimental",
    "soft-deprecated", "retired"),
  symbol_is_undesirable = FALSE
)

lifecycle_linter(
  packages = tidyverse::tidyverse_packages(),
  which = c("superseded", "deprecated", "questioning", "defunct", "experimental",
    "soft-deprecated", "retired"),
  symbol_is_undesirable = FALSE
)
```

## Arguments

- package:

  The name of an installed package.

- which:

  Vector of lifecycle statuses to lint.

- packages:

  One or more installed packages to query for lifecycle statuses.

- path:

  The directory path to the files you want to search.

- pattern:

  Any files matching this pattern will be searched. The default searches
  any files ending in `.R` or `.Rmd`.

- symbol_is_undesirable:

  Also lint symbol usages, e.g. `lapply(x, is_na)`?

## Examples

``` r
lintr::lint(
  text = "is_na(x)",
  linters = lifecycle_linter(packages = "rlang")
)
#> <text>:1:1: style: [lifecycle_linter] `rlang::is_na` is questioning
#> is_na(x)
#> ^~~~~
lintr::lint(
  text = "lapply(x, is_na)",
  linters = lifecycle_linter(packages = "rlang",
  symbol_is_undesirable = TRUE)
)
#> <text>:1:11: style: [lifecycle_linter] `rlang::is_na` is questioning
#> lapply(x, is_na)
#>           ^~~~~
```
