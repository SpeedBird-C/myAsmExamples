TITLE   4.7.2   (.asm)

; This program let us make sure that INC or DEC do not affect the state of CF 


INCLUDE Irvine32.inc
.data

.code
main PROC
	mov al,0FFh
	inc al
	call DumpRegs





	exit
main ENDP
END main