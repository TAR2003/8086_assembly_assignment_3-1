.MODEL SMALL

.STACK 100H

.DATA
NEWLINE DB 10,10,13,'$'
D1 DB ?
D2 DB ?   
ANS DW ?  
TOTALINPUT DW ?  
MSG DW 'ENTER THE NUMBER: $'  
MSG2 DW 'SUM OF DIGITS: $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX    
    
    MOV TOTALINPUT,0  
    
    MOV AH,9
    LEA DX, MSG
    INT 21H
    
    
    INPUTLEVEL:
    MOV AH, 1
    INT 21H
    MOV D1, AL  
    CMP D1, ' '
    JE INDIN
    SUB  D1, '0' 
    
    MOV AX, TOTALINPUT    
    MOV BX, 10
    IMUL BX  
    XOR BX,BX
    ADD BL,D1
    ADD AX,BX
    MOV TOTALINPUT, AX    
    JMP INPUTLEVEL 
    
    INDIN:
    ;MOV CX,TOTALINPUT
    ;MOV ANS, CX   
    ;MOV ANS, CX
    ;MOV AH, 2     
    MOV AX, TOTALINPUT
    PUSH 0      
    CALL DIGITSUM  
    MOV ANS, AX
    MOV AH,9
    LEA DX, NEWLINE
    INT 21H    
    LEA DX,  MSG2
    INT 21H
    MOV AX, ANS
    PUSH 10
    CALL PRINT
    
 
    
    EXIT:
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
    DIGITSUM PROC NEAR
        PUSH BP
        MOV BP,SP
        CMP AX ,0
        JNE END_IF  
        MOV AX, DX  
        ;PUSH 0
        JMP RETURN
        END_IF: 
        
        MOV BX,10
        XOR DX,DX
        DIV BX
        PUSH DX 
        ;MOV AX,ANS
        CALL DIGITSUM
        ADD AX, WORD PTR[BP+4]
        RETURN:
        POP BP
        RET 2 
    PRINT PROC NEAR
        PUSH BP
        MOV BP,SP
        CMP AX ,0
        JNE END_IF2  
        ;MOV AX, DX 
        ADD DX, '0'
        MOV AH,2
        INT 21H 
        MOV AX,DX
        ;PUSH 0
        JMP RETURN2
        END_IF2: 
        
        MOV BX,10
        XOR DX,DX
        DIV BX
        PUSH DX 
        ;MOV AX,ANS  
        CALL PRINT
        ;ADD AX, WORD PTR[BP+4] 
        MOV DX, WORD PTR[BP+4]
        CMP DX, 9
        JG ENDPROCIF 
        ADD DX, '0'
        MOV AH,2
        INT 21H     
        
        ENDPROCIF:
        
        RETURN2:
        POP BP
        RET 2
END MAIN       


