# spec() gives useful errors

    Code
      spec(1)
    Condition
      Error:
      ! `what` must be a single string, not a number.

---

    Code
      spec("foo")
    Condition
      Error:
      ! `what` must have function call syntax.
      
        # Good:
        signal_lifecycle("foo()")
      
        # Bad:
        signal_lifecycle("foo")

---

    Code
      spec("foo()()")
    Condition
      Error:
      ! `what` must be a function or method call.

---

    Code
      spec("foo(arg = , arg = )")
    Condition
      Error:
      ! Function in `what` (foo) must have 1 argument, not 2.

---

    Code
      spec("foo(arg = arg)")
    Condition
      Error:
      ! `what` must contain reason as a string on the RHS of `=`.
      
        # Good:
        signal_lifecycle("foo(arg = 'must be a string')")
      
        # Bad:
        signal_lifecycle("foo(arg = 42)")

---

    Code
      spec("foo()", env = e)
    Condition
      Error:
      ! Can't detect the package of the deprecated function.
      Please mention the namespace:
      
        # Good:
        signal_lifecycle(what = "namespace::myfunction()")
      
        # Bad:
        signal_lifecycle(what = "myfunction()")

# spec() works with methods

    Code
      spec("A$foo(bar = 1)")
    Condition
      Error:
      ! `what` must contain reason as a string on the RHS of `=`.
      
        # Good:
        signal_lifecycle("A$foo(arg = 'must be a string')")
      
        # Bad:
        signal_lifecycle("A$foo(arg = 42)")

