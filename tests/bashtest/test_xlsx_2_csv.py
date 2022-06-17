import subprocess


def test_clean_xlsx_2_csv():
    number_columns_position = 13
    bash_command = f"./src/clean_xlsx_2_csv.sh tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.xlsx {number_columns_position}"
    subprocess.getoutput(bash_command)
    bash_command = "md5sum tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.csv"
    output = subprocess.getoutput(bash_command)
    obtained_md5 = output.split(" ")[0]
    expected_md5 = "4fd30809660722b7bef86b3216b00d30"
    assert obtained_md5 == expected_md5
