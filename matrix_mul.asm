; multiplication of matrices is done assuming that both the matrics 
; have 2X2 dimensions. also satisfying the multiplication condition
data segment
    
    matrix1 db 01h, 02h
            db 03h, 04h
    
    matrix2 db 01h, 02h
            db 03h, 04h
                           
    result db 4 dup(?)
    
    row1 db 2h
    col1 db 2h
    col2 db 2h   
    temp db 0 
    res db 0
    
data ends

code segment                

    start:    
    mov ax, data
    mov ds, ax
    
    mov si,0
    mov di,0
    mov ax,0
    mov bx,0
    mov cx,0
    mov cl,row1
    loop1: 
    mov si,0
    push cx
    mov cx,0
    mov cl,col2
        loop2: 
        mov di,0
        push cx
        mov cx,0
        mov cl, col1  
        push si
            loop3:    
            mov al,matrix1[bx][di]
            push bx    
            mov bx,dx
            mul matrix2[bx][si] 
            pop bx
            add res,al
            inc di  
            add si,2        
            loop loop3       
        pop si    
        mov temp,dl
        mov dl,res
        mov result[bx][si],dl
        mov dl,temp    
        mov res, 0
        inc si    
        pop cx
        loop loop2    
    add bx,2
    mov dx,0
    pop cx
    loop loop1
    
code ends 
end start
