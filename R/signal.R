#' Signal other experimental or superseded features
#'
#' @description
#' `r badge("experimental")`
#'
#' `signal_stage()` allows you to signal life cycle stages other than
#' deprecation (for which you should use [deprecate_warn()] and friends).
#' There is no behaviour associated with this signal, but in the future
#' we will provide tools to log and report on usage of experimental and
#' superseded functions.
#'
#' @param stage Life cycle stage, either "experimental" or "superseded".
#' @param what String describing what feature the stage applies too, using
#'   the same syntax as [deprecate_warn()].
#' @param with An optional string giving a recommended replacement for
#'   a superseded function.
#' @param env Environment used to determine where `signal_stage()`
#'   was called, used to determine the package name).
#' @export
#' @examples
#' foofy <- function(x, y, z) {
#'   signal_stage("experimental", "foofy()")
#'   x + y / z
#' }
#' foofy(1, 2, 3)
signal_stage <- function(stage, what, with = NULL, env = caller_env()) {
  stage <- arg_match(stage, c("experimental", "superseded", "deprecated"))
  what <- spec(what, env = env)

  if (is_null(what$arg)) {
    msg <- glue::glue_data(what, "{fn}() is {stage}")
  } else {
    msg <- glue::glue_data(what, "{fn}(arg) is {stage}")
  }

  if (!is_null(with)) {
    with <- spec(with, NULL, "signal_stage")
    msg <- paste0(msg, "\n", lifecycle_message_with(with, what))
  }

  signal(msg, "lifecycle_stage",
    stage = stage,
    package = what$pkg,
    function_nm = what$fn,
    argument = what$arg,
    reason = what$reason
  )
}

#' Deprecated funtions for signalling experimental and lifecycle stages
#'
#' @description
#' `r badge("deprecated")`
#' Please use [signal_stage()] instead
#' @keywords internal
#' @export
signal_experimental <- function(when, what, env = caller_env()) {
  signal_stage("experimental", what, env = env)
}
#' @rdname signal_experimental
#' @export
signal_superseded <- function(when, what, env = caller_env()) {
  signal_stage("superseded", what, env = env)
}
