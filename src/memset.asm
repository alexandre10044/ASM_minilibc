    bits 64
    global memset:function
    section .text

memset:
    jmp .define

.define:
    mov rcx, rdx
    mov r8, 0
    mov al, sil
    inc r8
    push rdi
    jmp .run

.run:
    cmp rdi, 0
    je .exit
    inc r8
    rep stosb

.exit:
    pop rax
    ret