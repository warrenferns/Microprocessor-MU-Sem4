.8086
.model small

.data
string1 db 11h, 42h, 43h, 44h, 45h
string2 db ?

.code
start:
mov ax, @data
mov ds, ax
mov es, ax
lea si, string1
lea di, string2
mov cl, 05h
cld
rep movsb
int 3h
end start