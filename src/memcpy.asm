    bits 64
    global memcpy:function
    section .text

memcpy:
    mov r10, 0
    mov rax, rdi
    jmp .check

.check:
    cmp rdi, 0
    je .exit
    inc r10
    cmp rsi, 0
    je .exit
    inc r10
    jmp .cpy

.cpy:
    mov rcx, rdx
    inc r10
    rep movsb

.exit:
    ret