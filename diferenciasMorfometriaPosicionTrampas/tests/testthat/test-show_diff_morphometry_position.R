describe("CLI for differences in captures between morphometry and position traps ", {
  it("Write csv", {
    data_1 <- "/workdir/tests/data_tests/cleaned_morphometry_cats_test.csv"
    data_2 <- "/workdir/tests/data_tests/cleaned_position_traps_test.csv"
    output_path <- "/workdir/diferenciasMorfometriaPosicionTrampas/tests/missing_captures_in_position.csv"
    options_for_testing <- list("right_data" = data_2, "left_data" = data_1, "output_path" = output_path)
    write_diff_between_captures(options_for_testing)
  })
})
