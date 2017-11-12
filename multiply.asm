
data segment
    dpx dw 10
    dpy dw 10
    dpz dw 0
data ends

code segment
    assume cs:code, ds:data 
    start:  mov ax,data
            mov ds,ax
            mov ax,dpx
            mul dpy
            mov dpz,ax
            mov cx,dx
            mov ax,dpx+2
            mul dpy
            mov bx,dx
            add cx,ax
            adc bx,0
            mov ax,dpx
            mul dpy+2
            add cx,ax
            adc bx,dx
            mov dpz+2,cx
            mov cx,0
            adc cx,0
            mov ax,dpx+2
            mul dpy+2
            add ax,bx
            adc dx,cx
            mov dpz+4,ax
            mov dpz+6,dx
code ends
end start

ret




