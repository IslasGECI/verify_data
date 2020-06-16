import subprocess
from bashtest import *
def test_clean_morphometry():
    set_tests_from_make("reports/tables/cleaned_morphometry_cats.csv")
    file_new = "./reports/tables/cleaned_morphometry_cats.csv"
    file_test = "./tests/data_tests/cleaned_morphometry_cats_test.csv"
    assert_equal_file(file_new, file_test)
