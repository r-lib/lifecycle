test_that("lifecycle_linter respects namespace qualifiers", {
  skip_if_not_installed("lintr", "3.1.0")
  skip_if_not_installed("vctrs")
  skip_if_not_installed("xml2")
  skip_if_not_installed("testthat", "3.1.7")

  local_mocked_bindings(
    pkg_lifecycle_statuses = function(package, which) {
      data.frame(
        package = package,
        fun = "extract",
        lifecycle = if (package == "first") "superseded" else "deprecated"
      )
    }
  )

  text <- paste(
    "extract(x)",
    "first::extract(x)",
    "second:::extract(x)",
    "(foreign:: # comment",
    "  extract(x))",
    "lapply(x, extract)",
    'lapply(x, "second"::extract)',
    "lapply(x, foreign::: # comment",
    "  extract)",
    sep = "\n"
  )

  first <- "`first::extract` is superseded"
  second <- "`second::extract` is deprecated"
  for (symbols in c(FALSE, TRUE)) {
    lints <- lintr::lint(
      text = text,
      linters = lifecycle_linter(
        c("first", "second"),
        symbol_is_undesirable = symbols
      ),
      cache = FALSE
    )
    lines <- if (symbols) c(1L, 2L, 3L, 6L, 7L) else c(1L, 2L, 3L)
    columns <- if (symbols) c(1L, 8L, 10L, 11L, 21L) else c(1L, 8L, 10L)
    messages <- if (symbols) {
      c(first, first, second, first, second)
    } else {
      c(first, first, second)
    }

    expect_equal(vapply(lints, `[[`, integer(1), "line_number"), lines)
    expect_equal(vapply(lints, `[[`, integer(1), "column_number"), columns)
    expect_equal(vapply(lints, `[[`, character(1), "message"), messages)
  }
})

test_that("lifecycle_linter accepts an empty list of statuses", {
  skip_if_not_installed("lintr", "3.1.0")
  skip_if_not_installed("vctrs")
  skip_if_not_installed("xml2")

  lints <- lintr::lint(
    text = "pkg::extract(x)",
    linters = lifecycle_linter(packages = character()),
    cache = FALSE
  )
  expect_length(lints, 0L)
})
