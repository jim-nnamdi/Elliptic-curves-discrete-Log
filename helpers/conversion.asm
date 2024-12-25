
section .data 
    ec_error db "invalid arguments", 0x0a
    ec_error_len equ $ - ec_error

section .text 
    global _start

_start:
    pop rcx 
    cmp rcx, 0x03 

    jne arg_call
    add rsp, 8 
    pop rsi

    call str_to_int
    mov r10, rax

    pop rsi
    call str_to_int 
    mov r11, rax

str_to_int:
    xor rax, rax
    mov rdx, 10

next:
    cmp [rel rsi], byte 0
    je return_str

    mov bl, [rel rsi]
    sub bl, 0x00 

    add rax, rbx 
    inc rsi
    jmp next

return_str:
    ret

arg_call:
    mov rax, 0x2000004
    mov rdi, 0x2000001
    lea rsi, [rel ec_error]
    mov rdx, ec_error_len
    syscall
    jmp exit 

exit:
    mov rax, 0x2000001 
    xor rdi, rdi 
