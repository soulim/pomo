SRC_DIR = ./src
DST_DIR = ./dist

$(PUB_DIR):
	mkdir -p $@

PARCEL = ./node_modules/.bin/parcel

$(PARCEL):
	npm install --save-dev parcel

.PHONY: all
all: | $(PUB_DIR) $(PARCEL)
	$(PARCEL) build --dist-dir=$(DST_DIR) \
	                --detailed-report

.PHONY: preview
preview: | $(PUB_DIR) $(PARCEL)
	$(PARCEL) serve --dist-dir=$(DST_DIR) \
	                --detailed-report

.DEFAULT_GOAL := all
