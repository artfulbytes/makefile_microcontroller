###########################################################
# Toolchain
###########################################################
CC = $(MSPGCC_BIN_DIR)/msp430-elf-gcc
RM = rm
DEBUG = LD_LIBRARY_PATH=$(MSP_DEBUG_DRIVERS_DIR) $(MSP_DEBUG_BIN_DIR)/mspdebug

###########################################################
# Directories
###########################################################
MSPGCC_ROOT_DIR = /home/artfulbytes/ti/ccs910/ccs/tools/compiler/msp430-gcc-8.2.0.52_linux64
MSPGCC_BIN_DIR = $(MSPGCC_ROOT_DIR)/bin
MSP_DEBUG_BIN_DIR = /home/artfulbytes/ti/ccs910/ccs/ccs_base/DebugServer/bin
MSP_DEBUG_DRIVERS_DIR = /home/artfulbytes/ti/ccs910/ccs/ccs_base/DebugServer/drivers
INCLUDE_GCC_DIR = /home/artfulbytes/ti/ccs910/ccs/ccs_base/msp430/include_gcc
INCLUDE_DIRS = $(INCLUDE_GCC_DIR)
LIB_DIRS = $(INCLUDE_GCC_DIR)
ROOT = .
SRC_DIR = $(ROOT)
OBJ_DIR = $(ROOT)/obj
BIN_DIR = $(ROOT)/bin

###########################################################
# Files
###########################################################
TARGET = $(BIN_DIR)/blink
SOURCES = $(wildcard *.c)
OBJECT_NAMES = $(SOURCES:.c=.o)
OBJECTS = $(patsubst %,$(OBJ_DIR)/%,$(OBJECT_NAMES))

###########################################################
# Flags
###########################################################
MCU = msp430g2553
CFLAGS = -mmcu=$(MCU) $(addprefix -I,$(INCLUDE_DIRS))
LDFLAGS = -mmcu=$(MCU) $(addprefix -L,$(LIB_DIRS))

###########################################################
# Build
###########################################################
$(TARGET): $(OBJECTS)
	@echo "Linking $^"
	@mkdir -p $(dir $@)
	$(CC) $(LDFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: %.c
	@echo "Compiling $^"
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $^

###########################################################
# Phony targets
###########################################################
.PHONY: all clean flash

all: $(TARGET)

clean:
	$(RM) $(TARGET) $(OBJECTS)

flash: $(TARGET)
	$(DEBUG) tilib "erase" "load $(TARGET)"
