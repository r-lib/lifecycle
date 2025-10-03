# signal generates user friendly message

    Code
      (expect_condition(signal_stage("experimental", "foo()")))
    Output
      <lifecycle_stage: foo() is experimental>
    Code
      (expect_condition(signal_stage("superseded", "foo(bar)")))
    Output
      <lifecycle_stage: foo(bar) is superseded>

# signal_stage supports with

    Code
      (expect_condition(signal_stage("superseded", "foo()", "bar()")))
    Output
      <lifecycle_stage: foo() is superseded
      Please use `bar()` instead.>
    Code
      (expect_condition(signal_stage("superseded", "foo(bar=)", "foo(baz=)")))
    Output
      <lifecycle_stage: foo(bar) is superseded
      Please use the `baz` argument instead.>

# `signal_stage()` and friends are deprecated

    Code
      signal_stage("superseded", "foo()", "bar()")
    Condition
      Warning:
      `signal_stage()` was deprecated in lifecycle 1.1.0.

---

    Code
      signal_experimental("1.1.0", "foo()")
    Condition
      Warning:
      `signal_experimental()` was deprecated in lifecycle 1.1.0.

---

    Code
      signal_superseded("1.1.0", "foo()")
    Condition
      Warning:
      `signal_superseded()` was deprecated in lifecycle 1.1.0.

