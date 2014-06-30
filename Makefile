SRC ?= src
DEST ?= lib

compile:
	coffee --compile --output $(DEST) $(SRC)


.PHONY: compile
