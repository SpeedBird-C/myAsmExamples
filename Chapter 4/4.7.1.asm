TITLE      (.asm)

; This program is 4.7.1. Write a program that uses addition and subtraction to set and clear the Carry flag
; Last update:

INCLUDE Irvine32.inc
.data
	val1 BYTE 0FFh ; уменьшаемое 
	val2 BYTE 1h ; вычитаемое 
	;set and unset CF via add
	val3 WORD 0FFh
	val4 WORD 1h
	
	
	
	
	subVal1 BYTE 1h
	subVal2 BYTE 2h
	;set and unset CF via sub 
	

.code
main PROC
	
	mov al,val1
	add al,val2
	call DumpRegs
	;set and unset CF via add
	mov ax,val3
	add ax,val4
	call DumpRegs


	;-------
	mov al,subVal1
	sub al,subVal2
	call DumpRegs
	;set un unset CF via sub
	sub al,subVal2
	call DumpRegs




	

	exit
main ENDP
END main