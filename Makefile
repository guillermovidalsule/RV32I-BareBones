#
# Makefile for building simple RV32I barebones.
#
# Guillermo Vidal Sulé
#

CC = riscv32-elf-gcc
AS = riscv32-elf-as
LD = riscv32-elf-ld

CFLAGS  = -Wall -Wextra -c -mcmodel=medany -ffreestanding
LDFLAGS = -T linker.ld -nostdlib

SOURCES = kernel.c
OBJECTS = $(SOURCES:.c=.o) entry.o
TARGET  = kernel.elf

all: $(TARGET)

kernel.o: kernel.c
	$(CC) $(CFLAGS) kernel.c -o kernel.o

entry.o: entry.S 
	$(AS) -c entry.S -o entry.o

# kernel.o must be changed to $(OBJECTS) if linker script does not use STARTUP(entry.o). 

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) kernel.o -o $(TARGET)

.PHONY: clean

clean:
	@rm -f $(TARGET) $(OBJECTS)
