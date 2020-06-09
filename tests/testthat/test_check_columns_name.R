source("../../src/check_columns_name.R")
archivo_salida <- '../data_tests/column_name_data_test.csv'
salida_test <- readr::read_csv(archivo_salida)
archivo_prueba <- '../data_tests/esfuerzo_data_tests.csv'
datos_prueba <- readr::read_csv(archivo_prueba)
test_that("Detecte los nombres de las columnas que están incorrectas", {
    expect_equal(check_columns_name(datos_prueba), salida_test)
})