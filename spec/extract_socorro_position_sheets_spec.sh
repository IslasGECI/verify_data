#shellcheck shell=sh

Describe 'Extract xlsx sheets to csv files'
  Include /workdir/src/extract_socorro_position_sheets.sh
  clean_output() { rm --force ${output};}
  BeforeEach 'clean_output'
  AfterEach 'clean_output'
  It 'cut socorro morphometry'
    output="/workdir/tests/data/datos_formato_excel/IS_MORFOMETRIA_GATOS_JUN2024.csv"
    input_path="/workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024.xlsx"
    When call extract_socorro_position ${input_path}
  End
End
