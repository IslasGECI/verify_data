import numpy as np
import date_interval_tools
import pytest

name_file = "IG_POSICION_TRAMPAS_31AGO2020.xlsx"


def test_date_from_filename():
    expected_date = "31/AGO/2020"
    obtained_date = date_interval_tools.date_from_filename(name_file)
    np.testing.assert_array_equal(expected_date, obtained_date)


MONTHS_SENTENCE_EN = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
]


MONTHS_SENTENCE_ES = [
    "Ene",
    "Feb",
    "Mar",
    "Abr",
    "May",
    "Jun",
    "Jul",
    "Ago",
    "Sep",
    "Oct",
    "Nov",
    "Dic",
]


MONTHS_CAPITAL_ES = [
    "ENE",
    "FEB",
    "MAR",
    "ABR",
    "MAY",
    "JUN",
    "JUL",
    "AGO",
    "SEP",
    "OCT",
    "NOV",
    "DIC",
]

MONTHS = zip(MONTHS_SENTENCE_EN, MONTHS_CAPITAL_ES, MONTHS_SENTENCE_ES)

param_change_date_format = [month for month in MONTHS]


@pytest.mark.parametrize(
    "months_sentence_en, months_capital_es, months_sentence_es", param_change_date_format
)
def test_change_date_format(months_sentence_en, months_capital_es, months_sentence_es):
    name_file = f"IG_POSICION_TRAMPAS_31{months_capital_es}2020.xlsx"
    expected_EN_date2 = f"31/{months_sentence_en}/2020"
    date_from_filename = date_interval_tools.date_from_filename(name_file)
    obtained_EN_date = date_interval_tools.change_date_format(date_from_filename, format="EN")
    np.testing.assert_array_equal(expected_EN_date2, obtained_EN_date)

    expected_GECI_date2 = f"31/{months_sentence_es}/2020"
    obtained_GECI_date = date_interval_tools.change_date_format(obtained_EN_date)
    np.testing.assert_array_equal(expected_GECI_date2, obtained_GECI_date)


def test_expected_date_interval():
    date_in_filename = "31/Aug/2020"
    expected_EN_date_interval = [
        "25/Aug/2020",
        "26/Aug/2020",
        "27/Aug/2020",
        "28/Aug/2020",
        "29/Aug/2020",
        "30/Aug/2020",
        "31/Aug/2020",
    ]
    obtained_EN_date_interval = date_interval_tools.expected_date_interval(date_in_filename)
    np.testing.assert_array_equal(expected_EN_date_interval, obtained_EN_date_interval)


def test_change_date_array_format():
    expected_GECI_date_interval = [
        "25/Ago/2020",
        "26/Ago/2020",
        "27/Ago/2020",
        "28/Ago/2020",
        "29/Ago/2020",
        "30/Ago/2020",
        "31/Ago/2020",
    ]
    EN_date_interval = [
        "25/Aug/2020",
        "26/Aug/2020",
        "27/Aug/2020",
        "28/Aug/2020",
        "29/Aug/2020",
        "30/Aug/2020",
        "31/Aug/2020",
    ]
    obtained_GECI_date_interval = date_interval_tools.change_date_array_format(EN_date_interval)
    np.testing.assert_array_equal(obtained_GECI_date_interval, expected_GECI_date_interval)


def test_obtained_date_interval():
    file_path = "tests/data/raw/"
    filename = "IG_POSICION_TRAMPAS_10MAY2020_correcto"
    expected_date_interval = [
        "04/May/2020",
        "05/May/2020",
        "06/May/2020",
        "07/May/2020",
        "08/May/2020",
        "09/May/2020",
        "10/May/2020",
    ]
    obtained_date_interval = date_interval_tools.obtained_date_interval(file_path, filename)
    np.testing.assert_array_equal(obtained_date_interval, expected_date_interval)


def test_check_date_interval(capsys):
    name_file = "IG_POSICION_TRAMPAS_10MAY2020_correcto"
    file_path = "tests/data/raw"
    date_interval_tools.check_date_interval(file_path, name_file)
    obtained = capsys.readouterr().out
    expected = "Las fechas son correctas\n"
    assert obtained == expected
    name_file = "IG_POSICION_TRAMPAS_10MAY2020_incorrecto"
    file_path = "tests/data/raw"

    expected_error = r"^El intervalo de fechas es incorrecto"
    with pytest.raises(ValueError, match=expected_error):
        date_interval_tools.check_date_interval(file_path, name_file)
