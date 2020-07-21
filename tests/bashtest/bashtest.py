import subprocess


def assert_equal_file(file_new, file_test):
    bash_command = f"diff {file_new} {file_test} | wc --lines"
    output = int(subprocess.getoutput(bash_command))
    assert output == 0


def set_tests_from_make(target):
    bash_command = f"make {target}"
    subprocess.getoutput(bash_command)
