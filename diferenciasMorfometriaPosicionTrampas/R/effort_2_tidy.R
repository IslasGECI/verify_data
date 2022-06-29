library(tidyverse)
library(reshape2)

effort_2_tidy <- function(datos_prueba) {
  filter_table <-
    datos_prueba %>% select(c("ID", (length(datos_prueba) - 6):length(datos_prueba)))
  result <- data.frame()
  nrows <- nrow(filter_table)
  for (i in 1:nrows) {
    cats <- which(filter_table[i, ] == "X")
    if (length(cats) > 0) {
      result <- rbind(result, melt(filter_table[i, ], "ID"))
    }
  }
  if (length(result) != 0) {
    names(result) <- c("ID_de_trampa", "Fecha", "Estado_trampa")
    result[] <- lapply(result[], factor)
    return(result[, c("ID_de_trampa", "Estado_trampa", "Fecha")])
  } else {
    warning("NO HAY CAPTURAS")
    result <- data.frame(
      ID_de_trampa = "",
      Estado_trampa = "",
      Fecha = ""
    )
    return(result)
  }
}
