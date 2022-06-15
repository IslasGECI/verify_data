import subprocess


def test_xlsx_2_csv():
    bash_command = (
        "./src/xlsx_2_csv tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_10MAY2020.xlsx"
    )
    subprocess.getoutput(bash_command)
    bash_command = "md5sum tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_10MAY2020.csv"
    output = subprocess.getoutput(bash_command)
    obtained_md5 = output.split(" ")[0]
    expected_md5 = "7421a0fea98ebe58d73465373992be48"
    assert obtained_md5 == expected_md5
    bash_command = (
        "./src/xlsx_2_csv tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    )
    subprocess.getoutput(bash_command)
    bash_command = "md5sum tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    output = subprocess.getoutput(bash_command)
    obtained_md5 = output.split(" ")[0]
    expected_md5 = "7cd3b0bd106d08eec93527b2bf3c9c85"
    assert obtained_md5 == expected_md5
