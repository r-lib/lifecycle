#' Signal experimental or superseded features
#'
#' @description
#'
#' \lifecycle{experimental}
#'
#' These functions signal simple conditions with [rlang::signal()]
#' (see also [base::signalCondition()]). They don't have any effect
#' unless a condition handler is installed for conditions of class
#' `lifecycle_experimental` or `lifecycle_superseded`.
#'
#' @param when The version at which the feature was assigned a
#'   lifecycle stage.
#' @param what,with Feature specifications for the feature and
#'   optionally its replacement. See [deprecate_soft()] for details.
#'
#' @details
#' In order to be fast, `signal_experimental()` and
#' `signal_superseded()` do not validate their arguments. Instead, you
#' need to catch the condition object and pass it to
#' `lifecycle_cnd_data()` to get structured data.
#'
#' @keywords internal
#' @export
signal_experimental <- function(when, what) {
  signal(
    "",
    "lifecycle_experimental",
    when = when,
    what = what
  )
}
#' @rdname signal_experimental
#' @export
signal_superseded <- function(when, what, with = NULL) {
  signal(
    "",
    "lifecycle_superseded",
    when = when,
    what = what,
    with = with
  )
}

#' @rdname signal_experimental
#' @param cnd A condition object thrown by `signal_experimental()` or
#'   `signal_superseded()`.
#' @export
lifecycle_cnd_data <- function(cnd) {
  if (inherits(cnd, "lifecycle_experimental")) {
    lifecycle <- "experimental"
    signaller <- "signal_experimental"
  } else if (inherits(cnd, "lifecycle_superseded")) {
    lifecycle <- "superseded"
    signaller <- "signal_superseded"
  } else {
    class <- paste(class(cnd), collapse = "/")
    abort(glue::glue(
      "Internal error: Unsupported class `{class}` in `lifecycle_cnd_data()`."
    ))
  }

  what <- feature_spec(cnd$what, signaller = signaller)

  if (is_null(cnd$with)) {
    with <- NULL
  } else {
    with <- feature_spec(cnd$with, signaller = signaller)
  }

  list(
    when = cnd$when,
    what = what,
    with = with,
    lifecycle = lifecycle
  )
}
