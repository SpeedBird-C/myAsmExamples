TITLE      (.asm)

; Copy a String Backwards


INCLUDE Irvine32.inc
.data
	source BYTE "This is the source string",0
	target BYTE SIZEOF source DUP(0)
.code
main PROC
	mov ecx,SIZEOF source
	;sub ecx,2
	;mov al,source[ecx]
	mov esi,0
	
	L1:
		mov al,source[ecx-2]
		mov target[esi],al
		inc esi

	loop L1


	mov esi,OFFSET target
	mov ebx,1

	mov ecx,SIZEOF target-1
	call DumpMem



	exit
main ENDP
END main