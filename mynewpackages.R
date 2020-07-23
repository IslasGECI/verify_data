#!/usr/bin/env Rscript
#
# 

library('devtools')
library('roxygen2')

package.skeleton("diferenciasMorfometriaPosicionTrampas")

my_rpackages <- as.package("diferenciasMorfometriaPosicionTrampas")
load_all(my_rpackages)
document(my_rpackages)