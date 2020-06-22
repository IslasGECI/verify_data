import subprocess
from bashtest import *
def test_show_diff_morphometry_position():
    set_tests_from_make("./reports/tables/missing_captures_in_position.csv")
    file_new = "./reports/tables/missing_captures_in_position.csv"
    file_test = "./tests/data_tests/missing_captures_in_position_test.csv"
    assert_equal_file(file_new, file_test)
