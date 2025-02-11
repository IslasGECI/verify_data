describe("Count type of traps on certain period", {
  data <- tibble::tibble(
    "ID_de_trampa" = c("TC-01-001-NA", "TP-01-001-NA", "TC-02-002-NA"),
    "Estado_trampa" = "A",
    "Fecha" = c("31/Ene/2025", "31/Ene/2025", "31/Ene/2025"),
  )
  obtained <- count_active_traps(data)

  data_2 <- tibble::tibble(
    "ID_de_trampa" = c("TC-01-001-NA", "TP-01-001-NA", "TP-02-002-NA"),
    "Estado_trampa" = c("A", "D", "A"),
    "Fecha" = c("31/Ene/2025", "31/Ene/2025", "31/Ene/2025"),
  )
  obtained_2 <- count_active_traps(data_2)
  it("count_active_traps(): type TC", {
    expected_number_of_TC <- 2
    obtained_number_of_TC <- obtained |>
      dplyr::filter(type == "TC") |>
      pull(count)
    expect_equal(obtained_number_of_TC, expected_number_of_TC)

    expected_number_of_TC <- 1
    obtained_number_of_TC <- obtained_2 |>
      dplyr::filter(type == "TC") |>
      pull(count)
    expect_equal(obtained_number_of_TC, expected_number_of_TC)
  })
  it("count_active_traps(): type TP", {
    expected_number_of_TP <- 1
    obtained_number_of_TP <- obtained |>
      dplyr::filter(type == "TP") |>
      pull(count)
    expect_equal(obtained_number_of_TP, expected_number_of_TP)

    expected_number_of_TP <- 1
    obtained_number_of_TP <- obtained_2 |>
      dplyr::filter(type == "TP") |>
      pull(count)
    expect_equal(obtained_number_of_TP, expected_number_of_TP)
  })
})

describe("add_type_column()", {
  it("data 1", {
    data <- tibble::tibble(
      "ID_de_trampa" = c("TC-01-001-NA", "TP-01-001-NA", "TC-02-002-NA"),
      "Estado_trampa" = "A",
      "Fecha" = c("31/Ene/2025", "31/Ene/2025", "31/Ene/2025"),
    )
    obtained <- .add_type_column(data)
    expected <- tibble::tibble(
      "ID_de_trampa" = c("TC-01-001-NA", "TP-01-001-NA", "TC-02-002-NA"),
      "Estado_trampa" = "A",
      "Fecha" = c("31/Ene/2025", "31/Ene/2025", "31/Ene/2025"),
      "type" = c("TC", "TP", "TC")
    )
    expect_equal(obtained, expected)
  })
})
