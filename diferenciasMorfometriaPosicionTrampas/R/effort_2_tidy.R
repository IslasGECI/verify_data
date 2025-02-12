#' @export
effort_2_tidy <- function(datos_prueba) {
  filter_table <-
    datos_prueba %>% dplyr::select(c("ID", (length(datos_prueba) - 6):length(datos_prueba)))
  result <- data.frame()
  nrows <- nrow(filter_table)
  for (i in 1:nrows) {
    result <- rbind(result, reshape2::melt(filter_table[i, ], "ID"))
  }
  names(result) <- c("ID_de_trampa", "Fecha", "Estado_trampa")
  result[] <- lapply(result[], factor)
  tidy <- result[, c("ID_de_trampa", "Estado_trampa", "Fecha")]
  rows_with_captures <- dplyr::filter(tidy, Estado_trampa == "X")
  if (nrow(rows_with_captures) == 0) {
    message("NO HAY CAPTURAS")
  }
  return(tidy)
}
