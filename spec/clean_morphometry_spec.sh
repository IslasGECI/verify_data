#shellcheck shell=sh

Describe 'clean raw files'
  source_functions() { source /workdir/src/clean_position_morphometry.sh; }
  checksum() { md5sum ${output} | cut -d " " -f1; }
  BeforeRun 'source_functions'
  It 'clean morphometry'
    output="tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    expected_md5="7cd3b0bd106d08eec93527b2bf3c9c85"
    When run clean_morphometry ${target}
    The result of function checksum should eq ${expected_md5}
  End
End
