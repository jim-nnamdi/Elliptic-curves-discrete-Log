section .text 
    global mod_inv

mod_inv:
    ; a^-1 mod ; 
    ; rdi = a .. rdx = p
    mov rbx, p 
    mov rcx, rdi 
    xor r8, r8      ; x val = 0
    xor r9, r9      ; y val = 1

    ; experimental algorithm please check
    ; extended euclidean algo for proper impl
.eu_loop:
    xor rdx, rdx
    div rbx ; rax = rcx/rbx .. remainder @rdx
    mov rcx, rbx 
    mov rbx, rdx


