#shellcheck shell=sh

Describe 'Extract xlsx sheets to csv files'
  Include /workdir/src/extract_socorro_position_sheets.sh
  clean_output() { rm --force /workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024*.csv;}
  count_output_files() { ls /workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024*.csv | wc -l;}
  BeforeEach 'clean_output'
  AfterEach 'clean_output'
  It 'cut socorro position'
    input_path="/workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024.xlsx"
    When call extract_socorro_position ${input_path}
    The result of function count_output_files should eq 4
  End
End
