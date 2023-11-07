lower_columns_age_patron_and_status <- function(raw_data) {
  cleaned_data <- raw_data |>
    mutate(Edad = stringr::str_to_lower(Edad)) |>
    mutate(Patron = stringr::str_to_lower(Patron))
  return(cleaned_data)
}
