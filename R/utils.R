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
has_crayon <- function() {
  is_installed("crayon") && crayon::has_color()
}
red       <- function(x) if (has_crayon()) crayon::red(x)       else x
blue      <- function(x) if (has_crayon()) crayon::blue(x)      else x
green     <- function(x) if (has_crayon()) crayon::green(x)     else x
yellow    <- function(x) if (has_crayon()) crayon::yellow(x)    else x
magenta   <- function(x) if (has_crayon()) crayon::magenta(x)   else x
cyan      <- function(x) if (has_crayon()) crayon::cyan(x)      else x
blurred   <- function(x) if (has_crayon()) crayon::blurred(x)   else x
silver    <- function(x) if (has_crayon()) crayon::silver(x)    else x
bold      <- function(x) if (has_crayon()) crayon::bold(x)      else x
italic    <- function(x) if (has_crayon()) crayon::italic(x)    else x
underline <- function(x) if (has_crayon()) crayon::underline(x) else x
# nocov end

lifecycle_abort <- function(x, env = parent.frame()) {
  x <- paste0("Internal error in lifecycle: ", glue::trim(x))
  abort(glue::glue(x, .envir = env))
}

`%<~~%` <- function(lhs, rhs, env = caller_env()) {
  env_bind_lazy(env, !!substitute(lhs) := !!substitute(rhs), .eval_env = env)
}
