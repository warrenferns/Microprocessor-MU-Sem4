.8086
.model small

.data
s1 db 10h, 12h, 08h, 02h, 04h, 0Ah, 0Dh, 06h, 14h, 15h

.code
start:
mov ax, @data
mov ds, ax
mov cl, 0Ah
mov ch, 0Ah
lea si, s1

back1:  mov al, [si]
        mov ah, [si+1]
        cmp al, [si+1]
        jnc back2
        jc back3
back2:  mov [si], ah
        mov [si+1], al
back3:  dec cl
        jz back4
        inc si
        jmp back1
back4:  lea si, s1
        dec ch
        jz next
        mov cl, ch
        jmp back1
next: int 3h
end start                                            