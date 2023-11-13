describe("Change iso to geci format", {
  it("First example", {
    date <- "2023-11-13"
    expected <- "13/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("Second example", {
    date <- "2023-11-30"
    expected <- "30/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("Third example", {
    date <- "2023-01-30"
    expected <- "30/Ene/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("English to spanish example: April", {
    date <- "2023-04-16"
    expected <- "16/Abr/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("English to spanish example: August", {
    date <- "2012-08-24"
    expected <- "24/Ago/2012"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
})
