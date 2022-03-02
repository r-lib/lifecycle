# lifecycle

<!-- badges: start -->

[![R-CMD-check](https://github.com/r-lib/lifecycle/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/r-lib/lifecycle/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

lifecycle provides a set of tools and conventions to manage the life cycle of your exported functions.

-   For a general motivation and introduction to the key concepts, watch Hadley's rstudio::global(2021) keynote ["Maintaining the house that the tidyverse built"](https://www.rstudio.com/resources/rstudioglobal-2021/maintaining-the-house-the-tidyverse-built/).

-   Read `vignette("stages")` to learn what it means for a function to be experimental, stable, deprecated, or superseded.

-   Read `vignette("manage")` to learn how to manage lifecycle changes in functions that you use.

-   Read `vignette("communicate")` to learn how to communicate lifecycle changes in the functions you write.

## Installation

``` r
# Install release version from CRAN
install.packages("lifecycle")

# Install development version from GitHub
devtools::install_github("r-lib/lifecycle")
```
