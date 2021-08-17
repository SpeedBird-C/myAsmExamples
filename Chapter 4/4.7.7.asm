TITLE   Arithmetic Expression   (.asm)

; Write a program that implements the following arithmetic expression: 
;EAX = −val2 + 7 − val3 + val1 


INCLUDE Irvine32.inc
.data
	val1 SDWORD 8
	val2 SDWORD -15
	val3 SDWORD 20

.code
main PROC
	
	mov eax,val2
	neg eax
	;movzx eax,WORD PTR val2
	add eax,7

	sub eax,val3
	add eax,val1

	call DumpRegs





	exit
main ENDP
END main