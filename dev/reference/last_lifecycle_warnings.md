# Display last deprecation warnings

`last_lifecycle_warnings()` returns a list of all warnings that occurred
during the last top-level R command, along with a backtrace.

Use `print(last_lifecycle_warnings(), simplify = level)` to control the
verbosity of the backtrace. The `simplify` argument supports one of
`"branch"` (the default), `"collapse"`, and `"none"` (in increasing
order of verbosity).

## Usage

``` r
last_lifecycle_warnings()
```

## Examples

``` r
# These examples are not run because `last_lifecycle_warnings()` does not
# work well within knitr and pkgdown
if (FALSE) { # \dontrun{

f <- function() invisible(g())
g <- function() list(h(), i())
h <- function() deprecate_warn("1.0.0", "this()")
i <- function() deprecate_warn("1.0.0", "that()")
f()

# Print all the warnings that occurred during the last command:
last_lifecycle_warnings()


# By default, the backtraces are printed in their simplified form.
# Use `simplify` to control the verbosity:
print(last_lifecycle_warnings(), simplify = "none")
} # }
```
