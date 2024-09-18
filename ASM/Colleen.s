extern printf

section .data
    msg: db "extern printf%1$c%1$csection .data%1$c    msg: db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c    global main%1$cmain:%1$c    push rbp%1$c    mov rdi, msg%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    mov rcx, msg%1$c    mov rax, 0%1$c    call printf wrt ..plt%1$c    pop rbp%1$c    mov rax, 0%1$c    ret%1$c%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c", 0

section .text
    global main
main:
    push rbp
    mov rdi, msg
    mov rsi, 10
    mov rdx, 34
    mov rcx, msg
    mov rax, 0
    call printf wrt ..plt
    pop rbp
    mov rax, 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
