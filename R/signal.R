#' Signal other experimental or superseded features
#'
#' @description
#' `r badge("experimental")`
#'
#' `signal_stage()` allows you to signal life cycle stages other than
#' deprecation (for which you should use [deprecate_warn()] and friends). There
#' is no behaviour associated with this signal, it is currently purely a way to
#' express intent at the call site.
#'
#' @param stage Life cycle stage, either `"experimental"` or `"superseded"`.
#'
#' @param what String describing what feature the stage applies too, using the
#'   same syntax as [deprecate_warn()].
#'
#' @param with An optional string giving a recommended replacement for a
#'   superseded function.
#'
#' @param env `r badge("deprecated")`
#'
#' @export
#' @examples
#' foofy <- function(x, y, z) {
#'   signal_stage("experimental", "foofy()")
#'   x + y / z
#' }
#' foofy(1, 2, 3)
signal_stage <- function(stage, what, with = NULL, env = deprecated()) {
  # Does nothing
  invisible()
}

#' Deprecated functions for signalling lifecycle stages
#'
#' @description
#' `r badge("deprecated")`
#' @name deprecated-signallers
#' @keywords internal
NULL

#' @rdname deprecated-signallers
#' @export
signal_experimental <- function(when, what, env = caller_env()) {
  deprecate_soft(
    "1.1.0",
    what = "signal_experimental()",
    with = "signal_stage()",
    id = "lifecycle_signal_experimental"
  )
  signal_stage("experimental", what)
}

#' @rdname deprecated-signallers
#' @export
signal_superseded <- function(when, what, env = caller_env()) {
  deprecate_soft(
    "1.1.0",
    what = "signal_superseded()",
    with = "signal_stage()",
    id = "lifecycle_signal_superseded"
  )
  signal_stage("superseded", what)
}
