###############################################################################
#  Jasmin Implementation of ARIA Block Cipher                                 #
###############################################################################

# tools
CC        := cpp
JASC      := jasminc

# use gcc as preprocessor
PREPROC   := $(CC) -E -nostdinc -P

# flags
CFLAGS    := -Wall
SSE_FLAG  := -msse4.1
JASCFLAGS :=

# dirs
SRC_DIR   := src
BUILD_DIR := build
TEST_DIR  := test

###############################################################################
#  Source declarations                                                        #
###############################################################################
ARIA_JAZZ := $(SRC_DIR)/arialib/aria.jazz
ARIA_JAPP := $(BUILD_DIR)/arialib/aria.japp
ARIA_S    := $(BUILD_DIR)/arialib/aria.s
ARIA_BIN  := $(BUILD_DIR)/arialib/test_aria
ARIA_TEST := $(TEST_DIR)/test_aria.c
ARIA_EC   := aria_jazz.ec

# ENC_JAZZ  := $(SRC_DIR)/example/NbariaEnc.jazz
# ENC_JAPP  := $(BUILD_DIR)/example/NbariaEnc.japp
# ENC_S     := $(BUILD_DIR)/example/NbariaEnc.s
# ENC_BIN   := $(BUILD_DIR)/example/test_NbariaEnc
# ENC_TEST  := $(TEST_DIR)/test_NbariaEnc.c

# MEM_JAZZ  := $(SRC_DIR)/example/NbariaEnc_mem.jazz
# MEM_JAPP  := $(BUILD_DIR)/example/NbariaEnc_mem.japp
# MEM_S     := $(BUILD_DIR)/example/NbariaEnc_mem.s
# MEM_BIN   := $(BUILD_DIR)/example/test_NbariaEnc_mem
# MEM_TEST  := $(TEST_DIR)/test_NbariaEnc_mem.c

###############################################################################
#  Default target                                                             #
###############################################################################
.PHONY: all
all: $(ARIA_BIN) \
#  $(ENC_BIN) $(MEM_BIN) \
	# $(ARIA_EC)

# Alias 'build' to the default 'all'
build: all

# Rebuild = clean then build
rebuild: clean all

###############################################################################
#  Pattern rules                                                              #
###############################################################################
MKDIR = @mkdir -p $(dir $@)

# .jazz �� .japp using gcc -E
$(BUILD_DIR)/%.japp: $(SRC_DIR)/%.jazz
	$(MKDIR)
	$(PREPROC) $< | grep -v "^#" > $@

# special case for aria: add EXPORT_TEST
$(ARIA_JAPP): $(ARIA_JAZZ)
	$(MKDIR)
	$(PREPROC) -DEXPORT_TEST $< | grep -v "^#" > $@

# .japp �� .s
$(BUILD_DIR)/%.s: $(BUILD_DIR)/%.japp
	$(MKDIR)
	$(JASC) $(JASCFLAGS) $< -o $@

# .japp �� EasyCrypt .ec
# $(ARIA_EC): $(ARIA_JAPP)
# 	$(JASC) $(JASCFLAGS) $< -ec aria -ec invaria -oec $@

###############################################################################
#  Link test executables                                                      #
###############################################################################
$(ARIA_BIN): $(ARIA_S) $(ARIA_TEST)
	$(CC) $(CFLAGS) $^ -o $@

# $(ENC_BIN): $(ENC_S) $(ENC_TEST)
# 	$(CC) $(CFLAGS) $(SSE_FLAG) $^ -o $@

# $(MEM_BIN): $(MEM_S) $(MEM_TEST)
# 	$(CC) $(CFLAGS) $^ -o $@

###############################################################################
#  Convenience targets                                                        #
###############################################################################
.PHONY: test clean

test: all
	@echo "Running tests..."
	@$(ARIA_BIN)
# @$(ENC_BIN)
# @$(MEM_BIN)

clean:
	@echo "Cleaning up..."
	@rm -rf $(BUILD_DIR)/*.japp $(BUILD_DIR)/*.s $(BUILD_DIR)/*.o
	@rm -rf $(BUILD_DIR) 
# $(ARIA_EC)
