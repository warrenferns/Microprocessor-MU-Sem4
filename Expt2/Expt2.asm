data segment
num1 dw 4444h
num2 dw 0002h 
result dw ?
quo dw ?
rem dw ?
msg db 'Enter option: $' 
msg1 db '1)ADD $'
msg2 db '2)SUB $' 
msg3 db '3)MUL $'
msg4 db '4)DIV $'
code segment
assume ds:data, cs:code
start:
mov ax,data
mov ds,ax
lea dx,msg
mov ah,09h
int 21h
lea dx,msg1
mov ah,09h
int 21h
lea dx,msg2
mov ah,09h
int 21h
lea dx,msg3
mov ah,09h
int 21h
lea dx,msg4
mov ah,09h
int 21h
mov ah,08h
int 21h
cmp al,31h
jnz next1
mov ax,num1
add ax,num2
mov result,ax
next1:
cmp al,32h
jnz next2
mov ax,num1
sub ax,num2
mov result,ax 
next2:
cmp al,33h
jnz next3
mov ax,num1
mov bx,num2
mul bx
mov result,ax
next3:
cmp al,34h
jnz next4
mov ax,0000h
mov dx,0000h
mov ax,num1
div num2
mov quo,ax
mov rem,dx
next4:
end start
