TITLE      (.asm)

; Write a program that asks the user to enter an integer test
;score between 0 and 100. The program should display the appropriate letter grade
; 

INCLUDE Irvine32.inc
.data
	prompt BYTE "Enter a score from 0-100: ",0

.code
main PROC
	mov edx,OFFSET prompt
	call WriteString
	call ReadInt ; in eax
	
	cmp eax,90
	;jae A1
	jae A3
	

	cmp eax,80
	;jae B1
	jae B3

	cmp eax,70
	;jae C1
	jae C3

	cmp eax,60
	;jae D1
	jae D3

	cmp eax,0
	;jae F1
	jae F3


A3:
	mov al,'A'
	call WriteChar
	jmp finish

B3:
	mov al,'B'
	call WriteChar
	jmp finish

C3:
	mov al,'C'
	call WriteChar
	jmp finish

D3:
	mov al,'D'
	call WriteChar
	jmp finish

F3:
	mov al,'F'
	call WriteChar
	jmp finish












;F1:
;	cmp eax,59
;	jae F2
;F2:
;	mov al,'F'
;	call WriteChar
;	jmp finish
;
;D1:
;	cmp eax,69
;	jbe D2
;D2:
;	mov al,'D'
;	call WriteChar
;	jmp finish

;C1:
;	cmp eax,79
;	jbe C2
;C2:
;	mov al,'C'
;	call WriteChar
;	jmp finish


;B1:
;	cmp eax,89
;	jbe B2
;B2:
;	mov eax,0
;	mov al,'B'
;	call WriteChar
;	jmp finish

;A1:
;	cmp eax,100
;	jbe A2
;A2:
;	mov eax,0
;	mov al,'A'
;	call WriteChar






finish:

	exit
main ENDP
END main