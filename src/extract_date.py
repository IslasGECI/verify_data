def find_date_from_filename(filename):
    return filename[19:21] + "/" + filename[21:24] + "/" + filename[24:28]

def fix_date(date):
    return (
        date.replace("ENE", "Jan").replace("FEB", "Feb").replace("MAR", "Mar").replace("ABR", "Apr").replace("MAY", "May").replace("JUN", "Jun").replace("JUL", "Jul").replace("AGO", "Aug").replace("SEP", "Sep").replace("OCT", "Oct").replace("NOV", "Nov").replace("DIC", "Dec")
    )
