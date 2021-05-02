:: Simple Batch script to assemble HelloWindows.asm to an exe
:: This assumes you have both nasm and gcc installed and set in your PATH variable
@ECHO off
cd ../BuildTools
call win32.bat HelloWorld HelloWindows