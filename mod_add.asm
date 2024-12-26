section .text
    global mod_add

mod_add:
    ;; set the variables for a & b
    ;; rdi = a rsi = b and rdx = p
    ;; (a + b) mod p

    add rdi, rsi    ; rdi =  a + b
    cmp rdi, rdx    ; compare rdi with modulus in rdx
    jl .done        ; if (a + b) < p skip subtraction
    sub rdi, rdx    ; if (a + b) >= p sub rdi from rdx

.done:
    mov rax, rdi    ; return result of op (a + b) % p to rax
    ret   