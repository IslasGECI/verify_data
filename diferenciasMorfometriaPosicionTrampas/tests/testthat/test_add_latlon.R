describe("Add latitude and longitude column", {
  it("Add latitude and longitude column", {
    utm_coordinates <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv", show_col_types = FALSE)
    obtained <- add_latlon(utm_coordinates)
    added_columns <- c("latitude", "longitude")
    expect_true(all(added_columns %in% colnames(obtained)))
    expected_latitude <- 29.038756
    expected_longitude <- -118.268294
    expect_equal(obtained$latitude[[7]], expected_latitude, tolerance = 1e-6)
  })
})
