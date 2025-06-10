SRC = main.tex
TEXFILES := $(shell find . -name '*.tex')
BUILD_DIR = build
PDF = $(BUILD_DIR)/main.pdf

all: $(PDF)

$(PDF): $(TEXFILES) | $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) $(SRC)
	pdflatex -output-directory=$(BUILD_DIR) $(SRC)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.toc $(BUILD_DIR)/*.out

distclean: clean
	rm -rf $(PDF)

.PHONY: all clean distclean

