    bits 64
    global memmove:function
    section .text

memmove:
    mov r10, 0
    mov rax, rdi
    mov r8, 0
    jmp .check

.check:
    cmp rdi, 0
    je .exit
    inc r10
    cmp rsi, 0
    je .exit
    inc r10
    jmp .run

.run:
    mov rcx, rdx
    cmp rsi, rdi
    ja .mov
    inc r8
    mov rdx, rsi
    add rdx, rcx
    inc r8
    cmp rdi, rdx
    jae .mov
    inc r8
    jmp .finalize

.finalize:
    add rsi, rcx
    add rdi, rcx
    inc r10
    dec rsi
    dec rdi
    inc r10
    std

.mov:
    rep movsb
    cld

.exit:
    ret