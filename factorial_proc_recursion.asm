
data segment
    n dw 5
    result dw 0
data ends

code segment
    assume cs:code ds:data
    start:  mov ax,data
            mov ds,ax 
            mov ax,1
            call fact
            
            fact proc
                 mov bx,n
                 cmp bx,1
                 je done
                 mul n
                 dec n 
                 call fact     
            
                 done:   mov result,ax
            fact endp
code ends
end start




