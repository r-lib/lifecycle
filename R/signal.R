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
  stage <- arg_match0(stage, c("experimental", "superseded", "deprecated"))
  cnd <- new_lifecycle_stage_cnd(stage, what, with, env)
  # Using `signalCondition()` over `cnd_signal()` because `cnd_signal()` is a
  # bit slower due to adding a `rlang_muffle` restart on with `withRestarts()`,
  # which we've decided we don't need for a `lifecycle_stage` condition.
  signalCondition(cnd)
}

new_lifecycle_stage_cnd <- function(stage, what, with, env) {
  out <- list(stage = stage, what = what, with = with, env = env)
  class(out) <- c("lifecycle_stage", "condition")
  out
}

# We could export this if packages have a need to capture a lifecycle
# condition and manipulate this data to generate their own custom message
lifecycle_stage_cnd_data <- function(cnd) {
  stage <- cnd$stage
  what <- cnd$what
  with <- cnd$with
  env <- cnd$env

  what <- spec(what, env = env)

  if (is_null(what$arg)) {
    message <- sprintf("%s() is %s", what$fn, stage)
  } else {
    message <- sprintf("%s(%s) is %s", what$fn, what$arg, stage)
  }

  if (!is_null(with)) {
    with <- spec(with, NULL, "signal_stage")
    message <- paste0(message, "\n", lifecycle_message_with(with, what))
  }

  list(
    message = message,
    stage = stage,
    package = what$pkg,
    function_nm = what$fn,
    argument = what$arg,
    reason = what$reason
  )
}

# `cnd_signal()` calls `signalCondition()`, which currently eagerly evaluates
# `conditionMessage()`, meaning that right now we don't save any time by making
# the message generation lazy. But we are hoping to fix this in base R in the
# future, since the message is only used in the error path and could be
# generated on demand at that point.
# https://github.com/wch/r-source/blob/f200c30b1a20dfa9394d7facff616e9cb2a42c6d/src/library/base/R/conditions.R#L157-L163
# https://github.com/wch/r-source/blob/f200c30b1a20dfa9394d7facff616e9cb2a42c6d/src/main/errors.c#L1904-L1909
#' @export
conditionMessage.lifecycle_stage <- function(c) {
  lifecycle_stage_cnd_data(c)$message
}

#' Deprecated functions for signalling experimental and lifecycle stages
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
