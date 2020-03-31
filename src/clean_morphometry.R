#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(tidyverse)

morfometria <- read_csv("data/raw/morfometria_gatos_erradicacion_isla_guadalupe_ISO8601.csv")
morfometria_limpio <- morfometria %>% filter(Fecha > as.Date("2018-04-23"))
write_csv(morfometria_limpio, "morfometria_limpio.csv")