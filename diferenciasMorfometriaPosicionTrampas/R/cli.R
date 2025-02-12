#' @export
write_type_of_traps <- function(options, date) {
  output_file <- options$output_path
  traps <- readr::read_csv(options$data_path, show_col_types = FALSE)
  traps |>
    count_active_traps_after_date(date) |>
    readr::write_csv(output_file)
}
