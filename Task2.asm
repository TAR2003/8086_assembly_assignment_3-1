.MODEL SMALL 
          
.STACK 100H
          
.DATA
C1 DB ?
C2 DB ?
C3 DB ?  
TEMP DB ?  
CR EQU 0DH
LF EQU 0AH
PROMPT1 DB 'ENTER 1ST LOWERCASE LETTER: $' 
PROMPT2 DB CR, LF,'ENTER 2ND LOWERCASE LETTER: $'
PROMPT3 DB CR, LF,'ENTER 3RD LOWERCASE LETTER: $'  
INV DB CR, LF,'INVALID INPUT, PROGRAM EXITING$'
ALLEQUAL DB CR, LF, 'All letters are equal$' 
NEWLINE DB CR, LF , '$'


.CODE

MAIN PROC
     MOV AX, @DATA
     MOV DS, AX   
     
     
     MOV AH, 9
     LEA DX, PROMPT1
     INT 21H        
   
     MOV AH, 1 
     INT 21H    
     CMP AL, 97
     JL INVALID_INPUT
     CMP AL, 122
     JG INVALID_INPUT
     MOV C1, AL
           
     MOV AH,9
     LEA DX, PROMPT2
     INT 21H
     
     MOV AH, 1 
     INT 21H
     CMP AL, 97
     JL INVALID_INPUT
     CMP AL, 122
     JG INVALID_INPUT
     MOV C2, AL
     
     MOV AH,9
     LEA DX, PROMPT3
     INT 21H
     
     MOV AH, 1 
     INT 21H   
     CMP AL, 97
     JL INVALID_INPUT
     CMP AL, 122
     JG INVALID_INPUT
     MOV C3, AL
        
     ;new line
     ;MOV AH, 2
     ;MOV DX, LF
     ;INT 21H  
     
     ;SORTING PROCESS STARTS
             
     MOV AL, C2        
     CMP C1,AL
     JG EXCHANGE1
     JMP NOTEXCHANGE1
     
     EXCHANGE1:
     MOV AL, C2
     MOV TEMP, AL 
     MOV AL, C1
     MOV C2, AL
     MOV AL, TEMP
     MOV C1, AL
     
     
     NOTEXCHANGE1:
     
     MOV AL, C3
     CMP C2, AL
     JG  EXCHANGE2
     JMP NOTEXCHANGE2
     
     
     EXCHANGE2:  
     MOV AL, C3
     MOV TEMP, AL
     MOV AL , C2
     MOV C3,AL
     MOV AL, TEMP
     MOV C2, AL
     
     
     NOTEXCHANGE2:
                
     MOV AL, C2
     CMP C1,AL
     JG EXCHANGE3
     JMP NOTEXCHANGE3
     
     EXCHANGE3:  
     MOV AL, C2
     MOV TEMP, AL
     MOV AL, C1
     MOV C2, AL
     MOV AL, TEMP
     MOV C1, AL
     
     
     NOTEXCHANGE3:
     
     ; SORTING DONE
     
     ;PRINTING A NEW LINE COMMAND
     
     MOV Ah,9
     LEA DX, NEWLINE
     INT 21H 
     
     ; NOW PRINTING 
     
     
     
     ;MOV AH, 2
     ;MOV DL, C1
     ;INT 21H     
     
     ;MOV AH, 2
     ;MOV DL, C2
     ;INT 21H   
     
     
     ;MOV AH, 2
     ;MOV DL, C3
     ;INT 21H  
     
     
     ;PRINTING A NEW LINE COMMAND
     
     MOV Ah,9
     LEA DX, NEWLINE
     INT 21H
     
     ;NOW FINAL STEP
     
     MOV AL, C3  
     CMP C2, AL
     JE BCEQUAL
     JL BLESSTHANC 
     
     
     BCEQUAL:
     MOV AL, C2
     CMP C1, AL
     JE EQUALLEVEL
     JL ALESSTHANB
     
     
     ALESSTHANB:
     MOV AH,2
     MOV DL, C1
     INT 21H
     JMP EXIT
     
     
     BLESSTHANC:
     MOV AH, 2
     MOV DL, C2
     INT 21H
     JMP EXIT   
     
     
     
     EQUALLEVEL:
     MOV AH, 9
     LEA DX, ALLEQUAL   ;EQUAL MESSAGE
     INT 21H
     JMP EXIT
           
     INVALID_INPUT:
     MOV AH, 9
     LEA DX, INV       ; INVALID INPUT AND EXIT
     INT 21H 
     JMP EXIT
         
     EXIT:    
     MOV AH, 4CH
     INT 21H
     MAIN ENDP
END MAIN
    