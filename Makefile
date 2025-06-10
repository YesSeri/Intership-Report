# Variables
SRC = main.tex
BUILD_DIR = build
PDF = $(BUILD_DIR)/main.pdf

# Default target
all: $(PDF)

# Build PDF using pdflatex, twice for references
$(PDF): $(SRC) | $(BUILD_DIR)
	pdflatex -output-directory=$(BUILD_DIR) $(SRC)
	pdflatex -output-directory=$(BUILD_DIR) $(SRC)

# Create build dir if missing
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Clean auxiliary files but keep PDF
clean:
	rm -rf $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.toc $(BUILD_DIR)/*.out

# Clean everything including PDF
distclean: clean
	rm -rf $(PDF)

.PHONY: all clean distclean

