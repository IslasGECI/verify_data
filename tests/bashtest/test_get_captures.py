import subprocess
def test_get_captures():
    set_clean_morphometry()
    file_new = "./reports/tables/cleaned_position_traps.csv"
    file_test = "./tests/data_tests/cleaned_position_traps_test.csv"
    assert_equal_file(file_new, file_test)

def set_clean_morphometry():
    bash_command = f"make reports/tables/cleaned_position_traps.csv"
    subprocess.getoutput(bash_command)

def assert_equal_file(file_new, file_test):
    bash_command = f"diff {file_new} {file_test} | wc --lines"
    output = int(subprocess.getoutput(bash_command))
    assert output == 0

