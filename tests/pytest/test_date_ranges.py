name_file = "IG_POSICION_TRAMPA_31AGO2020.xlsx"

def test_date_ranges_from_name_file():
    date_range_expected = ["25/Ago/2020","26/Ago/2020","27/Ago/2020","28/Ago/2020","29/Ago/2020","30/Ago/2020","31/Ago/2020"]
    date_range_obtained = date_range_from_name_file(name_file)
    assert date_range_expected == date_range_obtained
