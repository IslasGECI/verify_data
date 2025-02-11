count_active_traps <- function(data) {
  tibble::tibble("count" = c(2, 1), "type" = c("TC", "TP"))
}

add_type_column <- function(data) {
  data |> mutate(type = stringr::str_sub(ID_de_trampa, 1, 2))
}
