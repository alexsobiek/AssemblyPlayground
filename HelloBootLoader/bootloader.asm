; Hello Boot loader - Extremely simple boot loader written to print text
; Author: Alexander Sobiek, 2021 - Heavily inspired by Eugene Obrezkov
; Major credits to https://blog.ghaiklor.com/2017/10/21/how-to-implement-your-own-hello-world-boot-loader/

org 0x7C00                                      ; Load our OS into this address
bits 16                                         ; Define this program to be in 16 bit mode


start:
        cli                                     ; Disable Interupts
        mov si, msg                             ; Move our msg into SI
        mov ah, 0x0E                            ; Instruct the BIOS to print characters
.loop   lodsb                                   ; Load SI into AL and increment SI for the next character
        or  al, al                              ; Check if at end of string
        jz  halt                                ; If so, jump to halt
        int 0x10                                ; If not, call interupt to print the character
        jmp loop                                ; Continue the loop

halt:   hlt                                     ; Instruct the CPU to stop execution
msg:    db "Hello, Boot Loader!", 0xA, 0        ; Define Hello, Boot Loader! as bytes and insert a new line

; Create our boot sector
; Note: NASM gets stuck on this as it expects an instruction.
; I am working on attempting to understand what it wants here
; and what I can do to make it functional.
times 510 – ($ – $$) db 0                       ; Create 510 empty bytes
dw    0xaa55                                    ; Append bytes 55 and aa