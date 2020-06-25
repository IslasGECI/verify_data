import subprocess
from bashtest import *

def test_check_columns_name():
    set_check_columns_name()
    file_new = "./reports/tables/cleaned_position_traps.csv"
    file_test = "./tests/data_tests/cleaned_position_traps_test.csv"
    assert_equal_file(file_new, file_test)

def set_check_columns_name():
    bash_command = "src/make_check_header.R --data tests/data/IG_POSICION_TRAMPAS_10MAY2020.csv"
    subprocess.getoutput(bash_command)