
# lifecycle

<!-- badges: start -->
[![Travis build status](https://travis-ci.org/r-lib/lifecycle.svg?branch=master)](https://travis-ci.org/r-lib/lifecycle)
[![Codecov test coverage](https://codecov.io/gh/r-lib/lifecycle/branch/master/graph/badge.svg)](https://codecov.io/gh/r-lib/lifecycle?branch=master)
[![CRAN status](https://www.r-pkg.org/badges/version/lifecycle)](https://CRAN.R-project.org/package=lifecycle)
<!-- badges: end -->

lifecycle provides a set of tools and conventions to manage the life cycle of your exported functions.


## Installation

Install the development version of lifecycle from GitHub with:

```
remotes::install_github("r-lib/lifecycle")
```


## Usage

Use lifecycle to document the status of your exported functions and arguments:

* Choose one of the 7 lifecycle stages a function or argument can be in. You can choose from 4 development stages (experimental, maturing, stable, and questining) and 3 deprecation stages (soft-deprecated, deprecated, and defunct).

* If the function or argument is deprecated, make sure your users know about by calling `deprecate_soft()`, `deprecate_warn()`, or `deprecate_stop()`. These functions try to be informative without being too verbose, with increasing levels of verbosity as the deprecation stage advances.

* Include the relevant lifecycle badge in your documentation.

Consult the usage vignette to learn about the workflow: `vignette("usage", package = "lifecycle")`.
