TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data
	myData	WORD 1000h
	Sub2 PROTO, dataPtr:PTR WORD
;	Sub1 PROTO, someData:WORD
.code

main PROC
	INVOKE Sub2,ADDR myData
;	INVOKE Sub1,myData
	
	exit
main ENDP
Sub2   PROC   dataPtr: PTR WORD
		mov esi,dataPtr
		mov WORD PTR[esi],0
		ret
Sub2 ENDP
;Sub1   PROC   someData:WORD
;		mov someData,0
;		ret
;Sub1 ENDP
END main