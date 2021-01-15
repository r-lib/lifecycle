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
      The `stage` argument of `signal_stage()` is deprecated as of lifecycle 1.0.0.
    Code
      signal_superseded("1.0.0", "foo(arg = )")
    Warning <lifecycle_warning_deprecated>
      The `stage` argument of `signal_stage()` is deprecated as of lifecycle 1.0.0.

