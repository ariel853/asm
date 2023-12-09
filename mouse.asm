STACK SEGMENT PARA STACK
    DB 64 DUP (' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

DATA ENDS

CODE SEGMENT PARA 'CODE'
	;ASSUME CS:CODE, DS:DATA, SS:STACK

    MAIN PROC FAR
		mov AX, DATA
		MOV DS, AX
        mov ax, 0
		int 33h

		mov ax, 1
		int 33h

		mov cx, 0 ;min X
		mov dx, 635 ;max X
		mov ax, 7
		int 33h

		mov cx, 0 ;min Y
		mov dx, 195 ;max Y
		mov ax, 8
		int 33h
		
		mov cx, 8*1
		mov dx, 16*1
		mov ax, 0Fh
		int 33h

		mov cx, 128
		mov dx, 64
		mov ax, 4
		int 33h

		mov ax, 3
		int 33h

		; Print the X position using INT 21h, function 2
		mov dl, ch     ; Assuming you want to print the high byte of CX
		mov ah, 2
		int 21h
		

		; Move the cursor to a new line
		mov dl, 0Dh    ; Carriage return
		mov ah, 2
		int 21h
		mov dl, 0Ah    ; Line feed
		int 21h

		; Print the X position again using INT 21h, function 2
		mov dl, cl     ; Assuming you want to print the low byte of CX
		mov ah, 2
		int 21h
		

		; Exit the program
		mov ah, 4Ch
		int 21h
		
    MAIN ENDP

CODE ENDS
END
