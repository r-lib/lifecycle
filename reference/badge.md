# Embed a lifecycle badge in documentation

To include lifecycle badges in your documentation:

1.  Call
    [`usethis::use_lifecycle()`](https://usethis.r-lib.org/reference/use_lifecycle.html)
    to copy the badge images into the `man/` folder of your package.

2.  Call `lifecycle::badge()` inside R backticks to insert a lifecycle
    badge:

        #' `r lifecycle::badge("experimental")`
        #' `r lifecycle::badge("deprecated")`
        #' `r lifecycle::badge("superseded")`

    If the deprecated feature is a function, a good place for this badge
    is at the top of the topic description. If it is an argument, you
    can put the badge in the argument description.

The badge is displayed as an image in the HTML version of the
documentation and as text otherwise.

`lifecycle::badge()` is run by roxygen at build time so you don't need
to add lifecycle to `Imports:` just to use the badges. However, it's
still good practice to add to `Suggests:` so that it will be available
to package developers.

## Usage

``` r
badge(stage)
```

## Arguments

- stage:

  A lifecycle stage as a string. Must be one of `"experimental"`,
  `"stable"`, `"superseded"`, or `"deprecated"`.

## Value

An `Rd` expression describing the lifecycle stage.

## Badges

- **\[experimental\]** `lifecycle::badge("experimental")`

- **\[stable\]** `lifecycle::badge("stable")`

- **\[superseded\]** `lifecycle::badge("superseded")`

- **\[deprecated\]** `lifecycle::badge("deprecated")`

The meaning of these stages is described in
[`vignette("stages")`](https://lifecycle.r-lib.org/articles/stages.md).
