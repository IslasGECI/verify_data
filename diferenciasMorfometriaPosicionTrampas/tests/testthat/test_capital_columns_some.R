describe("Change to lower columns: edad, patron, estado de salud y reproductivo", {
  raw_data <- readr::read_csv("/workdir/diferenciasMorfometriaPosicionTrampas/tests/data_tests/morfometria_capitalized.csv")
  obtained <- lower_columns_age_patron_and_status(raw_data)
  it("Example 1: Edad", {
    expected_age_column <- c("adulto", "juvenil", "adulto", "adulto", "adulto", "adulto", "adulto")
    expect_equal(obtained$Edad, expected_age_column)
  })
  it("Example 2: patterns, status", {
    expected_pattern_column <- c("solido", "atigrado", "atigrado", "atigrado", "atigrado", "atigrado", "solido")
    expect_equal(obtained$Patron, expected_pattern_column)
  })
  it("Example 3: health and reproductive status", {
    expected_health_column <- c(rep("muerto", 6), "vivo")
    expect_equal(obtained$Estado_de_salud, expected_health_column)

    expected_reproductive_column <- c(NA, rep("reproductivo", 6))
    expect_equal(obtained$Estado_reproductivo, expected_reproductive_column)
  })
})
