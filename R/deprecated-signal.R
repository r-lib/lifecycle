#' Deprecated functions for signalling lifecycle stages
#'
#' @description
#' `r badge("deprecated")`
#' @name deprecated-signallers
#' @keywords internal
NULL

#' @rdname deprecated-signallers
#' @export
signal_stage <- function(stage, what, with = NULL, env = caller_env()) {
  deprecate_soft(
    "1.1.0",
    what = "signal_stage()",
    id = "lifecycle_signal_stage"
  )
  signal_stage_impl(stage, what, with, env)
}

#' @rdname deprecated-signallers
#' @export
signal_experimental <- function(when, what, env = caller_env()) {
  deprecate_soft(
    "1.1.0",
    what = "signal_experimental()",
    id = "lifecycle_signal_stage_experimental"
  )
  signal_stage_impl("experimental", what, with = NULL, env = env)
}

#' @rdname deprecated-signallers
#' @export
signal_superseded <- function(when, what, env = caller_env()) {
  deprecate_soft(
    "1.1.0",
    what = "signal_superseded()",
    id = "lifecycle_signal_stage_superseded"
  )
  signal_stage_impl("superseded", what, with = NULL, env = env)
}

signal_stage_impl <- function(stage, what, with, env) {
  stage <- arg_match0(stage, c("experimental", "superseded", "deprecated"))
  cnd <- new_lifecycle_stage_cnd(stage, what, with, env)
  cnd_signal(cnd)
}

new_lifecycle_stage_cnd <- function(stage, what, with, env) {
  out <- list(stage = stage, what = what, with = with, env = env)
  class(out) <- c("lifecycle_stage", "condition")
  out
}

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
