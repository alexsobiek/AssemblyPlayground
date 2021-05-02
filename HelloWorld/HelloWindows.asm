; Hello World for Windows
; Author: Alexander Sobiek, 2021
; Simple win32 executable that outputs "Hello Windows!" to the command line
; Written as part of the AssemblyPlayground repository on GitHub

    global _main        ; Define main
    extern _printf      ; Use printf()

    segment .data
    message: db "Hello Windows!", 0xA, 0    ; Defines "Hello World" as bytes

    ; Note on 0xA and 0
    ; 0xA  hex for a new line
    ; 0    defines the end of line

    section .text
_main:              ; Write our assembly for main
    push message    ; Push our message to the stack
    call _printf    ; Call printf for our message
    add esp, 4      ; Clear the stack
    ret             ; Return