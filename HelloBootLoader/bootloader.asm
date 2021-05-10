; Hello Boot loader - Extremely simple boot loader written to print text
; Author: Alexander Sobiek, 2021 - Heavily inspired by Eugene Obrezkov
; Major credits to https://blog.ghaiklor.com/2017/10/21/how-to-implement-your-own-hello-world-boot-loader/
; and http://kernelx.weebly.com/writing-a-bootsector.html

org 0x7C00                                  ; Load our boot loader into this address
bits 16                                     ; Define this program to be in 16 bit mode

start:
    msg db "Hello, Boot Loader!", 0xA, 0    ; Define Hello, Boot Loader! as bytes and insert a new line
    mov si, msg                             ; Move our text into SI
    mov ah, 0x0e                            ; Tell video interupt we're going to write chars from AL in tty mode
    call print                              ; Call print to print msg
    jmp bootsector                          ; Jump to the bootsector

print:                                      ; Printing Function
    lodsb                                   ; Load SI into AL and increment SI to loop through each character
    or  al, al                              ; Check if at end of string
    jz  done                                ; If so, return
    int 0x10                                ; If not, call video interrupt to print character
    jmp print                               ; Go back to print the next character

done:
    ret                                     ; return

bootsector:
    cli                                     ; Disable interrupts, prevents halting
    times 510 - ($-$$) db 0                 ; Create 510 empty bytes
    dw 0xAA55                               ; Append bytes 55 and AA (boot signature)
    hlt                                     ; halt

; Anatomy of the Boot Sector (512 bytes, 510 empty and 0xAA55 as the last two)
; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
; 00 00 00 00 00 00 00 00 00 00 00 00 00 00 55 aa