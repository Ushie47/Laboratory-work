SECTION .data
    hello: db 'Hello, world!', 10   ; Define a string with a newline
    helloLen equ $ - hello          ; Calculate the length of the string

SECTION .text
    global _start

_start:
    mov eax, 4          ; sys_write (4)
    mov ebx, 1          ; file descriptor (stdout)
    mov ecx, hello      ; pointer to string
    mov edx, helloLen   ; length of the string
    int 0x80            ; interrupt to invoke system call

    mov eax, 1          ; sys_exit (1)
    xor ebx, ebx        ; return 0 status
    int 0x80            ; interrupt to invoke system call
