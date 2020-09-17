library(tidyverse)
library(optparse)
library(diferenciasMorfometriaPosicionTrampas)
library(reshape2)

archivo_salida <- '../data_tests/column_name_data_test.csv'
salida_test <- readr::read_csv(archivo_salida)
archivo_prueba <- '../data/IG_POSICION_TRAMPAS_10MAY2020.csv'
datos_prueba <- readr::read_csv(archivo_prueba)
obtained <- diferenciasMorfometriaPosicionTrampas::check_columns_name(datos_prueba)
nrow_obtained <- nrow(obtained)
nrow_expected <- 11
ncol_obtained <- ncol(obtained)
ncol_expected <- 2

test_that("Que la forma sea la correcta", {
    expect_equal(nrow_expected, nrow_obtained)
    expect_equal(ncol_expected, ncol_obtained)
})

test_that("Detecte los nombres de las columnas que están incorrectas", {
    expect_equal(obtained, salida_test)
})