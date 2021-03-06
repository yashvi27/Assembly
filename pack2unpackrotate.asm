Data SEGMENT
    packed DB 11h,12h,13h,14h,15h,16h,17h,18h
    unpacked DB 16 DUP(?) 
    
Data ENDS

Code SEGMENT     
    ASSUME:DS:Data,CS:Code
    START:
        MOV AX,Data
        MOV DS,AX
        MOV AX,0  
        
        MOV CX,08h
        MOV SI,0h
        MOV DI,0h 
        MOV BX,OFFSET packed
        
    CONVERT:  
        MOV AX,0
        MOV AL,BX[SI]
        ROL AX,4
        ROR AL,4
        MOV unpacked[DI],AL 
        MOV unpacked[DI+1],AH
        INC SI
        INC DI
        INC DI
    LOOP CONVERT                
           
           
Code ENDS  
END START