%define i 5

section .data
    name: db "Sully_%d.s", 0
    sully: db "%%define i %4$d%2$c%2$csection .data%2$c    name: db %3$cSully_%%d.s%3$c, 0%2$c    sully: db %3$c%1$s%3$c, 0%2$c    mode: db %3$cw+%3$c, 0%2$c    cmd: db %3$cnasm -f elf64 Sully_%%1$d.s -o Sully_%%1$d.o && cc Sully_%%1$d.o -o Sully_%%1$d && rm Sully_%%1$d.o && ./Sully_%%1$d%3$c, 0%2$c%2$csection .bss%2$c    array: resb 200%2$c    array2: resb 200%2$c%2$csection .text%2$c    global main%2$c    extern sprintf%2$c    extern fopen%2$c    extern fprintf%2$c    extern fflush%2$c    extern fclose%2$c    extern system%2$cmain:%2$c    mov rax, i%2$c    cmp rax, 0%2$c    jle .end%2$c    push rbp%2$c    mov rax, 0%2$c    mov rdi, array%2$c    mov rsi, name%2$c    mov rdx, i-1%2$c    call sprintf wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, array%2$c    mov rsi, mode%2$c    call fopen wrt ..plt%2$c    mov rbx, rax%2$c    mov rax, 0%2$c    mov rdi, rbx%2$c    mov rsi, sully%2$c    mov rdx, sully%2$c    mov rcx, 10%2$c    mov r8, 34%2$c    mov r9, i-1%2$c    call fprintf wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, rbx%2$c    call fflush wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, rbx%2$c    call fclose wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, array2%2$c    mov rsi, cmd%2$c    mov rdx, i-1%2$c    call sprintf wrt ..plt%2$c    mov rax, 0%2$c    mov rdi, array2%2$c    call system wrt ..plt%2$c    pop rbp%2$c.end:%2$c    mov rax, 0%2$c    ret%2$c%2$csection .note.GNU-stack noalloc noexec nowrite progbits%2$c", 0
    mode: db "w+", 0
    cmd: db "nasm -f elf64 Sully_%1$d.s -o Sully_%1$d.o && cc Sully_%1$d.o -o Sully_%1$d && rm Sully_%1$d.o && ./Sully_%1$d", 0

section .bss
    array: resb 200
    array2: resb 200

section .text
    global main
    extern sprintf
    extern fopen
    extern fprintf
    extern fflush
    extern fclose
    extern system
main:
    mov rax, i
    cmp rax, 0
    jle .end
    push rbp
    mov rax, 0
    mov rdi, array
    mov rsi, name
    mov rdx, i-1
    call sprintf wrt ..plt
    mov rax, 0
    mov rdi, array
    mov rsi, mode
    call fopen wrt ..plt
    mov rbx, rax
    mov rax, 0
    mov rdi, rbx
    mov rsi, sully
    mov rdx, sully
    mov rcx, 10
    mov r8, 34
    mov r9, i-1
    call fprintf wrt ..plt
    mov rax, 0
    mov rdi, rbx
    call fflush wrt ..plt
    mov rax, 0
    mov rdi, rbx
    call fclose wrt ..plt
    mov rax, 0
    mov rdi, array2
    mov rsi, cmd
    mov rdx, i-1
    call sprintf wrt ..plt
    mov rax, 0
    mov rdi, array2
    call system wrt ..plt
    pop rbp
.end:
    mov rax, 0
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
