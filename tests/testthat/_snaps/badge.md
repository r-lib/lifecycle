# badge doesn't change unexpected

    Code
      cat(badge("deprecated"))
    Output
      \ifelse{html}{\figure{lifecycle-deprecated.svg}{options: alt='Deprecated lifecycle'}}{\strong{Deprecated}}

---

    Code
      cat(badge("experimental"))
    Output
      \ifelse{html}{\out{<a href='https://www.tidyverse.org/lifecycle/#experimental'><img src='figures/lifecycle-experimental.svg' alt='Experimental lifecycle'></a>}}{\strong{Experimental}}

---

    Code
      cat(badge("unknown"))
    Error <rlang_error>
      Unknown lifecycle stage 'unknown'

