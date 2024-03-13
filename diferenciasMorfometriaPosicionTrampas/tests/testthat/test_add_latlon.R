utm_coordinates_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv"
utm_coordinates <- readr::read_csv(utm_coordinates_path, show_col_types = FALSE)
describe("Cli for transform UTM to latlon", {
  it("convert_to_latlon()", {
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/ids_in_latlon.csv"
    options <- list("data_path" = utm_coordinates_path, "output_path" = output_path)
    testtools::delete_output_file(output_path)
    convert_to_latlon(options)
    expect_true(testtools::exist_output_file(output_path))

    obtained_data <- readr::read_csv(output_path, show_col_types = FALSE)
    added_columns <- c("Coordenada_Este", "Coordenada_Norte")
    expect_true(all(!added_columns %in% colnames(obtained_data)))
    testtools::delete_output_file(output_path)
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
