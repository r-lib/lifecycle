context("arg")

test_that("deprecated() returns the missing argument", {
  fn <- function(foo = deprecated()) is_supplied(foo)
  expect_false(fn())
  expect_true(fn(1))
})
