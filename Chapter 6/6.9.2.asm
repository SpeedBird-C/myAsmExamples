TITLE      (.asm)

; while (op1<op2)
;	{
;		op1++;
;		if(op2==op3)
;			X=2;
;		else
;			X=3;
;	}
; make this cycle on masm 
; Last update:

INCLUDE Irvine32.inc
.data
	op1 DWORD 2
	op2 DWORD 4
	op3 DWORD 5
	X DWORD ?

.code
main PROC
	mov eax,op1
	mov ebx,op2
	mov ecx,op3
	.WHILE eax<ebx
		inc eax
		.IF ebx==ecx
			mov X,2
		.ELSEIF
			mov X,3
		.ENDIF
	.ENDW
	




	exit
main ENDP
END main