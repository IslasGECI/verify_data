#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(tidyverse)
library(optparse)

# Sección de la CLI
option_list = list(
  make_option(
    c("-f", "--data_1"),
    default = NULL,
    help = "nombre del primer archivo de entrada",
    metavar = "character",
    type = "character"
  ),
  make_option(
    c("-s", "--data_2"),
    default = NULL,
    help = "nombre del segundo archivo de entrada",
    metavar = "character",
    type = "character"
  )
)
opt_parser <- OptionParser(option_list = option_list)
options <- parse_args(opt_parser)
data_1 <- read_csv(options$data_1)
data_2 <- read_csv(options$data_2)
differences <- anti_join(data_1, data_2, by = c("Fecha", "ID_de_trampa"))
write.table(differences, stdout(), sep = ",", row.names = FALSE)
