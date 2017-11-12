
data segment
    n dw 5
    result dw 0
data ends

code segment
    assume cs:code ds:data
    start:  mov ax,data
            mov ds,ax
            mov ax,n
            dec n
            mov cx,n
            loop1:  mul n   
                    dec n
                    loop loop1
            mov result,ax
code ends
end start



