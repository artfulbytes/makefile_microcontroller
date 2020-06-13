###########################################################
# Toolchain
###########################################################
CC = $(MSPGCC_BIN_DIR)/msp430-elf-gcc

###########################################################
# Directories
###########################################################
MSPGCC_ROOT_DIR = /home/artfulbytes/ti/ccs910/ccs/tools/compiler/msp430-gcc-8.2.0.52_linux64
MSPGCC_BIN_DIR = $(MSPGCC_ROOT_DIR)/bin
INCLUDE_GCC_DIR = /home/artfulbytes/ti/ccs910/ccs/ccs_base/msp430/include_gcc
INCLUDE_DIRS = $(INCLUDE_GCC_DIR)
LIB_DIRS = $(INCLUDE_GCC_DIR)

###########################################################
# Files
###########################################################
TARGET = blink

###########################################################
# Flags
###########################################################
MCU = msp430g2553
CFLAGS = -mmcu=$(MCU) $(addprefix -I,$(INCLUDE_DIRS))
LDFLAGS = -mmcu=$(MCU) $(addprefix -L,$(LIB_DIRS))

###########################################################
# Build
###########################################################
$(TARGET): blink.o
	$(CC) $(LDFLAGS) -o $(TARGET) blink.o

blink.o: blink.c
	$(CC) -c $(CFLAGS) -o blink.o blink.c
