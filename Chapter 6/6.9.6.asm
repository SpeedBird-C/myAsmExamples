TITLE               (.asm)

Comment !
Using the College Registration  do the following:

	Using the solution program from the preceding exercise as a starting point, write a complete program that does the following:
1. Use a loop that lets the user continue entering grade averages and credits, and seeing the evaluation results. If the user enters 0 as the grade average, stop the loop.
2. Perform range checking when the user inputs credits and GradeAverage. Credits must be
between 1 and 30. GradeAverage must be between 0 and 400. If either value is out of range,
display an appropriate error message.
!
INCLUDE Irvine32.inc

TRUE  = 1
FALSE = 0

.data
gradeAverage  DWORD ?
credits       DWORD ?
OkToRegister  BYTE ?
;str1 BYTE "Error: Credits must be between 1 and 30",0dh,0ah,0
str1 BYTE "Input error",0dh,0ah,0
errorstr BYTE "Error: GradeAverage must be between 0 and 400",0dh,0ah,0
str2 BYTE "Enter gradeAverage: ",0
str3 BYTE "Enter credut : ",0

.code
main PROC

	;mov gradeAverage,100	; try different values
	;mov credits,12	; try different values

	call CheckRegistration

	movzx eax,OkToRegister	; show boolean result
	call DumpRegs	; for debugging only

	exit
main ENDP

;-----------------------------------------------
CheckRegistration PROC
;
; Evaluates the gradeAverage and number of
; credits, and sets the value of OkToRegister.
; Displays an error message if credits are
; not in the range 1-30.
; Receives: nothing
; Returns: sets boolean value of OkToRegister
;-----------------------------------------------
	push edx
	mov OkToRegister,FALSE

; Check credits for valid range 1-30
	;cmp credits,1	; credits < 1?
	;jb  E1
	;cmp credits,30	; credits > 30?
	;ja  E1
	;jmp L1	; credits are ok
Cycle:
	call EnterStuff
	;mov edx,OFFSET str2
	;call WriteString
	;call ReadInt; in eax
	;mov gradeAverage,eax

	;mov edx,OFFSET str3
	;call WriteString
	;call ReadInt; in eax
	;mov credits,eax

	cmp credits,0	; credits == 0?
	je  E1
	
	cmp gradeAverage,0	; gradeAverage == 0?
	je  E1

	jmp L2 ;	all is ok


; Display error message: credits out of range
E1:	mov edx,OFFSET str1
	call WriteString
	jmp  L4

; Evaluate gradeAverage and credits, using the logic
; found in Section 6.7.2.2
;L1:	cmp gradeAverage,0	; if gradeAverage > 0
;	ja L2
;	mov edx,OFFSET errorstr
;	call WriteString
;	jmp onemore
	

L2:	cmp gradeAverage,400	; elseif gradeAverage <= 400
	jna L3
	mov edx,OFFSET errorstr
	call WriteString
	jmp onemore

L3:	cmp credits,1	; elseif credits > 1
	ja  Last
	mov edx,OFFSET errorstr
	call WriteString
	jmp onemore
Last:
	cmp credits,30
	jbe Done
	mov edx,OFFSET errorstr
	call WriteString
	jmp onemore
Done:
	mov OkToRegister,TRUE	; OKToRegister = TRUE

onemore:
loopnz Cycle

L4:	pop edx	; endif
	ret
CheckRegistration ENDP

EnterStuff Proc
	mov edx,OFFSET str2
	call WriteString
	call ReadInt; in eax
	mov gradeAverage,eax

	mov edx,OFFSET str3
	call WriteString
	call ReadInt; in eax
	mov credits,eax
	ret
EnterStuff ENDP

END main