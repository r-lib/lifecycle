test_that("`signal_stage()` does nothing", {
  expect_null(signal_stage("experimental", "pkg::foo(bar = 'baz')"), NULL)
})

test_that("`signal_experimental()` and `signal_superseded()` are deprecated", {
  expect_snapshot({
    signal_experimental("1.1.0", "foo()")
  })
  expect_snapshot({
    signal_superseded("1.1.0", "foo()")
  })
})
