    bits 64
    global strlen:function
    section .text

strlen:
    xor rax, rax
    jmp .check

.check:
    cmp rdi, 0
    je .exit
    mov r8, 0
    mov rsi, rdi

.loop:
    lodsb
    cmp al, 0
    jne .loop
    inc r8
    jmp .prepare

.prepare:
    mov rax, rsi
    sub rax, rdi
    inc r8
    dec rax

.exit:
    ret