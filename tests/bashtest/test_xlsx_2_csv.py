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

def test_clean_position():
    # Set up:
    bash_command = "rm --force tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.csv" # TODO: Extraer a setup
    subprocess.run(["bash", "-c", bash_command]) # TODO: Extraer a setup
    # Carga la función clean_position() desde el archivo clean_xlsx_2_csv.sh
    bash_command = "source src/clean_position_morphometry.sh && clean_position tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.xlsx"
    subprocess.run(["bash", "-c", bash_command])
    # Calcula el picadillo de la salida
    bash_command = "md5sum tests/data/datos_formato_excel/IG_POSICION_TRAMPAS_12JUN2022.csv"
    output = subprocess.getoutput(bash_command)
    obtained_md5 = output.split(" ")[0]
    expected_md5 = "4fd30809660722b7bef86b3216b00d30"
    assert obtained_md5 == expected_md5

def test_clean_morphometry():
    # Set up:
    bash_command = "rm --force tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv" # TODO: Extraer a setup
    subprocess.run(["bash", "-c", bash_command]) # TODO: Extraer a setup
    # Carga la función clean_position() desde el archivo clean_xlsx_2_csv.sh
    bash_command = "source src/clean_position_morphometry.sh && clean_morphometry tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.xlsx"
    subprocess.run(["bash", "-c", bash_command])
    # Calcula el picadillo de la salida
    bash_command = "md5sum tests/data/datos_formato_excel/IG_MORFOMETRIA_GATOS_12JUN2022.csv"
    output = subprocess.getoutput(bash_command)
    obtained_md5 = output.split(" ")[0]
    expected_md5 = "7cd3b0bd106d08eec93527b2bf3c9c85"
    assert obtained_md5 == expected_md5
