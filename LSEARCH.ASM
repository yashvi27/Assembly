Data SEGMENT
    IDX  DB 5h
	ARR1 DB 1h,2h,3h,4h,5h
	TMP  DB  ?
	TMP1 DW  ?
	MES1 DB 10,13, 'ELEMENT FOUND AT POSITION:$'
	MES2 DB 10,13, 'ENTER THE NUMBER TO BE SEARCHED:$'
	MES3 DB 10,13, 'ELEMENT NOT FOUND$'
Data ENDS

Code SEGMENT     
    ASSUME:DS:Data,CS:Code
    START:
        MOV AX,Data
        MOV DS,AX
        
        MOV AX,0
	
	    MOV DX, OFFSET MES2
	    MOV AH,09H
	    INT 21H

	    MOV AH,01H
	    INT 21H 
	    SUB AL,30h
	    MOV TMP,AL

	    MOV SI,0
	    LEA BX,ARR1
	    MOV CL,IDX
	
    L2:	
	    MOV DL,TMP
	    CMP DL, BX[SI]
	    JE L3  
	    INC SI
	    DEC CX
	    JNZ L2
	    JZ L4

    L3:	
	    MOV TMP1,SI 	
	    MOV DX, OFFSET MES1
	    MOV AH,09H
	    INT 21H
	    MOV BX,TMP1
	    ADD BX,31H
	    MOV DL,BL	
	    MOV AH,02H
	    INT 21H
	    HLT
	
    L4:	
	    MOV DX, OFFSET MES3
	    MOV AH,09H
	    INT 21H
Code ENDS  
END START   
            