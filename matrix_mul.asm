; multiplication of matrices is done assuming that both the matrics 
; have 2X2 dimensions. also satisfying the multiplication condition
data segment
    
    matrix1 db 01h, 02h
            db 03h, 04h
    
    matrix2 db 01h, 02h
            db 03h, 04h
                           
    result dw 4 dup(?)
    
    row1 db 2h
    col1 db 2h
    col2 db 2h
    
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
            loop3:
            mov al,matrix1[bx][di] 
            mov dx,bx
            mov bx,di
            mul matrix2[bx][si]
            mov bx,dx
            add result[bx][si],ax
            inc di          
            loop loop3        
        inc si
        pop cx
        loop loop2
    inc bx
    pop cx
    loop loop1
    
code ends 
end start