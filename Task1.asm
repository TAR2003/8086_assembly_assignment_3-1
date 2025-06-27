.MODEL SMALL 
          
.STACK 100H
          
.DATA

MMM DB 65
C DB ?     
CR EQU 0DH
LF EQU 0AH
MSG1 DB CR, LF, 'Uppercase letter$'
MSG2 DB CR, LF, 'Lowercase letter$'
MSG3 DB CR, LF, 'Number$'
MSG4 DB CR, LF, 'Not an alphanumeric value$'     
PROMPT DB 'INPUT A SINGLE ASCII CHARACTER: $'

.CODE

MAIN PROC
     MOV AX, @DATA
     MOV DS, AX  
     
     MOV AH, 9
     LEA DX, PROMPT
     INT 21H     
     
     
     MOV AH, 1
     INT 21H
     MOV C, AL 
     
     ; COMPARE PROCESS STARTS
     
     CMP C, 48
     JL L4
     
     CMP C, 58
     JL L3
     
     CMP C, 65
     JL L4
     
     CMP C, 91
     JL L1
     
     CMP C, 97
     JL L4
     
     CMP C,123
     JL L2
     JMP L4   
     
     ;COMPARE PROCESS DONE
          
     ; PRINTING PROCESS
     
     L1:
     MOV AH, 9
     LEA DX, MSG1
     INT 21H
     JMP  EXIT
     
     L2:
     MOV AH, 9
     LEA DX, MSG2 
     INT 21H   
     JMP EXIT
     
     L3:
     MOV AH, 9
     LEA DX, MSG3
     INT 21H   
     JMP EXIT
     
     L4:
     MOV AH, 9
     LEA DX, MSG4 
     INT 21H   
     JMP EXIT
     
     ;PRINTING PROCESS DONE 
            
     EXIT:          
     MOV AH, 4CH
     INT 21H
     MAIN ENDP
END MAIN
    