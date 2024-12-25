;; hold initialised constant values for prog
;; error and error length 
section .data 
    ec_error db "invalid arguments", 0x0a
    ec_error_len equ $ - ec_error

;; specify linker entry point for building
;; object files into an executable
section .text 
    global _start

_start:
    ;; fetch value count at rcx register and 
    ;; confirm correct argument values were passed
    ;; into rdi, rsi, rdx for command line args
    pop rcx 
    cmp rcx, 0x03 

    ;; if the number of arguments are  < 3
    ;; display an error msg on stdout
    jne arg_call

    ;; move the stack pointer to the second arg
    ;; argv[1] which lives in rsi register
    add rsp, 8 
    pop rsi

    ;; after getting the value from the rsi reg
    ;; call the string to int conversion function
    call str_to_int
    
    ;; store the generated value inside the 
    ;; r10 register. result was in rax reg
    mov r10, rax

    ;; get the second value @argv[2] and call
    ;; same function for the second value
    pop rsi
    call str_to_int 
    mov r11, rax

;; converts a string to an integer
str_to_int:
    ;; zero out the rax register
    ;; and move 10 to the rdx reg
    xor rax, rax
    mov rdx, 10

next:
    ;; compare the number to 0 and if it 
    ;; matches then the string is a NULL terminating character
    cmp [rel rsi], byte 0
    je return_str

    ;; else take one byte of the data passed from rsi reg
    ;; and move to the bl register and subtract 0 [48 in ascii]
    mov bl, [rel rsi]
    sub bl, 0x00 

    ;; add the values and increment the rsi register
    ;; continue the loop until value is 0
    add rax, rbx 
    inc rsi
    jmp next

return_str:
    ret

;; this function handles printing data on the screen
;; using Operating system apis also known as system calls
arg_call:
    mov rax, 0x2000004
    mov rdi, 0x2000001
    lea rsi, [rel ec_error]
    mov rdx, ec_error_len
    syscall
    jmp exit 

;; exit the application to avoid segmentation errors
;; the 0x2000001 is the syscall for exit on macos
exit:
    mov rax, 0x2000001 
    xor rdi, rdi 
