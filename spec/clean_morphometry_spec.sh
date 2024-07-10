#shellcheck shell=sh

Describe 'clean raw files'
source_functions() { source /workdir/src/clean_position_morphometry.sh; }
BeforeRun 'source_functions'
  It 'clean morphometry'
    target="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    checksum() { md5sum tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv | cut -d " " -f1; }
    expected_md5="7cd3b0bd106d08eec93527b2bf3c9c85"
    When run clean_morphometry ${target}
    The result of function checksum should eq ${expected_md5}
  End
End
