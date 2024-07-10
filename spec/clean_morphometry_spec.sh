#shellcheck shell=sh

Describe 'clean raw files'
  Include /workdir/src/clean_position_morphometry.sh
  checksum() { md5sum ${output} | cut -d " " -f1; }
  clean_output() { rm --force ${output};}
  count_columns() { csvcut -n ${output} | wc -l; }
  BeforeEach 'clean_output'
  AfterEach 'clean_output'
  It 'cut socorro morphometry'
    output="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    When call cut_socorro_morphometry ${target}
    The result of function count_columns should eq 32
  End
  It 'clean morphometry'
    output="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    expected_md5="7cd3b0bd106d08eec93527b2bf3c9c85"
    When call clean_morphometry ${target}
    The result of function checksum should eq ${expected_md5}
  End
  It 'clean position'
    output="/workdir/tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.csv"
    target="/workdir/tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.xlsx"
    expected_md5="4fd30809660722b7bef86b3216b00d30"
    When call clean_position ${target}
    The result of function checksum should eq ${expected_md5}
  End
End
