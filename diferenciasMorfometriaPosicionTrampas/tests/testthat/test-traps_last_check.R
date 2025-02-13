describe("Filter last active traps", {
  data <- tibble::tibble(
    "ID_de_trampa" = c("TL-99-999-NA", "TL-99-999-NA", "TL-99-999-NA", "TL-77-999-NA"),
    "Estado_trampa" = c("A", "D", "A", "A"),
    "Fecha" = c("01/Feb/2025", "02/Feb/2025", "03/Feb/2025", "01/Feb/2025")
  )
  obtained <- last_active_trap(data)
  it("last_active_trap", {
    expected_rows <- 2
    obtained_rows <- nrow(obtained)
    expect_equal(obtained_rows, expected_rows)
  })
})
