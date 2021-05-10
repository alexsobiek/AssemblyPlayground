# Hello Boot Loader
Extremely simple bootable bootloader that can print text. 

# Assembling & Booting
#### Assembling: 
```shell
nasm bootloader.asm -f bin -o bootloader.bin
```
OR
```shell
make
```
#### Booting with QEMU:
```shell
qemu-system-i386 -fda bootloader.bin
```