#!/usr/bin/env bash
#
#Convierte archivo xlsx a csv

#set -euo pipefail

extract_socorro_position() {
    in2csv ${1} --blanks --write-sheets -
}
