describe("Change iso to geci format", {
  it("First example", {
    date <- "2023-11-13"
    expected <- "13/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("Second example", {
    date <- "2023-11-30"
    expected <- "30/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("English to spanish example:  January, April, August and December", {
    dates <- c("2023-01-30", "2023-04-16", "2012-08-24", "2012-12-14")
    expected <- c("30/Ene/2023", "16/Abr/2023", "24/Ago/2012", "14/Dic/2012")
    obtained <- change_date_iso_to_geci_format(dates)
    expect_equal(obtained, expected)
  })
  iso_dates <- tibble::tibble(Fecha = c("2023-01-30", "2023-04-16", "2012-08-24", "2012-12-14"), other_column = 2)
  it("Change Fecha column of a tibble", {
    expected <- tibble::tibble(Fecha = c("30/Ene/2023", "16/Abr/2023", "24/Ago/2012", "14/Dic/2012"), other_column = 2)
    obtained <- change_date_columns_to_geci_format(iso_dates)
    expect_equal(obtained, expected)
  })
})

describe("xx ", {
  it("Tests time_series_plot_wrapper", {
    input <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/cleaned_morphometry_iso_date.csv"
    output <- "/workdir/cleaned_morphometry_geci_format.csv"
    options_for_testing <- list("data_path" = input, "output_path" = output)
    write_morphometry_geci_format(options_for_testing)
    expected <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/cleaned_morphometry_geci_format.csv", show_col_types = FALSE)
    obtained <- readr::read_csv(output, show_col_types = FALSE)
    expect_equal(obtained, expected)
  })
})
