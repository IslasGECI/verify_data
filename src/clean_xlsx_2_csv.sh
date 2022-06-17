#!/usr/bin/env bash
#
#Convierte archivo xlsx a csv

set -euo pipefail

data_file=${1}
number_columns=${2}
src_path=$(dirname "${data_file}")
table_name=$(basename "${data_file}" .xlsx)
in2csv --no-header-row --blanks ${data_file} | tail --lines=+2 > ${src_path}/${table_name}.tmp
csvcut -c 1-${number_columns} -x ${src_path}/${table_name}.tmp > ${src_path}/${table_name}.csv