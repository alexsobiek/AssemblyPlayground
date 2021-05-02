:: Simple Batch script to assemble for win32
:: This assumes you have both nasm and gcc installed and set in your PATH variable
@echo off
cd ../%1
echo Building %2...
echo Assembling...
nasm -f win32 %2.asm
call :CheckStatus %2 "NASM"
echo Compiling...
gcc %2.obj -o %2.exe
call :CheckStatus %2 "GCC"

:CheckStatus
    if ERRORLEVEL 1 (
        echo Failed to build %~1.exe while running %~2
        goto :CleanExit
    )
    if "%~2" == "GCC" (
        echo %~1.exe built successfully!
    )

:CleanExit
    exit /b 0