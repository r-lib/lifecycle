# admiral

<details>

* Version: 0.8.2
* GitHub: https://github.com/pharmaverse/admiral
* Source code: https://github.com/cran/admiral
* Date/Publication: 2022-09-29 10:00:04 UTC
* Number of recursive dependencies: 126

Run `cloud_details(, "admiral")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      Backtrace:
          ▆
       1. ├─testthat::expect_error(...) at test-deprecation.R:182:2
       2. │ └─testthat:::quasi_capture(...)
       3. │   ├─testthat (local) .capture(...)
       4. │   │ └─base::withCallingHandlers(...)
       5. │   └─rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
       6. └─admiral::date_source(dataset_name = "ae", date = ASTDTM, preserve = TRUE)
       7.   └─lifecycle::deprecate_stop(...)
       8.     └─lifecycle:::deprecate_stop0(msg)
       9.       └─rlang::cnd_signal(...)
      
      [ FAIL 3 | WARN 0 | SKIP 0 | PASS 495 ]
      Error: Test failures
      Execution halted
    ```

# readr

<details>

* Version: 2.1.2
* GitHub: https://github.com/tidyverse/readr
* Source code: https://github.com/cran/readr
* Date/Publication: 2022-01-30 22:30:02 UTC
* Number of recursive dependencies: 73

Run `cloud_details(, "readr")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘first_edition.R’
      Running ‘second_edition.R’
    Running the tests in ‘tests/second_edition.R’ failed.
    Last 13 lines of output:
      > 
      > test_check("readr")
      [ FAIL 1 | WARN 0 | SKIP 36 | PASS 710 ]
      
      ══ Skipped tests ═══════════════════════════════════════════════════════════════
      • On CRAN (22)
      • edition_first() is not TRUE (14)
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-read-fwf.R:65:3): ragged last column shrunk with warning ──────
      `x <- read_fwf("1a\n2ab\n3abc", fwf_widths(c(1, 3)))` did not throw the expected warning.
      
      [ FAIL 1 | WARN 0 | SKIP 36 | PASS 710 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking installed package size ... NOTE
    ```
      installed size is 10.8Mb
      sub-directories of 1Mb or more:
        libs   9.9Mb
    ```

