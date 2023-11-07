#' @export
lower_columns_age_patron_and_status <- function(raw_data) {
  cleaned_data <- raw_data |>
    dplyr::mutate(Edad = stringr::str_to_lower(Edad)) |>
    dplyr::mutate(Estado_reproductivo = stringr::str_to_lower(Estado_reproductivo)) |>
    dplyr::mutate(Estado_de_salud = stringr::str_to_lower(Estado_de_salud)) |>
    dplyr::mutate(Patron = stringr::str_to_lower(Patron))
  return(cleaned_data)
}
