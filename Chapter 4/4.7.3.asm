TITLE    4.7.3  (.asm)

; This program shows setting and usetting of ZF and SF


INCLUDE Irvine32.inc
.data

.code
main PROC
	;set unset ZF

	mov ecx,0AFh
	sub ecx,0AFh ; get ZF=1
	add ecx,1h ; get ZF=0
	call DumpRegs
	;----

	;set unset SF
	mov ecx,0
	sub ecx,1
	add ecx,2
	call DumpRegs


	exit
main ENDP
END main