# RISC-V 32-bit barebones (RV32I)

## Introduction

This project is based on the RISC-V barebones tutorial by [osdev](https://wiki.osdev.org/RISC-V_Bare_Bones).

It required some minor modifications on the entry.S file, such as changing the 64-bit instruction SD to SW. Furthermore, some adjusments were made to the linker script (for example adding STARTUP to simplify compilation). The Makefile was produced by me.

## Files & Folders

The folder contains the following files / folders:

- **kernel.c**  : basic UART interface that is loaded after the entry point.
- **entry.S**   : entry point in RV32I assembly.
- **linker.ld** : linker script.
- **Makefile**  : Makefile required for the project.

## QEMU simulation

In order to simulate in a QEMU RISC-V 32-bit virtual machine the next command can be used:

```
qemu-system-riscv32 -machine virt -bios none -kernel kernel.elf -serial mon:stdio
```

## Further Information

The compilation commands used in the linked tutorials are not usable for this project. This are the modifications:

- *-lgcc* was removed as it produced errors in the linking process.
- *entry.o* was removed because STARTUP(entry.o) was added to the linker script.

The RISC-V toolchain was downloaded from the AdaCore GNATSTUDIO [website](https://www.adacore.com/download). However, there are also toolchains (without additional packages) in [mirrors](https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/10.1.0/) provided by osdev.
