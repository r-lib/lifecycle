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
#' backtrace. Pass the `simplify` argument to control the verbosity of
#' the backtrace. It supports one of `"branch"` (the default),
#' `"collapse"`, and `"none"` (in increasing order of verbosity).
#'
#' @examples
#'
#' # Do not run this. This reduces the verbosity of backtraces when
#' # run inside knitr or pkgdown.
#' options(rlang_trace_top_env = environment())
#'
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


new_deprecated_warning <- function(msg, trace) {
  warning_cnd(
    "lifecycle_warning_deprecated",
    message = msg,
    trace = trace
  )
}

#' @export
print.lifecycle_warning_deprecated <- function(x, ..., simplify = c("branch", "collapse", "none")) {
  cat_line(bold("<deprecated>"))

  message <- x$message
  if (is_string(message) && nzchar(message)) {
    cat_line(sprintf("message: %s", italic(message)))
  }

  trace <- x$trace
  if (!is_null(trace)) {
    cat_line("backtrace:")
    cat_line(red(format(trace, ..., simplify = simplify)))
  }

  invisible(x)
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
