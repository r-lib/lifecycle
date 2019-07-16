
expect_defunct <- function(object, ...) {
  expect_error(object, class = "defunctError")
}

expect_no_warning <- function(...) {
  expect_warning(regexp = NA, ...)
}
