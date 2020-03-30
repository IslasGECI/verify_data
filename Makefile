.PHONY: datos
# I. Definición del _phony_ *all* que enlista todos los objetivos principales
# ===========================================================================
all:


# Reporte de densidades de cangrejos y lagartijas en Banco Chinchorro
# II. Declaración de las variables
# ===========================================================================
# Variables a resultados

csvMorfometriaGatos = \
	data/raw/morfometria_gatos_erradicacion_isla_guadalupe.csv

csvPosicionTrampas = \
	data/raw/posicion_trampas_gatos_isla_guadalupe.csv

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

$(csvCleanedMorphometryCats):

$(csvCleanedPositionTraps):

# V. Reglas del resto de los phonies
# ===========================================================================
clean: $(csvCleanedMorphometryCats) $(csvCleanedPositionTraps)

datos: $(csvMorfometriaGatos) $(csvPosicionTrampas)
# Elimina los residuos de LaTeX
