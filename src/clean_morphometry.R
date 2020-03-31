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
morfometria <- read_csv(input_file)
morfometria_limpio <- morfometria %>% filter(Fecha > as.Date("2018-04-23"))
output_file <- opt$out
write_csv(morfometria_limpio, output_file)