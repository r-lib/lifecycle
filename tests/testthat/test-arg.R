context("arg")

test_that("deprecated() returns the missing argument", {
  fn <- function(foo = deprecated()) is_missing(foo)
  expect_true(fn())
  expect_false(fn(1))
})
