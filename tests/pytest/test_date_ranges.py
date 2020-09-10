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
    obtained_GECI_date = date_interval_tools.change_date_format(date_from_filename,format="GECI")
    obtained_EN_date = = date_interval_tools.change_date_format(date_from_filename,format="EN")
    np.testing.assert_array_equal(expected_EN_date, obtained_EN_date)
    np.testing.assert_array_equal(expected_GECI_date, obtained_GECI_date)

def test_date_ranges_from_name_file():
    date_range_expected = ["25/Ago/2020","26/Ago/2020","27/Ago/2020","28/Ago/2020","29/Ago/2020","30/Ago/2020","31/Ago/2020"]
    date_range_obtained = date_range_from_name_file(name_file)
    assert date_range_expected == date_range_obtained
