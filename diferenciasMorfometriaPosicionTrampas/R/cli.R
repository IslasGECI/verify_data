#' @export
write_type_of_traps <- function(options) {
  output_file <- options$output_path
  traps <- readr::read_csv(options$data_path, show_col_types = FALSE)
  traps |>
    count_active_traps_after_date(options$initial_date) |>
    readr::write_csv(output_file)
}
