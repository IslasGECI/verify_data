#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(tidyverse)

fechaA <- c("31-01-85", "12-12-84", "10-12-85")
fechaB <- c("31-01-85", "08-07-59", "09-10-80")
posicion <- c("defensa", "contencion", "medio_centro")
titulo <- c("fisico", "metematico", "oceanologo")

df_A <- tibble("Fecha" = fechaA, "Posicion" = posicion)
df_B <- tibble("Fecha" = fechaB, "Posicion" = titulo)

diferencias <- anti_join(df_B, df_A, by = c("Fecha"))
write.table(diferencias, stdout(), sep=",", row.names = FALSE)