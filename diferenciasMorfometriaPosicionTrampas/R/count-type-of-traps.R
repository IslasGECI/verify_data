count_active_traps <- function(data) {
  data |>
    .add_type_column() |>
    .count_actived_traps_by_type()
}

.add_type_column <- function(data) {
  data |> mutate(type = stringr::str_sub(ID_de_trampa, 1, 2))
}

.count_actived_traps_by_type <- function(data) {
  data |>
    dplyr::filter(Estado_trampa == "A") |>
    dplyr::group_by(type) |>
    dplyr::summarise(count = n())
}
