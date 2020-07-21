import subprocess
from bashtest import *


def test_get_captures():
    set_tests_from_make("reports/tables/cleaned_position_traps.csv")
    file_new = "./reports/tables/cleaned_position_traps.csv"
    file_test = "./tests/data_tests/cleaned_position_traps_test.csv"
    assert_equal_file(file_new, file_test)


def set_get_captures():
    bash_command = f"make reports/tables/cleaned_position_traps.csv"
    subprocess.getoutput(bash_command)
