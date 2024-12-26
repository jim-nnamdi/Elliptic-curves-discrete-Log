section .text
    global point_add 
    extern mod_add
    extern mod_inv

.point_add:
    ; solving for the slope of the curve
    ; m = ( y2 - y1) / (x2 - x1)
    ; rdi = x2 - x1 & rsi = y2 - y1 

    mov r8, rsi         ; r8 = y2
    sub r8, rdi         ; r8 = y2 - y1
    call mod_add        ; (y2 - y1) % p

    mov r9, rsi         ; r9 = x2
    sub r9, rdi         ; r9 = x2 - x1
    call mod_inv        ; (x2 - x1)^-1 % p

    mov r10, r8         
    mul r9
    call mod_add 
    mov r10, rax

    ; x_3 = m^2 - x1 - x2
    mov r11, rax        ; rax = m
    mul r11             ; rax = m * m
    sub rax, rdi        ; rax = m^2 - x1
    sub rax, rsi        ; rax = m^2 - x1 -x2
    call mod_add        ; (rax) mod p  

    ; y_3 = m * (x1 - x3) - y1
    mov r12, rdi 
    sub r12, rax
    mul r10
    sub rax, rsi
    call mod_add 
    ret 



