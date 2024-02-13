add_latlon <- function(utm_coordinates) {
  lonlat <- oce::utm2lonlat(utm_coordinates$Coordenada_Este, utm_coordinates$Coordenada_Norte, zone = 11)
  utm_coordinates |> mutate("latitude" = lonlat$latitude, "longitude" = 2)
}
