TITLE      (.asm)

;Write a program that displays the same string in four different colors,
;using a loop. Call the SetTextColor procedure from the book’s link library 

INCLUDE Irvine32.inc
.data
	
	prompt1 BYTE "TExt color ",0

.code
main PROC
	mov ecx,4
	mov edx,white*16
	L1:
	push ecx
	push edx
	add ecx,edx
	mov eax,ecx
	call SetTextColor
	mov edx,OFFSET prompt1
	call WriteString
	pop edx
	pop ecx
	
	loop L1


	;mov eax,green+(white*16)
	;call SetTextColor
	;mov edx,OFFSET prompt1
	;call WriteString



	exit
main ENDP
END main