# badge doesn't change unexpected

    Code
      cat(badge("deprecated"))
    Output
      \ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}

---

    Code
      cat(badge("experimental"))
    Output
      \ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#experimental}{\figure{lifecycle-experimental.svg}{options: alt='[Experimental]'}}}{\strong{[Experimental]}}

---

    Code
      cat(badge("unknown"))
    Error <rlang_error>
      `stage` must be one of "experimental", "stable", "superseded", or "deprecated".

