count_active_traps <- function(data) {
  data |>
    .add_type_column() |>
    .count_actived_traps_by_type()
}

.add_type_column <- function(data) {
  data |> dplyr::mutate(type = stringr::str_sub(ID_de_trampa, 1, 2))
}

.count_actived_traps_by_type <- function(data) {
  data |>
    dplyr::filter(Estado_trampa == "A") |>
    dplyr::group_by(type) |>
    dplyr::summarise(count = dplyr::n())
}

filter_by_date <- function(data, cut_date) {
  cut_date_spanish <- cut_date |>
    .translate_months_name_spanish_to_english()
  data |>
    dplyr::mutate(Fecha = .translate_months_name_spanish_to_english(Fecha)) |>
    dplyr::filter(as.Date(Fecha, format = "%d/%b/%Y") > as.Date(cut_date_spanish, format = "%d/%b/%Y"))
}

.translate_months_name_spanish_to_english <- function(spanish_date) {
  spanish_date |>
    stringr::str_replace_all("Ene", "Jan") |>
    stringr::str_replace_all("Abr", "Apr") |>
    stringr::str_replace_all("Ago", "Aug") |>
    stringr::str_replace_all("Dic", "Dec")
}
