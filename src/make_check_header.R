#!/usr/bin/env Rscript
#
#
source("src/check_columns_name.R")

library(tidyverse)
archivo_entrada <- "tests/data/IG_POSICION_TRAMPAS_10MAY2020.csv"
datos_prueba <- readr::read_csv(archivo_entrada)

salida <- check_columns_name(datos_prueba)
print(salida)
