import subprocess


def test_xlsx_2_csv():
    assert_xlsx_2_csv("./tests/data/IG_POSICION_TRAMPAS_10MAY2020.xlsx")


def assert_xlsx_2_csv(file_input):
    bash_command = f"./tests/data/{file_input}"
    subprocess.getoutput(bash_command)
    is_missing = check_if_file_is_missing("IG_POSICION_TRAMPAS_10MAY2020.csv")
    assert is_missing == 0


def check_if_file_is_missing(file_new):
    bash_command = f"test -f tests/data/{file_new} && echo $?"
    subprocess.getoutput(bash_command)
    print(subprocess.getoutput(bash_command))
    return int(subprocess.getoutput(bash_command))
