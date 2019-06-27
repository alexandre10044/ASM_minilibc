    bits 64
    global strchr:function
    section .text

strchr:
    xor rax, rax
    cmp rdi, 0
    je .exit_val
    jmp .prepare

.prepare:
    mov dl, sil
    mov r8, 0
    mov rsi, rdi

.loop:
    lodsb
    cmp al, dl
    je .exit_val
    inc r8
    jmp .check

.check:
    cmp al, 0
    jne .loop
    inc r8
    xor rax, rax
    jmp .exit

.exit_val:
    mov rax, rsi
    inc r8
    dec rax

.exit:
    ret