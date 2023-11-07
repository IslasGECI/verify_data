describe("Change to lower columns: edad, patron, estado de salud y reproductivo", {
  it("Example 1", {
    raw_data <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv")
    obtained <- lower_columns_age_patron_and_status(raw_data)
    expected_age_column <- c("adulto", "juvenil", "adulto", "adulto", "adulto", "adulto", "adulto")
    expect_equal(obtained$Edad, expected_age_column)
  })
})
