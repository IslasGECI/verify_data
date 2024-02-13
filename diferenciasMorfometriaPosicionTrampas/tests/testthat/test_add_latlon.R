describe("Add latitude and longitude column", {
  it("Add latitude and longitude column", {
    utm_coordinates <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv", show_col_types = FALSE)
    obtained <- add_latlon(utm_coordinates)
    added_columns <- c("latitude", "longitude")
    expect_true(all(added_columns %in% colnames(obtained)))
  })
})
