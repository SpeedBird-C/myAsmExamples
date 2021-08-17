TITLE      (.asm)

; Write a procedure named DumpMemory that encapsulates the DumpMem procedure in the
;Irvine32 library

INCLUDE Irvine32.inc

DumpMemory PROTO,
			mybegin:PTR DWORD,
			mylength:DWORD,
			mytype:DWORD

.data
array DWORD 1h,2h,3h,4h,5h,6h,7h,8h,9h
.code
main PROC

	INVOKE DumpMemory,ADDR array,LENGTHOF array, TYPE array




	exit
main ENDP
DumpMemory PROC,
			mybegin:PTR DWORD,
			mylength: DWORD,
			mytype: DWORD
	pushad
	mov esi, mybegin
	mov ecx,mylength
	mov ebx,mytype
	call DumpMem
	popad
	ret
DumpMemory ENDP
END main