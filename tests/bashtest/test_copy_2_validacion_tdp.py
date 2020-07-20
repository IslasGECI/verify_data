import subprocess
def test_copy_2_validacion_tdp():
    assert_copy_2_validacion_tdp("./tests/data/IG_POSICION_TRAMPAS_10MAY2020.csv")

def assert_copy_2_validacion_tdp(file_input):
    bash_command = f"./src/copy_2_validacion_tdp {file_input}"
    subprocess.getoutput(bash_command)
    output = check_if_file_exists("IG_POSICION_TRAMPAS_10MAY2020.csv")
    assert output == 0

def check_if_file_exists(file_new):
    bash_command = f"test -f data/validacion_datapackage/{file_new} && echo $?"
    subprocess.getoutput(bash_command)
    print(subprocess.getoutput(bash_command))
    return int(subprocess.getoutput(bash_command))