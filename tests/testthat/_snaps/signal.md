# signal generates user friendly message

    Code
      (expect_condition(signal_stage("experimental", "foo()")))
    Output
      <lifecycle_stage: foo() is experimental>
    Code
      (expect_condition(signal_stage("superseded", "foo(bar)")))
    Output
      <lifecycle_stage: foo(arg) is superseded>

# signal_stage supports with

    Code
      (expect_condition(signal_stage("superseded", "foo()", "bar()")))
    Output
      <lifecycle_stage: foo() is superseded
      Please use `bar()` instead.>
    Code
      (expect_condition(signal_stage("superseded", "foo(bar=)", "foo(baz=)")))
    Output
      <lifecycle_stage: foo(arg) is superseded
      Please use the `baz` argument instead.>

