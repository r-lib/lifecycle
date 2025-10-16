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
