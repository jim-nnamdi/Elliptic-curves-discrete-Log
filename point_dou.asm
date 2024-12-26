section .text 
    global point_doubling 
    extern mod_add 
    extern mod_mul

point_doubling:
    ; solving for the slope of the curve
    ; m = ( y2 - y1) / (x2 - x1)
    ; rdi = x2 - x1 & rsi = y2 - y1 

    mov r8, rsi         ; r8 = y2
    sub r8, rdi         ; r8 = y2 - y1
    call mod_add        ; (y2 - y1) % p

    mov r9, rsi         ; r9 = x2
    sub r9, rdi         ; r9 = x2 - x1
    call mod_inv        ; (x2 - x1)^-1 % p

    ; value of x_3
    mov r10, r8         
    mul r9
    call mod_add 
    mov r10, rax

    ; value of y_3
    mov r11, rax 
    mul r11 
    sub rax, rdi 
    sub rax, rsi 
    call mod_add 

    mov r12, rdi 
    sub rdi, rax
    mul r10
    sub rax, rsi 
    call mod_add 
    ret 
