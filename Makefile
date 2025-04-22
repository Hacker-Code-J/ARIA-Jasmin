###############################################################################
# Makefile for building ARIA library artifacts
# Source files located in src/arialib
# Targets:
#   build   - Preprocess .jazz/.jinc files and assemble .japp into .s
#   rebuild - Clean then build (fresh)
#   clean   - Remove entire build directory
###############################################################################

# Directories
SRC_DIR    := src/arialib
BUILD_DIR  := build/arialib

# Automatically find source files
JAZZ_SRCS  := $(wildcard $(SRC_DIR)/*.jazz)
JINC_SRCS  := $(wildcard $(SRC_DIR)/*.jinc)

# Corresponding generated files
JAPP       := $(patsubst $(SRC_DIR)/%.jazz,$(BUILD_DIR)/%.japp,$(JAZZ_SRCS))
JINC       := $(patsubst $(SRC_DIR)/%.jinc,$(BUILD_DIR)/%.jinc,$(JINC_SRCS))
ASMS       := $(BUILD_DIR)/aria.s

# Phony targets
.PHONY: all build rebuild clean

# Default target
all: build

# Build target: preprocess & assemble
build: $(JAPP) $(JINC) $(ASMS)
	@echo "[BUILD] Completed all build steps."

# Rebuild: clean then build
rebuild: clean build

# Clean: remove build directory
clean:
	rm -rf build
	@echo "[CLEAN] Removed build directory."

# Rule: preprocess .jazz -> .japp
$(BUILD_DIR)/%.japp: $(SRC_DIR)/%.jazz
	@mkdir -p $(dir $@)
	@echo "[PREPROCESS] $< -> $@"
	cpp -E -nostdinc -P -DEXPORT_TEST $< | grep -v "^#" > $@

# Rule: preprocess .jinc -> filtered .jinc
$(BUILD_DIR)/%.jinc: $(SRC_DIR)/%.jinc
	@mkdir -p $(dir $@)
	@echo "[PREPROCESS] $< -> $@"
	cpp -E -nostdinc -P -DEXPORT_TEST $< | grep -v "^#" > $@

# Rule: assemble .japp -> .s
$(BUILD_DIR)/aria.s: $(BUILD_DIR)/aria.japp
	@mkdir -p $(dir $@)
	@echo "[ASSEMBLE] $< -> $@"
	jasminc $< -o $@
	@echo "[ASSEMBLE] Assembled $< into $@"
	@echo "[ASSEMBLE] Output: $@"
	@echo "[ASSEMBLE] Assembly complete."