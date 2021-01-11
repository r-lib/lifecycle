test_that("deprecated() returns the missing argument", {
  fn <- function(foo = deprecated()) is_present(foo)
  expect_false(fn())
  expect_true(fn(1))

  fn <- function(foo) is_present(foo)
  expect_false(fn())
  expect_true(fn(1))
})
