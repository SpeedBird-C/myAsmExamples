TITLE      (.asm)

; This program shows how stack with function works
; Last update:

INCLUDE Irvine32.inc
.data

.code

Sub1 PROC
	add eax,ebx
	add eax,ecx
	call Sub2
	ret
Sub1 ENDP

Sub2 PROC
	add eax,ebx
	add eax,ecx
	call Sub3
	ret
Sub2 ENDP

Sub3 PROC
	add eax,ebx
	add eax,ecx
	ret
Sub3 ENDP

main PROC
	mov eax,1
	call Sub1
	exit
main ENDP
END main