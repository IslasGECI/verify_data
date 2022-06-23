#!/usr/bin/env bash
#
#Convierte archivo xlsx a csv

set -euo pipefail



xlsx_2_csv(){
    data_file=${1}
    number_columns=${2}
    local src_path=$(dirname "${data_file}")
    table_name=$(basename "${data_file}" .xlsx)
    file_name=${src_path}/${table_name}
    in2csv --no-header-row --blanks ${data_file} | tail --lines=+2 > ${file_name}.tmp
    csvcut --columns 1-${number_columns} --delete-empty-rows ${file_name}.tmp > ${file_name}.csv
}

clean_position() {
    data_file=${1}
    number_columns=13
    xlsx_2_csv ${data_file} ${number_columns}
}

clean_morphometry() {
    data_file=${1}
    number_columns=31
    xlsx_2_csv ${data_file} ${number_columns}
}