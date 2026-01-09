# Mark an argument as deprecated

Signal deprecated argument by using self-documenting sentinel
`deprecated()` as default argument. Test whether the caller has supplied
the argument with `is_present()`.

## Usage

``` r
deprecated()

is_present(arg)
```

## Arguments

- arg:

  A `deprecated()` function argument.

## Magical defaults

We recommend importing `lifecycle::deprecated()` in your namespace and
use it without the namespace qualifier.

In general, we advise against such magical defaults, i.e. defaults that
cannot be evaluated by the user. In the case of `deprecated()`, the
trade-off is worth it because the meaning of this default is obvious and
there is no reason for the user to call `deprecated()` themselves.

## Examples

``` r
foobar_adder <- function(foo, bar, baz = deprecated()) {
  # Check if user has supplied `baz` instead of `bar`
  if (lifecycle::is_present(baz)) {

    # Signal the deprecation to the user
    deprecate_warn("1.0.0", "foo::bar_adder(baz = )", "foo::bar_adder(bar = )")

    # Deal with the deprecated argument for compatibility
    bar <- baz
  }

  foo + bar
}

foobar_adder(1, 2)
#> [1] 3
foobar_adder(1, baz = 2)
#> Warning: The `baz` argument of `bar_adder()` is deprecated as of foo 1.0.0.
#> ℹ Please use the `bar` argument instead.
#> [1] 3
```
