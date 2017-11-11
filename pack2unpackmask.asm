Data SEGMENT
    packed DB 11h,12h,13h,14h,15h,16h,17h,18h
    unpacked DB 16 DUP(?)    
    mask1 db 0Fh
    mask2 db 0F0h
    
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
        MOV AH,BX[SI]
        AND AL,mask1
        AND AH,mask2
        SHR AH,4
        MOV unpacked[DI],AL 
        MOV unpacked[DI+1],AH
        INC SI
        INC DI
        INC DI
    LOOP CONVERT                
           
           
Code ENDS  
END START