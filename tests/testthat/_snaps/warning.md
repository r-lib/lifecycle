# deprecation warning is displayed with backtrace

    Code
      last_lifecycle_warnings()
    Output
      [[1]]
      <deprecated>
      message: `trace()` was deprecated in lifecycle 1.0.0.
      Backtrace:
        1. lifecycle::expect_deprecated(f())
        8. lifecycle (local) f()
        9. lifecycle (local) g()
       10. lifecycle (local) h()
      

