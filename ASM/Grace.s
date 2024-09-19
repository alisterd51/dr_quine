%macro MAIN 0
main:
    push rbp
    mov rdi, file
    mov rsi, mode
    mov rax, 0
    call fopen wrt ..plt
    mov rbx, rax
    mov rdi, rax
    mov rsi, msg
    mov rdx, msg
    mov rcx, 10
    mov r8, 37
    mov r9, 34
    mov rax, 0
    call fprintf wrt ..plt
    mov rax, 0
    mov rdi, rbx
    call fclose wrt ..plt
    pop rbp
    mov rax, 0
    ret
%endmacro

extern fopen
extern fclose
extern fprintf

section .data
    file: db "Grace_kid.s", 0
    mode: db "w+", 0
    msg: db "%3$cmacro MAIN 0%2$cmain:%2$c    push rbp%2$c    mov rdi, file%2$c    mov rsi, mode%2$c    mov rax, 0%2$c    call fopen wrt ..plt%2$c    mov rbx, rax%2$c    mov rdi, rax%2$c    mov rsi, msg%2$c    mov rdx, msg%2$c    mov rcx, 10%2$c    mov r8, 37%2$c    mov r9, 34%2$c    mov rax, 0%2$c    call fprintf wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, rbx%2$c    call fclose wrt ..plt%2$c    pop rbp%2$c    mov rax, 0%2$c    ret%2$c%3$cendmacro%2$c%2$cextern fopen%2$cextern fclose%2$cextern fprintf%2$c%2$csection .data%2$c    file: db %4$cGrace_kid.s%4$c, 0%2$c    mode: db %4$cw+%4$c, 0%2$c    msg: db %4$c%1$s%4$c, 0%2$c%2$csection .text%2$c    global main%2$c%2$c; comment one%2$cMAIN%2$c%2$csection .note.GNU-stack noalloc noexec nowrite progbits%2$c", 0

section .text
    global main

; comment one
MAIN

section .note.GNU-stack noalloc noexec nowrite progbits
