change_date_iso_to_geci_format <- function(date) {
  geci_format_date <- format(lubridate::ymd(date), "%d/%b/%Y")
  return(geci_format_date)
}
