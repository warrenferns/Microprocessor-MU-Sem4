.8086
.model small
.data
arr db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah
ec db ?
oc db ?
.code
start:
mov ax, @data
mov ds, ax
lea si, arr
mov cl, 0ah
back:   mov al,[si]
        ror al, 01
        jc odd
        inc ec
        jmp down  
odd:    inc oc
down:   inc si
        dec cl
        jnz back
mov ah,4ch
int 21h
end start                     