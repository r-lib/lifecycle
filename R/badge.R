#' Embed a lifecycle badge in documentation
#'
#' @description
#'
#' To include lifecycle badges in your documentation:
#'
#' 1. Call `usethis::use_lifecycle()` to copy the badge images into the
#'    `man/` folder of your package.
#'
#' 2. Call `lifecycle::badge()` inside R backticks to insert a
#'    lifecycle badge:
#'
#'     ```
#'     #' `r lifecycle::badge("experimental")`
#'     #' `r lifecycle::badge("deprecated")`
#'     #' `r lifecycle::badge("superseded")`
#'     ```
#'
#'    If the deprecated feature is a function, a good place for this
#'    badge is at the top of the topic description. If it is an argument,
#'    you can put the badge in the argument description.
#'
#' The badge is displayed as an image in the HTML version of the
#' documentation and as text otherwise.
#'
#' `lifecycle::badge()` is run by roxygen at build time so you don't need
#' to add lifecycle to `Imports:` just to use the badges. However, it's still
#' good practice to add to `Suggests:` so that it will be available to
#' package developers.
#'
#' @section Badges:
#' * `r lifecycle::badge("experimental")` `lifecycle::badge("experimental")`
#' * `r lifecycle::badge("stable")` `lifecycle::badge("stable")`
#' * `r lifecycle::badge("superseded")` `lifecycle::badge("superseded")`
#' * `r lifecycle::badge("deprecated")` `lifecycle::badge("deprecated")`
#'
#' The meaning of these stages is described in
#' `vignette("stages")`.
#'
#' @param stage A lifecycle stage as a string. Must be one of
#'   `"experimental"`, `"stable"`, `"superseded"`, or `"deprecated"`.
#' @return An `Rd` expression describing the lifecycle stage.
#'
#' @export
badge <- function(stage) {
  old <- c("maturing", "questioning", "soft-deprecated", "defunct", "retired")
  if (!stage %in% old) {
    stage <- arg_match0(
      stage,
      c("experimental", "stable", "superseded", "deprecated")
    )
  }

  url <- paste0("https://lifecycle.r-lib.org/articles/stages.html#", stage)
  html <- sprintf(
    "\\href{%s}{\\figure{%s}{options: alt='[%s]'}}",
    url,
    file.path(sprintf("lifecycle-%s.svg", stage)),
    upcase1(stage)
  )
  text <- sprintf("\\strong{[%s]}", upcase1(stage))

  sprintf("\\ifelse{html}{%s}{%s}", html, text)
}
