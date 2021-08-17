TITLE      (.asm)

; This program shifting array of five 32-bit integers on one digit right
; 

INCLUDE Irvine32.inc
.data
myarray	DWORD 642243A4h,42444460h,18044162h,2824110Ah,0A4590Ah

.code
main PROC
	mov esi,OFFSET myarray
	mov ecx,(LENGTHOF myarray)-1
	mov ebx,TYPE myarray
	push esi
	push ecx
	push ebx
L1:

	;mov ax,234Bh
	;mov dx,7654h
	;shrd ax,dx,1
	mov edx,[esi+4]
	shrd [esi],edx,4

	add esi,TYPE myarray

loop L1
	pop ebx
	pop ecx
	pop esi
	add ecx,1
	call DumpMem

	exit
main ENDP
END main