# signal message emits class name, but no message

    Code
      (expect_condition(signal_stage("experimental", "foo()")))
    Output
      <lifecycle_stage: >
    Code
      (expect_condition(signal_stage("superseded", "foo(bar)")))
    Output
      <lifecycle_stage: >

# `signal_stage()` supports `with`

    Code
      lifecycle_stage_cnd_data(cnd)$message
    Output
      [1] "foo() is superseded\nPlease use `bar()` instead."

---

    Code
      lifecycle_stage_cnd_data(cnd)$message
    Output
      [1] "foo(bar) is superseded\nPlease use the `baz` argument instead."

# `signal_experimental()` and `signal_superseded()` are deprecated

    Code
      signal_experimental("1.1.0", "foo()")
    Condition
      Warning:
      `signal_experimental()` was deprecated in lifecycle 1.1.0.
      i Please use `signal_stage()` instead.
    Output
      NULL

---

    Code
      signal_superseded("1.1.0", "foo()")
    Condition
      Warning:
      `signal_superseded()` was deprecated in lifecycle 1.1.0.
      i Please use `signal_stage()` instead.
    Output
      NULL

