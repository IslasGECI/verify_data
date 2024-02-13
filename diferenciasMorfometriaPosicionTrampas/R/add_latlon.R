add_latlon <- function(utm_coordinates) {
  utm_coordinates |> mutate("latitude" = 1, "longitude" = 2)
}
