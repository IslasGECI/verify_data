#' @export
write_morphometry_geci_format <- function(options) {
  data_path <- options[["data_path"]]
  output_path <- options[["output_path"]]
  iso_format <- readr::read_csv(data_path)
  iso_format |>
    change_date_columns_to_geci_format() |>
    readr::write_csv(output_path)
}


change_date_columns_to_geci_format <- function(iso_dates_tibble) {
  iso_dates_tibble |>
    dplyr::mutate(Fecha = change_date_iso_to_geci_format(Fecha))
}

change_date_iso_to_geci_format <- function(date) {
  geci_format_date <- lubridate::ymd(date) |>
    format("%d/%b/%Y") |>
    .translate_months_name()
  return(geci_format_date)
}

.translate_months_name <- function(english_date) {
  english_date |>
    stringr::str_replace_all("Jan", "Ene") |>
    stringr::str_replace_all("Apr", "Abr") |>
    stringr::str_replace_all("Aug", "Ago") |>
    stringr::str_replace_all("Dec", "Dic")
}
