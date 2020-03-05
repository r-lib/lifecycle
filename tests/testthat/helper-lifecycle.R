
expect_defunct <- function(object, ...) {
  expect_error(object, class = "defunctError")
}

expect_no_warning <- function(...) {
  expect_warning(regexp = NA, ...)
}

try2 <- function(expr) {
  cat(paste0("\n", as_label2(substitute(expr)), ":\n\n"))
  cat(catch_cnd(expr, classes = "error")$message, "\n\n")
}

cat_ruler <- function(title) {
  cat(paste0("\n\n", title, "\n", strrep("=", nchar(title)), "\n\n"))
}

verify_errors <- function(expr) expr

spec_data <- function(fn = NULL, arg = NULL, pkg = NULL, details = NULL) {
  list(
    fn = fn,
    arg = arg,
    pkg = pkg,
    details = details
  )
}
