#' Embed a lifecycle badge in documentation
#'
#' @description
#'
#' Call `usethis::use_lifecycle()` to import the badges in your
#' package. Then use the `lifecycle` Rd macro to insert a lifecycle
#' badges in your documentation, with the relevant lifecycle stage as
#' argument:
#'
#' ```
#' \lifecycle{experimental}
#' \lifecycle{soft-deprecated}
#' ```
#'
#' The badge is displayed as image in the HTML version of the
#' documentation and as text otherwise.
#'
#' If the deprecated feature is a function, a good place for this
#' badge is at the top of the topic description (if the deprecated
#' function is documented with other functions, it might be a good
#' idea to extract it in its own documentation topic to prevent
#' confusion). If it is an argument, you can put the badge in the
#' argument description.
#'
#' @section Badges:
#' * \verb{\lifecycle{experimental}}: \lifecycle{experimental}
#' * \verb{\lifecycle{maturing}}: \lifecycle{maturing}
#' * \verb{\lifecycle{stable}}: \lifecycle{stable}
#' * \verb{\lifecycle{questioning}}: \lifecycle{questioning}
#' * \verb{\lifecycle{retired}}: \lifecycle{retired}
#' * \verb{\lifecycle{archived}}: \lifecycle{archived}
#' * \verb{\lifecycle{soft-deprecated}}: \lifecycle{soft-deprecated}
#' * \verb{\lifecycle{deprecated}}: \lifecycle{deprecated}
#' * \verb{\lifecycle{defunct}}: \lifecycle{defunct}
#'
#' @details
#'
#' The `lifecycle{}` macro is made available by adding this field to
#' DESCRIPTION (this is done automatically by
#' `usethis::use_lifecycle()`):
#'
#' ```
#' RdMacros: lifecycle
#' ```
#'
#' The macro expands to this expression:
#'
#' ```
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("experimental")}
#' ```
#'
#' @param stage A lifecycle stage as a string, one of:
#'   `"experimental"`, `"maturing"`, `"stable"`, `"questioning"`,
#'   `"archived"`, `"soft-deprecated"`, `"deprecated"`, `"defunct"`.
#' @return An `Rd` expression describing the lifecycle stage.
#'
#' @export
badge <- function(stage) {
  url <- paste0("https://www.tidyverse.org/lifecycle/#", stage)
  img <- lifecycle_img(stage, url)

  sprintf("\\ifelse{html}{%s}{\\strong{%s}}", img, upcase1(stage))
}

lifecycle_img <- function(stage, url) {
  file <- sprintf("lifecycle-%s.svg", stage)
  stage_alt <- upcase1(stage)

  switch(stage,

    experimental = ,
    maturing = ,
    stable = ,
    questioning = ,
    retired = ,
    archived =
      sprintf(
        "\\out{<a href='%s'><img src='%s' alt='%s lifecycle'></a>}",
        url,
        file.path("figures", file),
        stage_alt
      )
   ,

    `soft-deprecated` = ,
    deprecated = ,
    defunct =
      sprintf(
        "\\figure{%s}{options: alt='%s lifecycle'}",
        file,
        stage_alt
      ),

    abort(sprintf("Unknown lifecycle stage `%s`", stage))

  )
}
