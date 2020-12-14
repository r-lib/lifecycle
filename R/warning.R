#' Display last deprecation warnings
#'
#' @description
#'
#' Call these helpers to see the last deprecation warnings along with
#' their backtrace:
#'
#' * `last_warnings()` returns a list of all warnings that occurred
#'   during the last top-level R command.
#'
#' * `last_warning()` returns only the last.
#'
#' If you call these in the console, these warnings are printed with a
#' backtrace. Use `print(last_warnings(), simplify = level)` to
#' control the verbosity of the backtrace. The `simplify` argument
#' supports one of `"branch"` (the default), `"collapse"`, and
#' `"none"` (in increasing order of verbosity).
#'
#' @examples
#' # These examples are not run because `last_warnings()` does not
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
#' last_warnings()
#'
#' # Print only the last one:
#' last_warning()
#'
#'
#' # By default, the backtraces are printed in their simplified form.
#' # Use `simplify` to control the verbosity:
#' print(last_warnings(), simplify = "none")
#'
#' }
#' @export
last_warnings <- function() {
  warnings_env$warnings
}
#' @rdname last_warnings
#' @export
last_warning <- function() {
  n <- length(warnings_env$warnings)

  if (n) {
    warnings_env$warnings[[n]]
  } else {
    NULL
  }
}


new_deprecated_warning <- function(msg, trace, ...) {
  warning_cnd(
    "lifecycle_warning_deprecated",
    message = msg,
    trace = trace,
    internal = list(...)
  )
}

#' @export
conditionMessage.lifecycle_warning_deprecated <- function(c) {
  paste_line(
    c$message,
    c$internal$footer
  )
}

#' @export
print.lifecycle_warning_deprecated <- function(x, ..., simplify = c("branch", "collapse", "none")) {
  cat_line(bold("<deprecated>"))

  message <- x$message
  if (is_string(message) && nzchar(message)) {
    cat_line(sprintf("message: %s", italic(message)))
  }

  print_trace(x, ..., simplify = simplify)

  invisible(x)
}

print_trace <- function(cnd, ..., simplify = c("branch", "collapse", "none")) {
  trace <- cnd$trace

  if (!is_null(trace)) {
    cat_line(bold("Backtrace:"))
    cat_line(red(format(trace, ..., simplify = simplify)))
  }
}

warnings_env <- env(empty_env())

init_warnings <- function() {
  warnings_env$last_top_frame <- NULL
  warnings_env$warnings <- list()
}
init_warnings()

push_warning <- function(wrn) {
  current <- sexp_address(sys.frame(1))

  if (identical(warnings_env$last_top_frame, current)) {
    warnings_env$warnings <- c(warnings_env$warnings, list(wrn))
  } else {
    warnings_env$last_top_frame <- current
    warnings_env$warnings <- list(wrn)
  }
}


# Contains unique IDs of deprecated features so we don't warn multiple times
deprecation_env <- env(empty_env())
