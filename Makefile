.PHONY: datos
# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all:

define checkDirectories
if [ ! -d $(@D) ]; then mkdir --parents $(@D); fi
endef

# Reporte de densidades de cangrejos y lagartijas en Banco Chinchorro
# II. Declaración de las variables
# ===========================================================================
# Variables a resultados

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

$(csvCleanedMorphometryCats):
	src/clean_morphometry.R 

$(csvCleanedPositionTraps):
	src/get_captures.R

# V. Reglas del resto de los phonies
# ===========================================================================
clean: $(csvCleanedMorphometryCats) $(csvCleanedPositionTraps)

datos: $(csvMorfometriaGatos) $(csvPosicionTrampas) $(csvMorfometriaGatosISO8601)
# Elimina los residuos de LaTeX
