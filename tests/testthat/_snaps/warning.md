# deprecation warning is displayed with backtrace

    Code
      last_warning()
    Output
      <deprecated>
      message: `trace()` was deprecated in lifecycle 1.0.0.
      Backtrace:
        1. lifecycle::expect_deprecated(f())
        8. lifecycle:::f()
        9. lifecycle:::g()
       10. lifecycle:::h()
    Code
      print(last_warning(), simplify = "none")
    Output
      <deprecated>
      message: `trace()` was deprecated in lifecycle 1.0.0.
      Backtrace:
           x
        1. +-lifecycle::expect_deprecated(f())
        2. | \-testthat::expect_warning(...)
        3. |   \-testthat:::expect_condition_matching(...)
        4. |     \-testthat:::quasi_capture(...)
        5. |       +-testthat:::.capture(...)
        6. |       | \-base::withCallingHandlers(...)
        7. |       \-rlang::eval_bare(quo_get_expr(.quo), quo_get_env(.quo))
        8. \-lifecycle:::f()
        9.   \-lifecycle:::g()
       10.     \-lifecycle:::h()

