.PHONY: tests tests_data
# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all: tests

define checkDirectories
if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
endef

# Reporte de densidades de cangrejos y lagartijas en Banco Chinchorro
# II. Declaración de las variables
# ===========================================================================
# Variables a resultados

xlsxIgPosicionTrampas10May2020 = \
	tests/data/IG_POSICION_TRAMPAS_10MAY2020.xlsx

csvRepeatedDataTest = \
	tests/data/repeated_data_test.csv

# III. Reglas para construir los objetivos principales
# ===========================================================================
# Objetivo para generar el README.pdf

# IV. Reglas para construir las dependencias de los objetivos principales
# ==========================================================================

$(xlsxIgPosicionTrampas10May2020):
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	descarga_datos $(@F) $(@D)

#$(csvRepeatedDataTest): $(xlsxIgPosicionTrampas10May2020) src/distinct_position_traps
#	mkdir --parents $(@D)
#	src/distinct_position_traps $< > $@

# V. Reglas del resto de los phonies
# ===========================================================================
clean:
	rm --recursive --force data
	rm --recursive --force reports/tables
	rm --recursive --force tests/data
	rm --recursive --force tests/__pycache__
	rm --recursive --force *.tmp


tests_data: $(xlsxIgPosicionTrampas10May2020)

tests: tests_data
	pytest --verbose
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
