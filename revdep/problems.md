# furrr

<details>

* Version: 0.2.1
* GitHub: https://github.com/DavisVaughan/furrr
* Source code: https://github.com/cran/furrr
* Date/Publication: 2020-10-21 18:00:06 UTC
* Number of recursive dependencies: 67

Run `cloud_details(, "furrr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(furrr)
      Loading required package: future
      > 
      > test_check("furrr")
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      ● Until HenrikBengtsson/future.apply#10 is fixed (1)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-deprecation.R:2:3): can use deprecated `future_options()` ─────
      `regexp` was not found in deprecation warning message.
      
      [ FAIL 1 | WARN 0 | SKIP 1 | PASS 811 ]
      Error: Test failures
      Execution halted
    ```

# mcmcr

<details>

* Version: 0.4.0
* GitHub: https://github.com/poissonconsulting/mcmcr
* Source code: https://github.com/cran/mcmcr
* Date/Publication: 2020-09-27 04:40:03 UTC
* Number of recursive dependencies: 54

Run `cloud_details(, "mcmcr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
        3.     └─lifecycle:::lifecycle_message(...)
        4.       └─lifecycle:::spec(what, env, signaller)
        5.         └─lifecycle:::spec_what(spec, "spec", signaller)
        6.           └─rlang::parse_expr(what)
        7.             └─rlang::parse_exprs(x)
        8.               └─rlang:::chr_parse_exprs(x)
        9.                 └─rlang:::map(x, function(elt) as.list(parse(text = elt)))
       10.                   └─base::lapply(.x, .f, ...)
       11.                     └─rlang:::FUN(X[[i]], ...)
       12.                       ├─base::as.list(parse(text = elt))
       13.                       └─base::parse(text = elt)
      
      [ FAIL 2 | WARN 0 | SKIP 0 | PASS 411 ]
      Error: Test failures
      Execution halted
    ```

# tidygate

<details>

* Version: 0.4.0
* GitHub: NA
* Source code: https://github.com/cran/tidygate
* Date/Publication: 2021-01-18 16:30:03 UTC
* Number of recursive dependencies: 72

Run `cloud_details(, "tidygate")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Complete output:
      > library(testthat)
      > library(tidygate)
      > 
      > test_check("tidygate")
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-methods.R:75:5): gate DEPRECATED ──────────────────────────────
      `\.` does not match "is deprecated as of tidygate 0.3.0.".
      Actual value: "`gate\(\)` was deprecated in tidygate 0\.3\.0\.\\nPlease use `gate_chr\(\)` instead\.\\nThis warning is displayed once every 8 hours\.\\nCall `lifecycle::last_warnings\(\)` to see where this warning was generated\."
      
      [ FAIL 1 | WARN 0 | SKIP 0 | PASS 3 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘lme4’ ‘methods’ ‘stats’ ‘tidyselect’
      All declared Imports should be used.
    ```

