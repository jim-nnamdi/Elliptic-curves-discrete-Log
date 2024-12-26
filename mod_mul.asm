section .text 
    global mod_mul 

mod_mul:
    ;; (a * b) mod p ~ (a * b) % p
    mul rsi      ; compute rdi * rsi
    div rdx      ; rax = (a * b) / p , rdx = remainder
    mov rdi, rdx ; rdi = remainder (a * b) % p

    mov rax, rdi    ; return result in rax
    ret