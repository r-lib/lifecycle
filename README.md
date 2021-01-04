
# lifecycle

<!-- badges: start -->
[![R-CMD-check](https://github.com/r-lib/lifecycle/workflows/R-CMD-check/badge.svg)](https://github.com/r-lib/lifecycle/actions)
[![Codecov test coverage](https://codecov.io/gh/r-lib/lifecycle/branch/master/graph/badge.svg)](https://codecov.io/gh/r-lib/lifecycle?branch=master)
[![CRAN status](https://www.r-pkg.org/badges/version/lifecycle)](https://CRAN.R-project.org/package=lifecycle)
[![Lifecycle: maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
<!-- badges: end -->

lifecycle provides a set of tools and conventions to manage the life cycle of your exported functions.


## Installation

Install the development version of lifecycle from GitHub with:

```
remotes::install_github("r-lib/lifecycle")
```


## Usage

Consult the [usage vignette](https://lifecycle.r-lib.org/articles/lifecycle.html) to learn about the workflow.


### Lifecycle badges

Use lifecycle to document the status of your exported functions and arguments.

1. Choose one of the 7 lifecycle stages a function or argument can be in. You can choose from 4 development stages (experimental, maturing, stable, and questioning) and 3 deprecation stages (soft-deprecated, deprecated, and defunct).

2. Insert the relevant badge in your roxygen documentation by calling `lifecycle::badge()` within R backticks:

    ```
    `r lifecycle::badge("experimental")`
    `r lifecycle::badge("deprecated")`
    ```
    
   `lifecycle::badge()` is ran by roxygen at build time so you don't need to add lifecycle to your `Imports:` section just to include a badge.
   

### Deprecation warnings

If the function or argument is deprecated, make sure your users know about by calling `deprecate_soft()`, `deprecate_warn()`, or `deprecate_stop()`. These functions try to be informative without being too verbose, with increasing levels of verbosity as the deprecation stage advances.
