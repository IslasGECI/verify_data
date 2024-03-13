#' @export
convert_to_latlon <- function(options) {

}


add_latlon <- function(utm_coordinates) {
  lonlat <- oce::utm2lonlat(utm_coordinates$Coordenada_Este, utm_coordinates$Coordenada_Norte, zone = 11)
  utm_coordinates |> dplyr::mutate("latitude" = lonlat$latitude, "longitude" = lonlat$longitude)
}
