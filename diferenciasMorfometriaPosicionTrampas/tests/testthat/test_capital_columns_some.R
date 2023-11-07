describe("Change to lower columns: edad, patron, estado de salud y reproductivo", {
  it("Example 1", {
    raw_data <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv")
    lower_columns_age_patron_and_status(raw_data)
  })
})
