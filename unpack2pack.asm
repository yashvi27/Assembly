Data SEGMENT
    packed DB 8 DUP(?)
    unpacked Db 01h,01h,02h,02h,03h,03h,04h,04h,05h,05h,06h,06h,07h,07h,08h,08h
    
Data ENDS

Code SEGMENT     
    ASSUME:DS:Data,CS:Code
    START:
        MOV AX,Data
        MOV DS,AX
        MOV AX,0    
        
        MOV CX,08h
        MOV SI,0
        MOV DI,0
        MOV BX,OFFSET unpacked
        
    CONVERT:
        MOV AX,0
        MOV AL,unpacked[SI]
        MOV AH,unpacked[SI+1]
        SHL AL,4
        SHR AX,4
        MOV packed[DI],AL
        INC SI
        INC SI
        INC DI
    LOOP CONVERT                
           
           
Code ENDS  
END START



