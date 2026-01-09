# Signal other experimental or superseded features

**\[experimental\]**

`signal_stage()` allows you to signal life cycle stages other than
deprecation (for which you should use
[`deprecate_warn()`](https://lifecycle.r-lib.org/dev/reference/deprecate_soft.md)
and friends). There is no behaviour associated with this signal, it is
currently purely a way to express intent at the call site. In the
future, we hope to replace this with a standardized call to
[`base::declare()`](https://rdrr.io/r/base/declare.html).

## Usage

``` r
signal_stage(stage, what, with = NULL, env = deprecated())
```

## Arguments

- stage:

  Life cycle stage, either `"experimental"` or `"superseded"`.

- what:

  String describing what feature the stage applies too, using the same
  syntax as
  [`deprecate_warn()`](https://lifecycle.r-lib.org/dev/reference/deprecate_soft.md).

- with:

  An optional string giving a recommended replacement for a superseded
  function.

- env:

  **\[deprecated\]**

## Examples

``` r
foofy <- function(x, y, z) {
  signal_stage("experimental", "foofy()")
  x + y / z
}
foofy(1, 2, 3)
#> [1] 1.666667
```
