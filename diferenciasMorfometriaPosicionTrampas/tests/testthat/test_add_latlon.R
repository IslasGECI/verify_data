utm_coordinates <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv", show_col_types = FALSE)
describe("Cli for transform UTM to latlon", {
  it("convert_to_latlon()", {
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/ids_in_latlon.csv"
    options <- list("data_path" = utm_coordinates, "output_path" = output_path)
    convert_to_latlon(options)
  })
})
describe("Add latitude and longitude column", {
  it("Add latitude and longitude column", {
    obtained <- add_latlon(utm_coordinates)
    added_columns <- c("latitude", "longitude")
    expect_true(all(added_columns %in% colnames(obtained)))
    expected_latitude <- 29.038756
    expected_longitude <- -118.268294
    expect_equal(obtained$latitude[[7]], expected_latitude, tolerance = 1e-6)
    expect_equal(obtained$longitude[[7]], expected_longitude, tolerance = 1e-6)
  })
})
