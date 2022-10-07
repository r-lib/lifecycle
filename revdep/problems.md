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

# rapbase

<details>

* Version: 1.23.0
* GitHub: https://github.com/Rapporteket/rapbase
* Source code: https://github.com/cran/rapbase
* Date/Publication: 2022-08-17 14:20:02 UTC
* Number of recursive dependencies: 110

Run `cloud_details(, "rapbase")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Failure (test-github.R:6:3): contributors are provided ──────────────────────
      class(getGithub("contributors", "rapbase")) not equal to "character".
      1/1 mismatches
      x[1]: "NULL"
      y[1]: "character"
      ── Failure (test-github.R:10:3): key can be provided ───────────────────────────
      grepl("ssh-rsa", getGithub("keys", "areedv")) is not TRUE
      
      `actual`:       
      `expected`: TRUE
      
      [ FAIL 2 | WARN 0 | SKIP 25 | PASS 190 ]
      Error: Test failures
      Execution halted
    ```

