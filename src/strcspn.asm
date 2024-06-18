    bits 64
    global strcspn:function
    section .text

strcspn:
    xor rax, rax
    jmp .prepare

.prepare:
    cmp rdi, 0
    je .exit
    mov r10, 0
    cmp rsi, 0
    je .exit
    mov r11, 0
    mov r8, rdi
    mov r12, 0
    mov r9, rsi

.loop_check:
    mov dl, [rdi]
    inc r10
    cmp dl, 0
    je .leave_loop
    inc r10

.loop_run:
    lodsb
    inc r11
    cmp al, 0
    je .current
    inc r11
    cmp al, dl
    je .leave_loop
    inc r11
    jmp .loop_run

.current:
    inc rdi
    inc r12
    mov rsi, r9
    inc r12
    jmp .loop_check

.leave_loop:
    mov rax, rdi
    inc r12
    sub rax, r8

.exit:
    ret