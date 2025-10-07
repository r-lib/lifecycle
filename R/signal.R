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
#' @param env Environment to determine where `signal_stage()` was called, used
#'   to determine the package name.
#'
#' @export
#' @examples
#' foofy <- function(x, y, z) {
#'   signal_stage("experimental", "foofy()")
#'   x + y / z
#' }
#' foofy(1, 2, 3)
signal_stage <- function(stage, what, with = NULL, env = caller_env()) {
  stage <- arg_match0(stage, c("experimental", "superseded"))

  # Validation isn't done on `what` and `with` right now, for performance
  cnd <- new_lifecycle_stage_cnd(stage, what, with, env)

  # Use `signalCondition()` over `cnd_signal()` to avoid the extra overhead.
  # `cnd_signal()` installs an `rlang_muffle` restart that we don't need.
  signalCondition(cnd)
}

new_lifecycle_stage_cnd <- function(stage, what, with, env) {
  out <- list(stage = stage, what = what, with = with, env = env)
  class(out) <- c("lifecycle_stage", "condition")
  out
}

# We could export this if packages have a need to capture a lifecycle condition
# and manipulate this data to generate their own custom message. Currently it is
# only used for tests.
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

# `signalCondition()` currently eagerly evaluates `conditionMessage()`, meaning
# that we can't actually make a lazy message. Because we want `signal_stage()`
# to be performant, we instead just emit a static `""` as our message, which is
# only ever seen if someone were to catch the condition with `catch_cnd()` and
# then print it out, which is highly unlikely.
#
# We are hoping to fix this in base R in the future, since the message is only
# used for error conditions in combination with the debugger, and could be
# generated on demand for this case.
# https://github.com/wch/r-source/blob/f200c30b1a20dfa9394d7facff616e9cb2a42c6d/src/library/base/R/conditions.R#L157-L163
# https://github.com/wch/r-source/blob/f200c30b1a20dfa9394d7facff616e9cb2a42c6d/src/main/errors.c#L1904-L1909
#' @export
conditionMessage.lifecycle_stage <- function(c) {
  ""
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
  signal_stage("experimental", what, with = NULL, env = env)
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
  signal_stage("superseded", what, with = NULL, env = env)
}
