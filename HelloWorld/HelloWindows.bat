:: Simple Batch script to assemble HelloWindows.asm to an exe
:: This assumes you have both nasm and gcc installed and set in your PATH variable
@ECHO off
echo Building HelloWindows...
nasm -f win32 HelloWindows.asm
gcc HelloWindows.obj -o HelloWindows.exe
echo HelloWindows.exe built successfully