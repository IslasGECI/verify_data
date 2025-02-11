count_active_traps <- function(data) {
  data |>
    add_type_column() |>
    dplyr::group_by(type) |>
    dplyr::summarise(count = n())
}

add_type_column <- function(data) {
  data |> mutate(type = stringr::str_sub(ID_de_trampa, 1, 2))
}
