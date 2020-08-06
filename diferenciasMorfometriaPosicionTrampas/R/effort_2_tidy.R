#!/usr/bin/env Rscript
#
# 
library(tidyverse)
library(reshape2)

effort_2_tidy <- function(datos_prueba){
filter_table <- datos_prueba %>% select(c("ID", (length(datos_prueba)-6):length(datos_prueba)))
result <- data.frame()
ncolumns <- length(filter_table)
for (i in 2:ncolumns){
  cats <- which(filter_table[i,] == "X")
  if (length(cats) == 1){
    result <- rbind(result,melt(filter_table[i,],"ID"))
  }
}
names(result) <- c("ID","Fecha","Estado_trampa")
result[] <- lapply(result[] , factor) 
if (length(result)!= 0){
return(result[,c("ID","Estado_trampa","Fecha")]
)
}else{
  return("no hay capturas")
}
}

