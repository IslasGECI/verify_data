describe("Count type of traps on certain period", {
  data <- tibble::tibble(
    "ID_de_trampa" = c("TC-01-001-NA", "TP-01-001-NA", "TC-02-002-NA"),
    "Estado_trampa" = "A",
    "Fechaa" = c("31/Ene/2025", "31/Ene/2025", "31/Ene/2025"),
  )
  it("count_active_traps()", {
    obtained <- count_active_traps(data)
    expected_number_of_TC <- 2
    obtained_number_of_TC <- obtained |>
      dplyr::filter(type == "TC") |>
      pull(count)
    expect_equal(obtained_number_of_TC, expected_number_of_TC)
  })
})
