def find_date_from_filename(filename):
    return filename[19:21] + "/" + filename[21:24] + "/" + filename[24:28]

def change_date_format(date, format="GECI"):
    if format == "GECI":
        date = date.replace("Jan", "Ene").replace("Feb", "Feb").replace("Mar", "Mar").replace("Apr", "Abr").replace("May", "May").replace("Jun", "Jun").replace("Jul", "Jul").replace("Aug", "Ago").replace("Sep", "Sep").replace("Oct", "Oct").replace("Nov", "Nov").replace("Dec", "Dic")
    elif format == "ingles":
        date = date.replace("ENE", "Jan").replace("FEB", "Feb").replace("MAR", "Mar").replace("ABR", "Apr").replace("MAY", "May").replace("JUN", "Jun").replace("JUL", "Jul").replace("AGO", "Aug").replace("SEP", "Sep").replace("OCT", "Oct").replace("NOV", "Nov").replace("DIC", "Dec")
    return date
