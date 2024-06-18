    bits 64
    global strstr:function
    section .text

strstr:
    mov r10, 0
    cmp rdi, 0
    je .exit_err
    mov r11, 0
    cmp rsi, 0
    je .exit_err
    jmp .prepare

.prepare:
    mov r8, rdi
    mov r9, rsi

.loop:
    lodsb
    xchg rdi, rsi
    inc r10
    mov dl, al
    lodsb
    inc r10
    xchg rdi, rsi
    jmp .loop_check
    inc r10

.loop_check:
    cmp dl, 0
    je .exit_succ
    inc r11
    cmp al, 0
    je .exit_err
    inc r11
    cmp al, dl
    je .loop
    jmp .loop_jump
    inc r11

.loop_jump:
    inc r8
    mov rdi, r8
    inc r11
    mov rsi, r9
    jmp .loop

.exit_err:
    xor r8, r8
    inc r11

.exit_succ:
    mov rax, r8
    inc r11
    ret