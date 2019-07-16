
has_colour <- function() is_installed("crayon") && crayon::has_color()
silver <- function(x) if (has_colour()) crayon::silver(x) else x
