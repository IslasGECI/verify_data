describe("Change iso to geci format", {
  it("First example", {
    date <- "2023-11-13"
    expected <- "13/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
  it("First example", {
    date <- "2023-11-30"
    expected <- "30/Nov/2023"
    obtained <- change_date_iso_to_geci_format(date)
    expect_equal(obtained, expected)
  })
})
