change_date_iso_to_geci_format <- function(date) {
  geci_format_date <- format(lubridate::ymd(date), "%d/%b/%Y") |>
    stringr::str_replace_all("Jan", "Ene") |>
    stringr::str_replace_all("Apr", "Abr") |>
    stringr::str_replace_all("Aug", "Ago") |>
    stringr::str_replace_all("Dec", "Dic")
  return(geci_format_date)
}

.translate_months_name <- function(english_date) {
  english_date |>
    stringr::str_replace_all("Jan", "Ene") |>
    stringr::str_replace_all("Apr", "Abr") |>
    stringr::str_replace_all("Aug", "Ago") |>
    stringr::str_replace_all("Dec", "Dic")
}
