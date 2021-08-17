TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data
myarray WORD 1000h,2000h,3000h
.code
main PROC

	mov	ebx,OFFSET myarray
	mov	esi,2
	mov	ax,[ebx+esi]
	
	mov	edi,OFFSET myarray
	mov ecx,4
	mov ax,[edi+ecx]

	mov	ebp,OFFSET myarray
	mov esi,0
	mov ax,[ebp+esi]


	exit
main ENDP
END main