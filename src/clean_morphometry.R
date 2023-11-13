#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores

# Librarias necesarias
library(optparse)
library(tidyverse)
library(diferenciasMorfometriaPosicionTrampas)

option_list <- list(
  make_option(
    c("-d", "--data"),
    type = "character",
    default = NULL,
    help = "nombre del archivo de entrada",
    metavar = "character"
  ),
  make_option(
    c("-o", "--out"),
    type = "character",
    default = "hola",
    help = "nombre del archivo de salida",
    metavar = "character"
  )
)
opt_parser <- OptionParser(option_list = option_list)
options <- parse_args(opt_parser)
input_file <- options$data
morphometry <- read_csv(input_file, show_col_types = FALSE)
clean_morphometry <- morphometry %>%
  filter(Fecha > as.Date("2018-04-23")) %>%
  lower_columns_age_patron_and_status()
output_file <- options$out
write_csv(clean_morphometry, output_file)
