#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(tidyverse)
library(optparse)

# Sección de la CLI
listaOpciones = list(
    make_option(
        c("-f", "--data_1"),
        default=NULL,
        help="nombre del primer archivo de entrada",
        metavar="character",
        type="character"
    ),
    make_option(
        c("-s", "--data_2"),
        default=NULL,
        help="nombre del segundo archivo de entrada",
        metavar="character",
        type="character"
    )
);
opt_parser <- OptionParser(option_list = listaOpciones);
opciones <- parse_args(opt_parser);

position_file    <- opciones$data_1
morphometry_file <- opciones$data_2
morfometria <- read_csv(morphometry_file)
posicion    <- read_csv(position_file)
posicion_new <- full_join(posicion, morfometria, by = c("Fecha", "ID_de_trampa")) %>% select(1:7) %>% replace(is.na(.), 'X')
write.table(posicion_new, stdout(), sep=",", row.names = FALSE)