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
    testtools::delete_output_file(output_path)
  })
  it("Write Socorro cleaned csv", {
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/cleaned_socorro_morphometry_tests.csv"
    options_for_testing <- list("data_path" = raw_path, "output_path" = output_path)
    write_cleaned_socorro_morphometry(options_for_testing)
    expect_true(testtools::exist_output_file(output_path))
    testtools::delete_output_file(output_path)
  })
})
