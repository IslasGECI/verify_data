describe("Filter last active traps", {
  trap_of_interest <- "TL-99-999-NA"
  expected_last_date <- "03/Feb/2025"
  data <- tibble::tibble(
    "ID_de_trampa" = c(rep(trap_of_interest, 3), "TL-77-999-NA"),
    "Estado_trampa" = c("A", "D", "A", "A"),
    "Fecha" = c("01/Feb/2025", "02/Feb/2025", expected_last_date, "01/Feb/2025")
  )
  obtained <- last_active_trap(data)
  it("last_active_trap", {
    expected_rows <- 2
    obtained_rows <- nrow(obtained)
    expect_equal(obtained_rows, expected_rows)
    obtained_last_date <- obtained |>
      dplyr::filter(ID_de_trampa == trap_of_interest) |>
      dplyr::pull(Fecha)
    expect_equal(obtained_last_date, expected_last_date)
  })
})
