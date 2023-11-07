lower_columns_age_patron_and_status <- function(raw_data) {
  cleaned_data <- raw_data |>
    mutate(Edad = stringr::str_to_lower(Edad)) |>
    mutate(Estado_reproductivo = stringr::str_to_lower(Estado_reproductivo)) |>
    mutate(Estado_de_salud = stringr::str_to_lower(Estado_de_salud)) |>
    mutate(Patron = stringr::str_to_lower(Patron))
  return(cleaned_data)
}
