#shellcheck shell=sh

Describe 'clean raw files'
  source_functions() { source /workdir/src/clean_position_morphometry.sh; }
  checksum() { md5sum ${output} | cut -d " " -f1; }
  clean_output() { rm --force ${output};}
  BeforeRun 'source_functions'
  AfterRun 'clean_output'
  It 'clean morphometry'
    output="tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    expected_md5="7cd3b0bd106d08eec93527b2bf3c9c85"
    When run clean_morphometry ${target}
    The result of function checksum should eq ${expected_md5}
  End
  It 'clean position'
    output="/workdir/tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.xlsx"
    expected_md5="4fd30809660722b7bef86b3216b00d30"
    When run clean_position ${target}
    The result of function checksum should eq ${expected_md5}
  End
End
