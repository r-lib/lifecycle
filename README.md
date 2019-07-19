
<!-- badges: start -->
[![Travis build status](https://travis-ci.org/r-lib/lifecycle.svg?branch=master)](https://travis-ci.org/r-lib/lifecycle)
[![Codecov test coverage](https://codecov.io/gh/r-lib/lifecycle/branch/master/graph/badge.svg)](https://codecov.io/gh/r-lib/lifecycle?branch=master)
<!-- badges: end -->


# lifecycle

lifecycle provides a set of tools and conventions to manage the life cycle of your exported functions.


## Installation

Install the development version of lifecycle from GitHub with:

``` r
remotes::install_github("r-lib/lifecycle")
```


## Usage

Use lifecycle to document the status of your exported functions and arguments:

* Choose one of the 7 lifecycle stages a function or argument can be in. You can choose from 4 development stages (experimental, maturing, stable, and questining) and 3 deprecation stages (soft-deprecated, deprecated, and defunct).

* If the function or argument is deprecated, make sure your users know about by calling `deprecate_soft()`, `deprecate_warn()`, or `deprecate_stop()`. These functions try to be informative without being too verbose, with increasing levels of verbosity as the deprecation stage advances.

* Include the relevant lifecycle badge in your documentation.


### Stages

The lifecycle stages for functions and arguments closely mirror the [lifecycle stages for packages](https://www.tidyverse.org/lifecycle/).

There are 4 __development__ stages.

1. <img src="man/figures/lifecycle-experimental.svg" align="left" alt = "Experimental" /> This is a new feature that is in the very early stage of development. It is exported so users can start to use it and report feedback, but its interface and/or behaviour is likely to change in the future. It is generally best to avoid depending on experimental features.

1. <img src="man/figures/lifecycle-maturing.svg" align="left" alt = "Maturing" />. The interface and behaviour of a maturing feature has been roughed out, but finer details are likely to change. It still needs more feedback to find the optimal API.

1. <img src="man/figures/lifecycle-stable.svg" align="left" alt = "Stable" /> A feature is considered stable when the author is happy with its interface and behaviour. Major changes are unlikely, and breaking changes will occur gradually, through a deprecation process.

1. <img src="man/figures/lifecycle-questioning.svg" align="left" alt = "Questioning" /> The author is no longer convinced that the feature is the optimal approach. However, there are no recommended alternatives yet.

Once the decision of discontinuing a feature has been made, it goes through 3 __deprecation__ stages.

1. <img src="man/figures/lifecycle-soft-deprecated.svg" align="left" alt = "Soft deprecated" />. The author is no longer happy with a feature because they consider it sub-optimal compared to some other approach, or simply because they no longer have the time to maintain it. A soft-deprecated feature can still be used without hassle, but users should consider switching to an alternative approach.

1. <img src="man/figures/lifecycle-deprecated.svg" align="left" alt = "Deprecated" />. The feature is likely to be discontinued in the next major release. Users should switch to an alternative approach as soon as possible.

1. <img src="man/figures/lifecycle-defunct.svg" align="left" alt = "Defunct" />. The feature can no longer be used. A defunct function is still exported, and a defunct argument is still part of the signature. This way an informative error can be thrown.

Finally, when a feature is no longer exposed or mentioned in the released version of the package, it is said to be __archived__.


### Verbosity

lifecycle offers 3 levels of verbosity corresponding to the deprecation stages.

*   __Soft deprecation__: At this stage, call `deprecate_soft()` to start warning users about the deprecation in the least disruptive way.

    This function only warns (a) users who try the feature from the global workspace, and (b) developers who directly use the feature, when they run unit tests with testthat. No warning is issued outside of unit tests, or when the deprecated feature is called from another package then ther own.

    When a warning does get issued, users only see it once per session rather than at each invokation.

*   __Deprecation__: At this stage, call `deprecate_warn()` to warn unconditionally about the deprecated feature. The warning is issued only once per session.

*   __Defunct__: The feature is discontinued. Call `deprecate_stop()` to fail with an error.


### Deprecating functions

These functions take the version number starting from which the feature is considered deprecated (it should remain the same across all deprecation stages), and a feature descriptor:

```
deprecate_warn("1.0.0", "mypkg::foo()")
#> Warning message:
#> `foo()` is deprecated as of mypkg 1.0.0.
```

You can optionally provide a replacement:

```
deprecate_warn("1.0.0", "mypkg::foo()", "new()")
#> Warning message:
#> `foo()` is deprecated as of mypkg 1.0.0.
#> Please use `new()` instead.
```

For the purpose of these examples we explicitly mentioned the namespace with `mypkg::`, however you can typically omit it because lifecycle infers the namespace from the calling environment. Specifying the namespace is mostly useful when the replacement is implemented in a different package.

```{r}
# The new replacement
foobar_adder <- function(foo, bar) {
  foo + bar
}

# The old function still exported for compatibility
foobaz_adder <- function(foo, bar) {
  deprecate_warn("1.0.0", "foobaz_adder()", "foobar_adder()")
  foobar_adder(foo, bar)
}
```


### Deprecating arguments

The syntax for deprecating argument is based on the syntax for deprecating functions:

```{r}
deprecate_warn("1.0.0", "mypkg::foo(arg = )")
#> Warning message:
#> The `arg` argument of `foo()` is deprecated as of mypkg 1.0.0.

deprecate_warn("1.0.0", "mypkg::foo(arg = )", "mypkg::foo(new = )")
#> Warning message:
#> The `arg` argument of `foo()` is deprecated as of mypkg 1.0.0.
#> Please use the `new` argument instead.
```

lifecycle also provides the `deprecated()` sentinel to use as default argument. This provides self-documentation for your users, and makes it possible for external tools to determine which arguments are deprecated. This sentinel is simply the missing argument, so you can test whether the argument was supplied with `rlang::is_missing()`:

```{r}
foobar_adder <- function(foo, bar, baz = deprecated()) {
  # Check if user has supplied `baz` instead of `bar`
  if (!rlang::is_missing(baz)) {

    # Signal the deprecation to the user
    deprecate_warn("1.0.0", "foobar_adder(baz = )", "foobar_adder(bar = )")

    # Deal with the deprecated argument for compatibility
    bar <- baz
  }

  foo + bar
}
```


### Badges

Finally, add a badge in the documentation topic of your functions so their lifecycle status stands out.

*   Call `usethis::use_lifecycle()` to import the badges in your package.

*   Include the following macro to insert a badge:

    ```
    #' \Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}
    ```

    This badge renders as text in non-HTML documentation. A good place to include it is at the top of the `@description` block.

*   For functions in development, you typically don't need to advertise the status if it is the same as the package as a whole. For instance, if your package is [maturing](https://www.tidyverse.org/lifecycle/#maturing), only signal functions in the experimental, stable, and questioning stages.
