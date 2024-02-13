write_diff_between_captures <- function(options) {
  left <- read_csv(options$left_data, show_col_types = FALSE)
  right <- read_csv(options$right_data, show_col_types = FALSE)
  differences <- anti_join(left, right, by = c("Fecha", "ID_de_trampa"))
  write.table(differences, options$output_path, sep = ",", row.names = FALSE)
}
