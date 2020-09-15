from date_interval_tools import *
name_file = "IG_POSICION_TRAMPAS_31AGO2020.xlsx"


def test_date_from_filename():
    expected_date = "31/AGO/2020"
    obtained_date = date_interval_tools.date_from_filename(name_file)
    np.testing.assert_array_equal(expected_date,obtained_date)

def test_change_date_format():
    expected_EN_date = "31/Aug/2020"
    expected_GECI_date = "31/Ago/2020"
    date_from_filename = date_interval_tools.date_from_filename(name_file)
    obtained_EN_date = date_interval_tools.change_date_format(date_from_filename,format="EN")
    obtained_GECI_date = date_interval_tools.change_date_format(obtained_EN_date,format="GECI")
    np.testing.assert_array_equal(expected_EN_date, obtained_EN_date)
    np.testing.assert_array_equal(expected_GECI_date, obtained_GECI_date)

def test_expected_date_interval():
    date_in_filename = "31/Aug/2020"
    expected_EN_date_interval = ["25/Aug/2020","26/Aug/2020","27/Aug/2020","28/Aug/2020","29/Aug/2020","30/Aug/2020","31/Aug/2020"]
    obtained_EN_date_interval = date_interval_tools.expected_date_interval(date_in_filename)
    np.testing.assert_array_equal(expected_EN_date_interval, obtained_EN_date_interval)

def test_change_date_array_format():
    expected_GECI_date_interval = ["25/Ago/2020","26/Ago/2020","27/Ago/2020","28/Ago/2020","29/Ago/2020","30/Ago/2020","31/Ago/2020"]
    EN_date_interval = ["25/Aug/2020","26/Aug/2020","27/Aug/2020","28/Aug/2020","29/Aug/2020","30/Aug/2020","31/Aug/2020"]
    obtained_GECI_date_interval = date_interval_tools.change_date_array_format(EN_date_interval)
    np.testing.assert_array_equal(obtained_GECI_date_interval, expected_GECI_date_interval)

