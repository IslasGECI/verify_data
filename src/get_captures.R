#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores

# Librarias necesarias
library(optparse)
library(tidyverse)

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
trap_position <- read_csv(input_file)
trap_position_captures <- trap_position %>% filter(Estado_trampa == "X")
output_file <- options$out
write_csv(trap_position_captures, output_file)
