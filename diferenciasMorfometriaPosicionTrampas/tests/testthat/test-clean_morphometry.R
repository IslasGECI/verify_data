describe("CLI for clean_morphometry ", {
  raw_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_gatos_isla_guadalupe_ISO_tests.csv"
  it("Write csv", {
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/cleaned_morphometry_tests.csv"
    options_for_testing <- list("data_path" = raw_path, "output_path" = output_path)
    write_cleaned_morphometry(options_for_testing)
    expect_true(testtools::exist_output_file(output_path))
    obtained <- readr::read_csv(output_path, show_col_types = FALSE)
    expected_rows <- 938 - 194
    expect_equal(nrow(obtained), expected_rows)
    testtools::if_exist_remove(output_path)
  })
  it("Write Socorro cleaned csv", {
    raw_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_gatos_isla_socorro_tests.csv"
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/cleaned_socorro_morphometry_tests.csv"
    options_for_testing <- list("data_path" = raw_path, "output_path" = output_path)
    write_cleaned_socorro_morphometry(options_for_testing)
    expect_true(testtools::exist_output_file(output_path))
    obtained <- readr::read_csv(output_path, show_col_types = FALSE)
    max_lat <- 18.8599
    min_lat <- 18.7218
    max_lon <- -110.9173
    min_lon <- -111.0536
    expect_true(all(obtained$latitude < max_lat))
    expect_true(all(obtained$latitude > min_lat))
    expect_true(all(obtained$longitude < max_lon))
    expect_true(all(obtained$longitude > min_lon))
    testtools::if_exist_remove(output_path)
  })
})
