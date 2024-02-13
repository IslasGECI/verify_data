#' @export
write_diff_captures_between <- function(options) {
  left <- readr::read_csv(options$left_data, show_col_types = FALSE)
  right <- readr::read_csv(options$right_data, show_col_types = FALSE)
  differences <- dplyr::anti_join(left, right, by = c("Fecha", "ID_de_trampa"))
  write.table(differences, options$output_path, sep = ",", row.names = FALSE)
}
