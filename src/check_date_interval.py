#!/usr/bin/env python

from geci_cli import geci_cli
from date_interval_tools import check_date_interval

path = geci_cli()
file_path = path.input[0][0]
filename = path.input[1][0]
check_date_interval(file_path, filename)
