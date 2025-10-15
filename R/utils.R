upcase1 <- function(x) {
  substr(x, 1, 1) <- toupper(substr(x, 1, 1))
  x
}

cat_line <- function(...) {
  cat(paste0(..., "\n", collapse = ""))
}
paste_line <- function(...) {
  paste(chr(...), collapse = "\n")
}

# nocov start
red <- function(x) cli::col_red(x)
blue <- function(x) cli::col_blue(x)
green <- function(x) cli::col_green(x)
yellow <- function(x) cli::col_yellow(x)
magenta <- function(x) cli::col_magenta(x)
cyan <- function(x) cli::col_cyan(x)
blurred <- function(x) cli::style_blurred(x)
silver <- function(x) cli::col_silver(x)
bold <- function(x) cli::style_bold(x)
italic <- function(x) cli::style_italic(x)
underline <- function(x) cli::style_underline(x)
# nocov end

pkg_url_bug <- function(pkg) {
  # First check that package is installed, e.g. in case of
  # runtime-only namespace created by pkgload
  if (nzchar(system.file(package = pkg))) {
    url <- utils::packageDescription(pkg)$BugReports

    # `url` can be NULL if not part of the description
    if (is_string(url) && grepl("^https://", url)) {
      return(url)
    }
  }

  NULL
}
