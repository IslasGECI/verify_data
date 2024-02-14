write_cleaned_morphometry <- function(options) {
  input_file <- options$data_path
  output_file <- options$output_path
  morphometry <- readr::read_csv(input_file, show_col_types = FALSE)
  morphometry |>
    dplyr::filter(Fecha > as.Date("2018-04-23")) |>
    lower_columns_age_patron_and_status() |>
    add_latlon() |>
    readr::write_csv(output_file)
}
