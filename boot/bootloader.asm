; bootloader.asm
[org 0x7c00]         ; The memory location where the BIOS loads the bootloader
start:
    mov ah, 0x0e      ; BIOS interrupt to print characters to the screen
    mov si, msg       ; Point SI to the message
print_char:
    lodsb             ; Load byte at [SI] into AL, increment SI
    cmp al, 0         ; Check for null terminator
    je done           ; If null, end
    int 0x10          ; Call BIOS to print character
    jmp print_char    ; Repeat for the next character
done:
    hlt               ; Halt the CPU
msg db 'Hello, to Ubaid bootloader', 0 ; Message to display, null-terminated

times 510-($-$$) db 0  ; Fill the rest of the 512 bytes with 0
dw 0xAA55             ; Boot signature (mandatory for bootloaders)
