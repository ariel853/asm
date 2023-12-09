; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
data ends

stack segment
    dw   128  dup(0)
stack ends

code segment
ASSUME CS:CODE, DS:DATA, SS:STACK
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
;**********************************************
    ; add your code here

main proc far

	mov al, 12h
	mov ah, 0   ; set graphics video mode.
	int 10h  

	mov cx, 0 ;min X
	mov dx, 1000 ;max X
	mov ax, 7
	int 33h

	mov cx, 0 ;min Y
	mov dx, 1000 ;max Y
	mov ax, 8
	int 33h 


	mov ax, 1   ;shows mouse cursor
	int 33h



	Next:
		call show_cursor
		mov cx , 50
		loop $

		mov ax, 3   ;get cursor positon in cx,dx
		int 33h

		call hide_cursor

		cmp bx , 1
		jne Next
	  
		call putpix ;call procedure 
		jmp Next

		mov ah,4ch
		int 21h
main endp
	 
	 
	;procedure to print
putpix proc   
	mov al, 4   ;color of pixel  
	mov ah, 0Ch    
	shr cx,1    ; cx will get double so we divide it by two
	int 10h     ; set pixel.
	ret
putpix endp 


	;******************************************
show_cursor proc
	mov ax, 1 
	int 33h   

	ret
show_cursor endp
	;*********************
	 
hide_cursor proc
	mov ax, 2 
	int 33h   

	ret
hide_cursor endp 

	;*********************
get_pos_stat proc

	mov ax , 3
	int 33h

	ret
get_pos_stat endp
	;******************** 


code ends      
	   
	  ;********************************************** 


end start ; set entry point and stop the assembler.
