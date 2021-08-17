TITLE  4.7.4    (.asm)

; This program shows setting and unsetting OF flag 


INCLUDE Irvine32.inc
.data

.code
main PROC
	mov al,127
	add al,1 ;OF=1
	mov al,-128
	sub al,1 ;OF=1
	
	;----- unset
	sub al,1
	
	
	
	mov al,128 
	add al,0FEh ;OF=1 SF=1
	call DumpRegs




	exit
main ENDP
END main