#' @keywords internal
#' @import rlang
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL


# For R 3.2 support
strrep <- function(x, times) {
  x <- as.character(x)
  if (length(x) == 0L) {
    return(x)
  }

  unlist(.mapply(function(x, times) {
    if (is.na(x) || is.na(times)) {
      return(NA_character_)
    }
    if (times <= 0L) {
      return("")
    }
    paste0(replicate(times, x), collapse = "")
  }, list(x = x, times = times), MoreArgs = list()), use.names = FALSE)
}
