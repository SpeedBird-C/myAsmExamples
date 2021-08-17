TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data

.code
main PROC
	
	call MySub



	exit
main ENDP
MySub PROC 
	push ebp
	mov ebp,esp
	sub esp,36

	mov BYTE PTR [ebp-4],'X'
	mov DWORD PTR [ebp-8],10
	mov BYTE PTR [ebp-28],'Y'
	mov DWORD PTR [ebp-32],3ff33333h
	mov DWORD PTR [ebp-36],33333333h

	mov esp,ebp
	pop ebp
	ret
MySub ENDP


END main