.PHONY: build install

build:
	docker build --tag islasgeci/diferencias_morfometria_posicion_trampas .

install:
	mkdir --parents /usr/local/bin
	cp ./build/checa_datos /usr/local/bin/
	chmod +x /usr/local/bin/checa_datos
