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
	enter 8,0

	leave
	ret
MySub ENDP
END main