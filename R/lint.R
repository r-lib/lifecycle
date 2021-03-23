db_lifecycles <- function(db) {
  lifecycle_patterns <- paste0("(?:",
    paste(collapse = "|",
      c("lifecycle::badge\\([\\\\]\"",
        "rlang:::lifecycle\\([\\\\]\"",
        "list\\(\"lifecycle-",
        "https://www.tidyverse.org/lifecycle/#"
      )),
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

db_functions <- function(db) {
  usage <- lapply(db, asNamespace("tools")$.Rd_get_section, "usage")
  lapply(usage, get_rcode)
}

#' Lookup the lifecycle status for functions of currently installed packages
#'
#' @param pkg The name of an installed package
#' @param which The lifecycle statusname of an installed package
#' @export
pkg_function_lifecycles <- function(pkg, which = c("superseded", "deprecated", "questioning", "defunct", "experimental", "soft-deprecated", "retired")) {
  rlang::check_installed("vctrs")
  which <- match.arg(which, several.ok = TRUE)
  stopifnot(is.character(pkg) && length(pkg) == 1)

  db <- tools::Rd_db(pkg)
  lc <- db_lifecycles(db)
  funs <- db_functions(db)

  res <- mapply(function(lc, f) data.frame(fun = f, lifecycle = rep(lc, length(f)), stringsAsFactors = FALSE), lc, funs, SIMPLIFY = FALSE)

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
    return(data.frame(package = character(), fun = character(), lifecycle = character()))
  }

  res$package <- pkg

  res[c("package", "fun", "lifecycle")]
}

get_rcode <- function(x) {
  if (!length(x)) {
    character(1)
  } else {
    res <- asNamespace("tools")$.parse_usage_as_much_as_possible(x)
    vapply(res, function(x) {
      if (is.call(x)) as.character(x[[1]]) else character(1)
    }, character(1))
  }
}

# pak::pak("jimhester/lintr")

#' Lint usages of functions that have a non-stable life cycle.
#'
#' `lint_lifecycle` dynamically queries the package documentation for packages in `packages` for lifecycle annotations and then searches the directory in `path` for usages of those functions.
#' `lint_tidyverse_lifecycle` is a convince function to call `lint_lifecycle` for all the packages in the tidyverse.
#'
#' @param path The path to the files you want to search
#' @param which The lifecycle stages you want to lint
#' @export
lint_lifecycle <- function(package, path = ".", which = c("superseded", "deprecated", "questioning", "defunct", "experimental", "soft-deprecated", "retired")) {
  which <- match.arg(which, several.ok = TRUE)

  rlang::check_installed(c("lintr", "vctrs"))

  life_cycles <- vctrs::vec_rbind(!!!lapply(package, pkg_function_lifecycles, which = which))

  msgs <- sprintf("`%s::%s` is %s", life_cycles$package, life_cycles$fun, life_cycles$lifecycle)

  lifecycle_linter <- function(source_file) {
    lapply(
      lintr::ids_with_token(source_file, "SYMBOL_FUNCTION_CALL", fun = `%in%`),
      function(id) {
        token <- lintr::with_id(source_file, id)
        fun_name <- token[["text"]]
        has_lifecycle_fun <- fun_name == life_cycles$fun
        if (any(has_lifecycle_fun)) {
          line_num <- token[["line1"]]
          start_col_num <- token[["col1"]]
          end_col_num <- token[["col2"]]

          # In case more than one lifecycle function matches, we only take the first one.
          msg <- msgs[has_lifecycle_fun][[1]]
          lintr::Lint(
            filename = source_file[["filename"]],
            line_number = line_num,
            column_number = start_col_num,
            type = "warning",
            message = msg,
            line = source_file[["lines"]][[as.character(line_num)]],
            ranges = list(c(start_col_num, end_col_num))
          )
        }
      }
    )
  }

  lintr::lint_dir(path = path, linters = lifecycle_linter)
}

#' @rdname lint_lifecycle
#' @export
lint_tidyverse_lifecycle <- function(path = ".", which = c("superseded", "deprecated", "questioning", "defunct", "experimental", "soft-deprecated", "retired")) {
  which <- match.arg(which, several.ok = TRUE)

  rlang::check_installed(c("lintr", "vctrs", "tidyverse"))

  lint_lifecycle(package = tidyverse::tidyverse_packages(), path = path, which = which)
}
