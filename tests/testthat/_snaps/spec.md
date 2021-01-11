# feature_spec() gives useful errors

    Code
      feature_spec(1)
    Error <rlang_error>
      Internal error in lifecycle: `what` must be a string

---

    Code
      feature_spec("foo")
    Error <rlang_error>
      Internal error in lifecycle: `what` must have function call syntax.
      
        # Good:
        signal_lifecycle("foo()")
      
        # Bad:
        signal_lifecycle("foo")

---

    Code
      feature_spec("foo()()")
    Error <rlang_error>
      Internal error in lifecycle: `what` must be a function or method call.

---

    Code
      feature_spec("foo(arg = , arg = )")
    Error <rlang_error>
      Internal error in lifecycle: Function in `what` (foo) must have 1 argument, not 2.

---

    Code
      feature_spec("foo(arg = arg)")
    Error <rlang_error>
      Internal error in lifecycle: `what` must contain reason as a string on the RHS of `=`.
      
        # Good:
        signal_lifecycle("foo(arg = 'must be a string')")
      
        # Bad:
        signal_lifecycle("foo(arg = 42)")

---

    Code
      feature_spec("foo()", env = e)
    Error <rlang_error>
      Internal error in lifecycle: Can't detect the package of the deprecated function.
      Please mention the namespace:
      
        # Good:
        signal_lifecycle(what = "namespace::myfunction()")
      
        # Bad:
        signal_lifecycle(what = "myfunction()")

# feature_spec() works with methods

    Code
      feature_spec("A$foo(bar = 1)")
    Error <rlang_error>
      Internal error in lifecycle: `what` must contain reason as a string on the RHS of `=`.
      
        # Good:
        signal_lifecycle("A$foo(arg = 'must be a string')")
      
        # Bad:
        signal_lifecycle("A$foo(arg = 42)")

