# feature_spec() works with methods

    Code
      feature_spec("A$foo(bar)")
    Error <rlang_error>
      Internal error: `what` must refer to arguments in the LHS of `=`.
      
        # Good:
        signal_lifecycle("A$foo(arg = )")
      
        # Bad:
        signal_lifecycle("A$foo(arg)")

---

    Code
      feature_spec("A$foo(bar = 1)")
    Error <rlang_error>
      Internal error: `what` must contain reason as a string on the RHS of `=`.
      
        # Good:
        signal_lifecycle("A$foo(arg = 'must be a string')")
      
        # Bad:
        signal_lifecycle("A$foo(arg = 42)")

