Data SEGMENT
    idx db 5h
    sum dd 0
    arr dd 10000000h,20000000h,30000000h,10000000h,10110011h
Data ENDS

Code SEGMENT
  ASSUME DS:Data, CS:Code
  START:
    MOV AX,Data
    MOV DS, AX
    MOV SI,0
    MOV AX,0 
    MOV DX,0 
    MOV CL,idx
    LEA BX,arr
    
    Total: 
        ADD AX,BX[SI]
        ADC DX,BX[SI+2]
        INC SI         
        INC SI
        INC SI
        INC SI
    LOOP Total
           
    MOV sum WORD PTR,AX
    MOV sum+2 WORD PTR,DX  
Code ENDS     
END START

    
    




