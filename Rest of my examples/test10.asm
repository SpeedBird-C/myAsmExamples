TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc


Rectangle STRUCT 
	UpperLeft  COORD <> 
	LowerRight COORD <> 
Rectangle ENDS

.data
	
	rect1	Rectangle < >
	rect2	Rectangle { }
	rect3	Rectangle { {10,10},{50,20} }
	rect4	Rectangle < <10,10>,<50,20> >
	
.code
main PROC
	mov  esi,OFFSET rect2
	mov  esi,OFFSET rect2.UpperLeft
	mov	edi,OFFSET rect2.LowerRight
	mov	(COORD PTR [edi]).X, 50
	mov	edi,OFFSET rect2.LowerRight.X
	mov  WORD PTR [edi],50
	
	exit
main ENDP
END main