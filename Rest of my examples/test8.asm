TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data
	array DWORD 10000h,20000h,30000h,40000h,50000h
	theSum DWORD ?
.code
ArraySum PROTO,
			ptrArray:PTR DWORD,
			szArray:DWORD
main PROC
	
	INVOKE ArraySum,
					ADDR array,
					LENGTHOF array
	mov theSum,eax



	exit
main ENDP

ArraySum PROC USES esi ecx,
			ptrArray:PTR DWORD,
			szArray:DWORD
		
		mov eax,0
		mov esi,ptrArray
		mov ecx,szArray
		cmp ecx,0
		je L2
	L1:
		add eax,[esi]
		add esi,4
		loop L1
	L2:
		ret
ArraySum ENDP



END main