# Retrieve the lifecycle status defined in each Rd file
db_lifecycle <- function(db) {
  lifecycle_patterns <- paste0(
    "(?:",
    paste(
      collapse = "|",
      c(
        "lifecycle::badge\\([\\\\]\"",
        "rlang:::lifecycle\\([\\\\]\"",
        "list\\(\"lifecycle-",
        "https://www.tidyverse.org/lifecycle/#"
      )
    ),
    ")([\\w-]+)"
  )

  desc <- lapply(db, asNamespace("tools")$.Rd_get_metadata, "description")
  lapply(desc, function(x) {
    res <- regexpr(lifecycle_patterns, x, perl = TRUE)
    starts <- attr(res, "capture.start")
    ends <- starts + attr(res, "capture.length") - 1
    substring(x, starts, ends)
  })
}

# Retrieve the functions listed in the usage for each Rd file in the database
db_function <- function(db) {
  usage <- lapply(db, asNamespace("tools")$.Rd_get_section, "usage")
  lapply(usage, get_usage_function_names)
}

#' @param package The name of an installed package.
#' @param which The lifecycle statuses to retrieve.
#'   Include `NA` if you want to include functions without a specified lifecycle
#'   status in the results.
#' @export
#' @rdname lifecycle_linter
pkg_lifecycle_statuses <- function(
  package,
  which = c(
    "superseded",
    "deprecated",
    "questioning",
    "defunct",
    "experimental",
    "soft-deprecated",
    "retired"
  )
) {
  check_installed("vctrs")
  which <- match.arg(which, several.ok = TRUE)
  stopifnot(is_string(package))

  db <- tools::Rd_db(package)
  lc <- db_lifecycle(db)
  funs <- db_function(db)

  res <- mapply(
    function(lc, f) {
      data.frame(
        fun = f,
        lifecycle = rep(lc, length(f)),
        stringsAsFactors = FALSE
      )
    },
    lc,
    funs,
    SIMPLIFY = FALSE
  )

  res <- vctrs::vec_rbind(!!!res)

  # Filter funs without a lifecycle
  if (!NA %in% which) {
    res <- res[!is.na(res$lifecycle), ]
  }

  # Filter funs without a function name
  res <- res[nzchar(res$fun), ]

  # Filter method definitions
  res <- res[grep("[\\\\]method\\{", res$fun, invert = TRUE), ]

  # filter lifecycles not in which
  res <- res[res$lifecycle %in% which, ]

  if (nrow(res) == 0) {
    return(data.frame(
      package = character(),
      fun = character(),
      lifecycle = character()
    ))
  }

  res$package <- package

  res[c("package", "fun", "lifecycle")]
}

get_usage_function_names <- function(x) {
  if (!length(x)) {
    character(1)
  } else {
    res <- asNamespace("tools")$.parse_usage_as_much_as_possible(x)
    vapply(
      res,
      function(x) {
        if (is.call(x)) as.character(x[[1]]) else character(1)
      },
      character(1)
    )
  }
}

#' @rdname lifecycle_linter
#' @param path The directory path to the files you want to search.
#' @param pattern Any files matching this pattern will be searched. The default
#'   searches any files ending in `.R` or `.Rmd`.
#' @export
lint_lifecycle <- function(
  packages,
  path = ".",
  pattern = "(?i)[.](r|rmd|qmd|rnw|rhtml|rrst|rtex|rtxt)$",
  which = c(
    "superseded",
    "deprecated",
    "questioning",
    "defunct",
    "experimental",
    "soft-deprecated",
    "retired"
  ),
  symbol_is_undesirable = FALSE
) {
  which <- match.arg(which, several.ok = TRUE)

  check_installed(c("lintr", "vctrs", "xml2"))

  lintr::lint_dir(
    path = path,
    pattern = pattern,
    linters = lifecycle_linter(
      packages = packages,
      which = which,
      symbol_is_undesirable = symbol_is_undesirable
    )
  )
}

#' @rdname lifecycle_linter
#' @export
lint_tidyverse_lifecycle <- function(
  path = ".",
  pattern = "(?i)[.](r|rmd|qmd|rnw|rhtml|rrst|rtex|rtxt)$",
  which = c(
    "superseded",
    "deprecated",
    "questioning",
    "defunct",
    "experimental",
    "soft-deprecated",
    "retired"
  ),
  symbol_is_undesirable = FALSE
) {
  which <- match.arg(which, several.ok = TRUE)

  check_installed(c("lintr", "vctrs", "xml2", "tidyverse"))

  lint_lifecycle(
    packages = tidyverse::tidyverse_packages(),
    pattern = pattern,
    path = path,
    which = which,
    symbol_is_undesirable = symbol_is_undesirable
  )
}

#' Lint usages of functions that have a non-stable life cycle.
#'
#' - `lifecycle_linter()` creates a linter for lifecycle annotations which can be
#'   included in a `.lintr` configuration if `lintr` is used directly.
#' - `lint_lifecycle()` dynamically queries the package documentation for packages
#'   in `packages` for lifecycle annotations and then searches the directory in
#'   `path` for usages of those functions.
#' - `lint_tidyverse_lifecycle()` is a convenience function to call `lint_lifecycle()`
#'   for all the packages in the tidyverse.
#' - `pkg_lifecycle_statuses()` returns a data frame of functions with lifecycle
#'   annotations for an installed package.
#'
#' @param packages One or more installed packages to query for lifecycle statuses.
#' @param which Vector of lifecycle statuses to lint.
#' @param symbol_is_undesirable Also lint symbol usages, e.g. `lapply(x, is_na)`?
#'
#' @examples
#'
#' lintr::lint(text = "is_na(x)", linters = lifecycle_linter(packages = "rlang"))
#' lintr::lint(text = "lapply(x, is_na)", linters = lifecycle_linter(packages = "rlang", symbol_is_undesirable = TRUE))
#'
#' @export
lifecycle_linter <- function(
  packages = tidyverse::tidyverse_packages(),
  which = c(
    "superseded",
    "deprecated",
    "questioning",
    "defunct",
    "experimental",
    "soft-deprecated",
    "retired"
  ),
  symbol_is_undesirable = FALSE
) {
  check_installed(c("lintr", "vctrs", "xml2"))

  life_cycles <- vctrs::vec_rbind(
    !!!lapply(packages, pkg_lifecycle_statuses, which = which)
  )
  bad_usages <- sprintf(
    "`%s::%s` is %s",
    life_cycles$package,
    life_cycles$fun,
    life_cycles$lifecycle
  )
  names(bad_usages) <- life_cycles$fun

  if (symbol_is_undesirable) {
    xpath <- sprintf(
      "//SYMBOL_FUNCTION_CALL[%1$s] | //SYMBOL[%1$s]",
      paste0("text() = '", names(bad_usages), "'", collapse = " or ")
    )
  } else {
    xpath <- sprintf(
      "//SYMBOL_FUNCTION_CALL[%s]",
      paste0("text() = '", names(bad_usages), "'", collapse = " or ")
    )
  }

  lintr::Linter(function(source_expression) {
    if (!lintr::is_lint_level(source_expression, "expression")) {
      return(list())
    }

    matched_nodes <- xml2::xml_find_all(
      source_expression$xml_parsed_content,
      xpath
    )
    fun_names <- lintr::get_r_string(matched_nodes)

    lintr::xml_nodes_to_lints(
      matched_nodes,
      source_expression = source_expression,
      lint_message = unname(bad_usages[fun_names])
    )
  })
}
