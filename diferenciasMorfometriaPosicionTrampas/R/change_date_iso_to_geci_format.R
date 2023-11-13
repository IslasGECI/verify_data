change_date_iso_to_geci_format <- function(date) {
  geci_format_date <- format(lubridate::ymd(date), "%d/%b/%Y") |>
    stringr::str_replace_all("Jan", "Ene") |>
    stringr::str_replace_all("Apr", "Abr") |>
    stringr::str_replace_all("Aug", "Ago")
  return(geci_format_date)
}
