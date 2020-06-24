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
    )
)
opt_parser <- OptionParser(option_list = listaOpciones)
opciones <- parse_args(opt_parser)

input_file <- opciones$data
data <- readr::read_csv(input_file)
table <- check_columns_name(data)
if (all(table$es_correcto)){
    output_file <- "Cabecera_correcta.txt"
    write("La cabecera es correcta", output_file)
}else{
	print(table)
}
