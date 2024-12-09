%include 'in_out.asm'

SECTION .data
msg_function db "Функция: f(x) = 2x + 15", 0
msg_input db "Введите x: ", 0
msg_result db "Результат: ", 0

SECTION .bss
res RESB 80  ; Storage for the result
x RESB 80    ; Buffer for input

SECTION .text
global _start

_start:
    ; Print function description
    mov eax, msg_function
    call sprint

    ; Prompt for input
    mov eax, msg_input
    call sprint

    ; Read input into buffer x
    mov ecx, x
    mov edx, 80
    call sread

    ; Convert input to integer
    mov eax, x
    call atoi

    ; Perform calculation
    call _calcul

    ; Print result
    mov eax, msg_result
    call sprint
    mov eax, res
    call sprint
    mov eax, [res]
    call iprintLF

    call quit

_calcul:
    push eax             ; Save x on the stack
    mov ebx, 2           ; Multiply by 2
    mul ebx              ; eax = 2 * x
    add eax, 15          ; eax = 2 * x + 15
    mov [res], eax       ; Store the result in res
    pop eax              ; Restore original value of x
    ret
