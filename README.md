
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

Use lifecycle to document the status of your exported functions and arguments:

* Choose one of the 7 lifecycle stages a function or argument can be in. You can choose from 4 development stages (experimental, maturing, stable, and questioning) and 3 deprecation stages (soft-deprecated, deprecated, and defunct).

* If the function or argument is deprecated, make sure your users know about by calling `deprecate_soft()`, `deprecate_warn()`, or `deprecate_stop()`. These functions try to be informative without being too verbose, with increasing levels of verbosity as the deprecation stage advances.

* Include the relevant lifecycle badge in your documentation.

Consult the usage vignette to learn about the workflow: `vignette("lifecycle", package = "lifecycle")`.
