#shellcheck shell=sh

Describe 'Extract xlsx sheets to csv files'
  Include /workdir/src/extract_socorro_position_sheets.sh
  count_output_files() { ls /workdir/tests/data/IS_POSICION_TRAMPAS_JUN2024*.csv | wc -l;}
  It 'cut socorro position'
    input_path="/workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024.xlsx"
    When call extract_socorro_position ${input_path}
    The result of function count_output_files should eq 4
  End
End
