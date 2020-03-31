#!/usr/bin/env Rscript
#
# Hace el análisis exploratorio de datos de roedores 

# Librarias necesarias
library(optparse)
library(tidyverse)

option_list = list(
    make_option(
        c("-d", "--data"), 
        type="character", 
        default=NULL, 
        help="nombre del archivo de entrada", 
        metavar="character"
    ),
    make_option(
        c("-o", "--out"), 
        type="character", 
        default="hola", 
        help="nombre del archivo de salida", 
        metavar="character"
    )
); 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

input_file <- opt$data
posicion_trampas <- read_csv(input_file)
capturas_posicion_trampa <- posicion_trampas %>% filter(Estado_trampa == "X")
output_file <- opt$out
write_csv(capturas_posicion_trampa, output_file)