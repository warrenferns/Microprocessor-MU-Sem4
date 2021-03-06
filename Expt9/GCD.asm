data SEGMENT
    n1    DB    8
    n2    DB    22
    rez   DB    ?
ENDS

stack SEGMENT
    DB    128    dup(0)
ENDS

code SEGMENT
    nzd PROC
        POP CX 
        POP BX
        ciklus: 
            CMP BL, 0d
            JE done            
            MOV AL, BH
            MOV AH, 0d 
            DIV BL 
            MOV BH, BL 
            MOV BL, AH          
            JMP ciklus
        done:
            PUSH BX
            PUSH CX 
        RET
    nzd ENDP  
    start:
        MOV AX, data
        MOV DS, AX
        MOV ES, AX
        MOV AX, stack
        MOV SS, AX        
        MOV BH, [n1]
        MOV BL, [n2]
        PUSH BX
        CALL nzd
        POP BX
        MOV [rez], BH       
    exit:
        MOV AH, 4ch 
        INT 21h    
ENDS
END start