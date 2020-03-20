#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(tidyverse)

posicion_trampas <- read_csv("data/raw/posicion_trampas_gatos_isla_guadalupe.csv")
capturas_posicion_trampa <- posicion_trampas %>% filter(Estado_trampa == "X")
write_csv(capturas_posicion_trampa, "capturas_posicion.csv")