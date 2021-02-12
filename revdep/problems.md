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

