describe("Test cli for write_type_of_traps", {
  it("Creates csv with type of traps", {
    data_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_test/traps_daily_status_guadalupe.csv"
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/number_of_traps_by_type.csv"
    options <- list("data_path" = data_path, "output_path" = output_path)
    testtools::if_exist_remove(output_path)
    write_type_of_traps(options)
    expect_true(testtools::exist_output_file(output_path))
  })
})
