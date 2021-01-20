# signal generates user friendly message

    Code
      (expect_condition(signal_stage("experimental", "foo()")))
    Output
      <lifecycle_stage: foo() is experimental>
    Code
      (expect_condition(signal_stage("superseded", "foo(bar)")))
    Output
      <lifecycle_stage: foo(arg) is superseded>

# signal_experimental() and signal_superseded() are deprecated

    Code
      signal_experimental("1.0.0", "foo(arg = )")
    Warning <lifecycle_warning_deprecated>
      `signal_experimental()` was deprecated in lifecycle 1.0.0.
      Please use the `stage` argument of `signal_stage()` instead.
    Code
      signal_superseded("1.0.0", "foo(arg = )")
    Warning <lifecycle_warning_deprecated>
      `signal_superseded()` was deprecated in lifecycle 1.0.0.
      Please use the `stage` argument of `signal_stage()` instead.

