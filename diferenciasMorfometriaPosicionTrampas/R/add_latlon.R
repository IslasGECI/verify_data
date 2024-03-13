#' @export
convert_to_latlon <- function(options) {
  utm_data <- readr::read_csv(options[["data_path"]], show_col_types = FALSE)
  readr::write_csv(utm_data, options[["output_path"]])
}


add_latlon <- function(utm_coordinates) {
  lonlat <- oce::utm2lonlat(utm_coordinates$Coordenada_Este, utm_coordinates$Coordenada_Norte, zone = 11)
  utm_coordinates |> dplyr::mutate("latitude" = lonlat$latitude, "longitude" = lonlat$longitude)
}
