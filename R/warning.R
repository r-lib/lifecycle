#' Display last deprecation warnings
#'
#' @description
#'
#' `last_lifecycle_warnings()` returns a list of all warnings that
#' occurred during the last top-level R command, along with a
#' backtrace.
#'
#' Use `print(last_lifecycle_warnings(), simplify = level)` to control
#' the verbosity of the backtrace. The `simplify` argument supports
#' one of `"branch"` (the default), `"collapse"`, and `"none"` (in
#' increasing order of verbosity).
#'
#' @examples
#' # These examples are not run because `last_lifecycle_warnings()` does not
#' # work well within knitr and pkgdown
#' \dontrun{
#'
#' f <- function() invisible(g())
#' g <- function() list(h(), i())
#' h <- function() deprecate_warn("1.0.0", "this()")
#' i <- function() deprecate_warn("1.0.0", "that()")
#' f()
#'
#' # Print all the warnings that occurred during the last command:
#' last_lifecycle_warnings()
#'
#'
#' # By default, the backtraces are printed in their simplified form.
#' # Use `simplify` to control the verbosity:
#' print(last_lifecycle_warnings(), simplify = "none")
#' }
#' @export
last_lifecycle_warnings <- function() {
  structure(
    warnings_env$warnings,
    class = c("lifecycle_warnings", "list")
  )
}

new_deprecated_warning <- function(msg, trace, ..., footer = NULL) {
  warning_cnd(
    "lifecycle_warning_deprecated",
    message = msg,
    trace = trace,
    footer = footer,
    internal = list(...)
  )
}

#' @export
print.lifecycle_warnings <- function(x, ...) {
  local_interactive(FALSE)
  print(unclass(x))
}

warnings_env <- env(empty_env())

init_warnings <- function() {
  warnings_env$last_top_frame <- NULL
  warnings_env$warnings <- list()
}
init_warnings()

push_warning <- function(wrn) {
  current <- obj_address(sys.frame(1))

  if (identical(warnings_env$last_top_frame, current)) {
    warnings_env$warnings <- c(warnings_env$warnings, list(wrn))
  } else {
    warnings_env$last_top_frame <- current
    warnings_env$warnings <- list(wrn)
  }
}


# Contains unique IDs of deprecated features so we don't warn multiple times
deprecation_env <- env(empty_env())
