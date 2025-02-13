last_active_trap <- function(data) {
  data |>
    dplyr::filter(Estado_trampa == "A") |>
    dplyr::arrange(dplyr::desc(dplyr::row_number())) |>
    dplyr::distinct(ID_de_trampa, .keep_all = TRUE)
}
