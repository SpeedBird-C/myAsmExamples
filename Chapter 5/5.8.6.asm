TITLE      (.asm)

; Write a program that generates and displays 20 random strings, each consisting of 10 capital
;letters {A..Z}


INCLUDE Irvine32.inc
.data
	buffer BYTE 11 DUP(0)
	commaStr BYTE ", ",0
.code
main PROC
	call Randomize		; optional: reseed random generator
	mov  ecx,20		; loop counter
	mov esi,OFFSET buffer
L1:	
	push ecx
	push esi
	mov ecx,10
	L2:
		mov  al,26		
		call RandomRange
		add  al,64		

		mov [esi],al
		inc esi

		
	loop L2
	pop esi
	mov edx,esi
	call WriteString 
	mov edx,OFFSET commaStr	
	call WriteString 

	pop ecx
loop L1


	exit
main ENDP
END main