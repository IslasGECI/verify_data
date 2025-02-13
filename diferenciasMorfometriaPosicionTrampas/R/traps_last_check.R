last_active_trap <- function(data) {
  data |>
    dplyr::filter(Estado_trampa == "A")
}
