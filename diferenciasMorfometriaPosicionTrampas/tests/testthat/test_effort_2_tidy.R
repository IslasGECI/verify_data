library(tidyverse)

archivo_prueba <- "../data_tests/esfuerzo_data_tests.csv"
datos_prueba <- readr::read_csv(archivo_prueba)
archivo_prueba <- "../data_tests/esfuerzo_data_tests_2.csv"
datos_prueba_2 <- readr::read_csv(archivo_prueba)
archivo_prueba <- "../data_tests/esfuerzo_data_tests_3.csv"
datos_prueba_3 <- readr::read_csv(archivo_prueba)
archivo_prueba <- "../data_tests/esfuerzo_data_tests_sin_capturas.csv"
datos_prueba_sin_capturas <- readr::read_csv(archivo_prueba)

describe("Que la función pase al formato tidy", {
  it("expected first output", {
    salida_test <- data.frame(
      ID_de_trampa = factor(rep(c("TC-20-1084", "TC-10-0980-MV"), each = 7)),
      Estado_trampa = factor(c("A", "A", "X", "A", "A", "A", "A", "X", "A", "A", "A", "A", "D", "D")),
      Fecha = factor(rep(c("4/27/2020", "4/28/2020", "4/29/2020", "4/30/2020", "5/1/2020", "5/2/2020", "5/3/2020"), 2))
    )
    obtained <- effort_2_tidy(datos_prueba)
    expect_equal(obtained, salida_test)
  })
  it("expected second output", {
    salida_test_2 <- data.frame(
      ID_de_trampa = factor(rep(c("TC-20-1084", "TC-20-1085", "TC-10-0980-MV"), each = 7)),
      Estado_trampa = factor(c("A", "A", "X", "A", "A", "A", "A", "A", "A", "X", "A", "A", "A", "A", "X", "A", "A", "A", "A", "D", "D")),
      Fecha = factor(rep(c("4/27/2020", "4/28/2020", "4/29/2020", "4/30/2020", "5/1/2020", "5/2/2020", "5/3/2020"), 3))
    )
    obtained <- effort_2_tidy(datos_prueba_2)
    expect_equal(obtained, salida_test_2)
  })
  it("expected third output", {
    salida_test_3 <- data.frame(
      ID_de_trampa = factor(rep(c("TC-20-1084", "TC-20-1085", "TC-10-0980-MV"), each = 7)),
      Estado_trampa = factor(c("A", "A", "X", "A", "A", "A", "A", "A", "A", "X", "A", "A", "X", "A", "X", "A", "A", "A", "A", "D", "D")),
      Fecha = factor(rep(c("4/27/2020", "4/28/2020", "4/29/2020", "4/30/2020", "5/1/2020", "5/2/2020", "5/3/2020"), 3))
    )
    obtained <- effort_2_tidy(datos_prueba_3)
    expect_equal(obtained, salida_test_3)
  })
  it("expected output without captures", {
    salida_test_sin_capturas <- data.frame(
      ID_de_trampa = "",
      Estado_trampa = "",
      Fecha = ""
    )
    obtained <- effort_2_tidy(datos_prueba_sin_capturas)
    expect_equal(obtained, salida_test_sin_capturas)
  })
})
