# Hello World!

## Assembling HelloWindows
*nasm and the gcc compiler are required for this example*
### Individual Commands
```shell
nasm -f win32 HelloWindows.asm
```
```shell
gcc HelloWindows.obj -o HelloWindows.exe
```

### Batch Script
```shell
HelloWindows.bat
```

## Running
Simply call the executable from the command line:
```shell
HelloWindows.exe
```
