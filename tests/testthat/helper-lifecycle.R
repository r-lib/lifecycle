expect_lifecycle_defunct <- function(object, ...) {
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

spec_data <- function(fn = NULL,
                      arg = NULL,
                      pkg = spec_pkg(NULL, caller_env()),
                      reason = NULL,
                      from = "signal_lifecycle") {
  list(
    fn = fn,
    arg = arg,
    pkg = pkg,
    reason = reason,
    from = from
  )
}

new_callers <- function(deprecated_feature, env = caller_env()) {
  direct <- inject(function(...) (!!deprecated_feature)(...))
  indirect <- inject(function(...) (!!deprecated_feature)(...))

  environment(direct) <- global_env()
  environment(indirect) <- ns_env("base")

  list(direct, indirect)
}
