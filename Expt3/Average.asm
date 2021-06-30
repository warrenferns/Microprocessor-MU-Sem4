.8086
.model small
.data
array db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 0ah
count db 0ah
avg dw ?
.code
start:
mov ax, @data
mov ds, ax  
mov ax, 00h
lea si, array
mov cl, count
back:   mov dl, [si]
        mov dh, 00h
        add ax, dx
        inc si
        dec cl
        jnz back
div count
mov avg, ax
mov ah, 4ch
int 3h
end start
        