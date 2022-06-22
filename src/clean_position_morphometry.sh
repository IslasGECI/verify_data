#!/usr/bin/env bash
#
#Convierte archivo xlsx a csv

set -euo pipefail



xlsx_2_csv(){
    src_path=$(dirname "${1}")
    table_name=$(basename "${1}" .xlsx)
    file_name=${src_path}/${table_name}
    in2csv --no-header-row --blanks ${1} | tail --lines=+2 > ${file_name}.tmp
    csvcut -c 1-${2} -x ${file_name}.tmp > ${file_name}.csv
}

clean_position() {
    number_columns=13
    xlsx_2_csv ${1} ${number_columns}
}

clean_morphometry() {
    number_columns=31
    xlsx_2_csv ${1} ${number_columns}
}