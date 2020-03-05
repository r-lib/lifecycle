
test_that("signal_experimental() and signal_superseded() work", {
  expect_condition(signal_experimental("1.0.0", "foo"), class = "lifecycle_experimental")
  expect_condition(signal_superseded("1.0.0", "foo"), class = "lifecycle_superseded")
})

test_that("lifecycle_cnd_data() extracts data", {
  cnd <- catch_cnd(signal_experimental("1.0.0", "foo(arg = )"))
  expect_identical(lifecycle_cnd_data(cnd), list(
    when = "1.0.0",
    what = feature_spec("foo(arg =)"),
    with = NULL,
    lifecycle = "experimental"
  ))

  cnd <- catch_cnd(signal_superseded("0.0.1", "foo(arg = 'details')", "pkg::bar()"))
  expect_identical(lifecycle_cnd_data(cnd), list(
    when = "0.0.1",
    what = feature_spec("foo(arg = 'details')"),
    with = feature_spec("pkg::bar()"),
    lifecycle = "superseded"
  ))

  expect_error(lifecycle_cnd_data(error_cnd("foo")), "Unsupported class")
})
