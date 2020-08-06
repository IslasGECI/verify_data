#!/usr/bin/env Rscript
#
# Convierte datos a tabla tidy 
# Librarias necesarias

library(tidyverse)
library(optparse)
library(diferenciasMorfometriaPosicionTrampas)
library(reshape2)

# Sección de la CLI
listaOpciones = list(
    make_option(
        c("-d", "--data"),
        default=NULL,
        help="nombre del primer archivo de entrada",
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
data <- read_csv(opciones$data)
diferencias <- diferenciasMorfometriaPosicionTrampas::effort_2_tidy(data)
salida <- opciones$salida
write_csv(diferencias,salida)
cat(format_csv(diferencias))