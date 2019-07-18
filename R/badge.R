#' Embed a lifecycle badge in documentation
#'
#' @description
#'
#' Use `badge()` within a `Sexpr` macro to embed a
#' [lifecycle](https://www.tidyverse.org/lifecycle/) badge in your
#' documentation. A good place for this badge is at the top of the
#' topic description:
#'
#' ```
#' \Sexpr[results=rd, stage=render]{lifecycle::badge("questioning")}
#' ```
#'
#' The badge is displayed as an image in the HTML version of the
#' documentation. To make them available in your package, visit
#' <https://github.com/r-lib/rlang/tree/master/man/figures> and copy
#' all the files starting with `lifecycle-` in your `man/figures/`
#' folder.
#'
#' @param stage A lifecycle stage as a string, one of:
#'   `"experimental"`, `"maturing"`, `"stable"`, `"questioning"`,
#'   `"archived"`, `"soft-deprecated"`, `"deprecated"`, `"defunct"`.
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
