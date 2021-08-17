TITLE      (.asm)

; This program shows Direct-Offset Addressing


INCLUDE Irvine32.inc
.data
	Uarray DWORD 1000h,2000h,3000h,4000h
	Sarray SDWORD -1,-2,-3,-4

.code
main PROC
	mov esi,OFFSET Uarray
	mov eax,[esi]
	mov ebx,[esi+4]
	mov ecx,[esi+8]
	mov edx,[esi+12]
	call DumpRegs
	
	; now for sign
	mov esi,OFFSET Sarray
	mov eax,[esi]
	mov ebx,[esi+4]
	mov ecx,[esi+8]
	mov edx,[esi+12]
	call DumpRegs






	exit
main ENDP
END main