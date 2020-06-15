#!/usr/bin/env Rscript
#
# Funcion que detecta que encabezados estan mal escritos 

library(tidyverse)
library(reshape2)

check_columns_name <- function(data){
table <- vector()
for(i in 1:11){
table[i] <- str_detect(names(data)[i], 
			"^(0[1-9]|[1-2][0-9]|3[0-1])/(Ene|Feb|Mar|Abr|May|Jun|Jul|Ago|Sep|Oct|Nov|Dic)/(20[0-9]{2})|(ID)|(Coor-A)|(Coor-Y)|(Nombre del responsable)$")
}
table <- cbind(melt(names(data)),melt(table))
names(table) <- c("columna", "es_correcto")
return(table)
}
