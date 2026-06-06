test_that("deprecated() returns the missing argument", {
  fn <- function(foo = deprecated()) is_present(foo)
  expect_false(fn())
  expect_true(fn(1))

  fn <- function(foo) is_present(foo)
  expect_false(fn())
  expect_true(fn(1))
})

test_that("deprecated() example reports the example function name", {
  foobar_adder <- function(foo, bar, baz = deprecated()) {
    if (is_present(baz)) {
      deprecate_warn("1.0.0", "foobar_adder(baz = )", "foobar_adder(bar = )")
      bar <- baz
    }

    foo + bar
  }

  expect_deprecated(foobar_adder(1, baz = 2), "foobar_adder\\(\\)")
})
