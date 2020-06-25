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

csvIgPosicionTrampas10May2020 = \
	tests/data/IG_POSICION_TRAMPAS_10MAY2020.csv

csvRepeatedDataTest = \
	tests/data/repeated_data_test.csv

csv_PosicionTrampasGatosDatapackage = \
	data/validacion_datapackage/processed/posicion_trampas_gatos_ig.csv

csvMorfometriaGatos = \
	data/raw/morfometria_gatos_erradicacion_isla_guadalupe.csv

csvPosicionTrampas = \
	data/raw/posicion_trampas_gatos_isla_guadalupe.csv

csvMorfometriaGatosISO8601 = \
	data/raw/morfometria_gatos_erradicacion_isla_guadalupe_ISO8601.csv

csvCleanedPositionTraps = \
	reports/tables/cleaned_position_traps.csv

csvCleanedMorphometryCats = \
	reports/tables/cleaned_morphometry_cats.csv

csvMissingPosition = \
	reports/tables/missing_captures_in_position.csv

csvMissingMorfometry = \
	reports/tables/missing_captures_in_morfometry.csv

# III. Reglas para construir los objetivos principales
# ===========================================================================
# Objetivo para generar el README.pdf

# IV. Reglas para construir las dependencias de los objetivos principales
# ==========================================================================
$(csvMorfometriaGatos):
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	descarga_datos $(@F) $(@D)

$(csvPosicionTrampas):
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	descarga_datos $(@F) $(@D)

$(csvMorfometriaGatosISO8601): $(csvMorfometriaGatos)
	$(checkDirectories)
	cambia_formato_fecha $< > $@

$(csvCleanedMorphometryCats): $(csvMorfometriaGatosISO8601) src/clean_morphometry.R
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	src/clean_morphometry.R \
		--data=$< \
		--out=$@

$(csvCleanedPositionTraps): $(csvPosicionTrampas) src/get_captures.R
	mkdir --parents $(@D)
	src/get_captures.R \
		--data=$< \
		--out=$@

$(xlsxIgPosicionTrampas10May2020):
	if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
	descarga_datos $(@F) $(@D)

$(csvMissingPosition): $(csvCleanedMorphometryCats) $(csvCleanedPositionTraps) src/show_diff_morphometry_position.R
	src/show_diff_morphometry_position.R \
		--data_1=reports/tables/cleaned_morphometry_cats.csv \
		--data_2=reports/tables/cleaned_position_traps.csv \
		>$@
$(csv_PosicionTrampasGatosDatapackage): $(csvIgPosicionTrampas10May2020) src/change_header
	mkdir --parents $(@D)
	src/change_header $< > $@

#$(csvRepeatedDataTest): $(xlsxIgPosicionTrampas10May2020) src/distinct_position_traps
#	mkdir --parents $(@D)
#	src/distinct_position_traps $< > $@

$(csvMissingMorfometry): $(csvCleanedMorphometryCats) $(csvCleanedPositionTraps) src/show_diff_morphometry_position.R
	src/show_diff_morphometry_position.R \
		--data_1=reports/tables/cleaned_position_traps.csv \
		--data_2=reports/tables/cleaned_morphometry_cats.csv \
		>$@


# V. Reglas del resto de los phonies
# ===========================================================================
clean:
	rm --recursive --force data/validacion_datapackage/processed
	rm --recursive --force data/raw/
	rm --recursive --force reports/tables
	rm --force tests/data/*.*
	rm --recursive --force tests/bashtest/__pycache__
	rm --recursive --force *.tmp


datapackage_data: $(csv_PosicionTrampasGatosDatapackage)
tests_data: $(xlsxIgPosicionTrampas10May2020)

tests: tests_data $(csvCleanedPositionTraps)
	pytest --verbose tests/bashtest/
	R -e "testthat::test_dir('tests/testthat/', report = 'summary', stop_on_failure = TRUE)"
