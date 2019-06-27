    bits 64
    global strcmp:function
    section .text

strcmp:
    mov r8, 0
    mov eax, edx
    mov r10, 0
    jmp .prepare

.prepare:
    cmp rdi, 0
    je .exit
    inc r8
    cmp rsi, 0
    je .exit
    inc r8

.loop:
    lodsb
    xchg rsi, rdi
    inc r8
    mov dl, al
    lodsb
    inc r8
    xchg rsi, rdi
    jmp .run

.run:
    cmp al, 0
    je .exit
    inc r10
    cmp dl, 0
    je .exit
    inc r10
    cmp al, dl
    je .loop
    inc r10

.exit:
    sub al, dl
    movsx eax, al
    ret