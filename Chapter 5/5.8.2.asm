TITLE      (.asm)

; Enter ten 32-bit sign integets, save them in array and show on a screen

INCLUDE Irvine32.inc
.data
	array SDWORD 10 DUP(?)

.code
main PROC
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	call initArray
	call writeArray



	exit
main ENDP

	initArray PROC
	push esi
	push ecx
	L1:
		call ReadInt
		mov [esi],eax
		add esi,TYPE DWORD ; 4
	loop L1
	pop ecx
	pop esi
	ret
	initArray ENDP

	writeArray PROC
	push esi
	push ecx
	L1:
		mov eax,[esi]
		call WriteInt
		call CrLf
		add esi,TYPE DWORD
	loop L1

	pop ecx
	pop esi
	
	ret
	writeArray ENDP


END main