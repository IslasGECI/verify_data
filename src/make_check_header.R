#!/usr/bin/env Rscript
#
#

source("src/check_columns_name.R")

library(tidyverse)
library(optparse)

# Sección de la CLI
listaOpciones = list(
    make_option(
        c("-d", "--data"),
        default=NULL,
        help="nombre del archivo de entrada",
        metavar="character",
        type="character"
    ),
    make_option(
        c("-s", "--salida"),
        default=NULL,
        help="nombre del archivo de salida",
        metavar="character",
        type="character"
    )
)
opt_parser <- OptionParser(option_list = listaOpciones);
opciones <- parse_args(opt_parser);

input_file <- read_csv(opciones$data)
data <- readr::read_csv(input_file)
table <- check_columns_name(data)
output_file <- opciones$salida
write.table(table, output_file)
