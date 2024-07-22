#!/usr/bin/env bash
#
#Convierte archivo xlsx a csv

#set -euo pipefail

extract_socorro_position() {
    in2csv /workdir/tests/data/datos_formato_excel/IS_POSICION_TRAMPA_JUN2024.xlsx --write-sheets -
}
