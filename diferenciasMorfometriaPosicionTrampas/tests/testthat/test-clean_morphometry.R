describe("CLI for clean_morphometry ", {
  it("Write csv", {
    raw_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_gatos_isla_guadalupe_ISO_tests.csv"
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/cleaned_morphometry_tests.csv"
    options_for_testing <- list("data_path" = raw_path, "output_path" = output_path)
    write_cleaned_morphometry(options_for_testing)
    expect_true(testtools::exist_output_file(output_path))
  })
})
