import subprocess
def test_distinct_position_traps():
    assert_distinct_position_traps("./tests/data/IG_POSICION_TRAMPAS_10MAY2020.xlsx")

def assert_distinct_position_traps(file_input):
    bash_command = f"./src/distinct_position_traps {file_input} > tests/data/salida.tmp"
    subprocess.getoutput(bash_command)
    output = have_same_content("./tests/data/salida.tmp")
    assert output == 0

def have_same_content(file_new):
    bash_command = f"diff {file_new} ./tests/data_tests/repeated_data_test.csv | wc --lines"
    subprocess.getoutput(bash_command)
    return int(subprocess.getoutput(bash_command))
