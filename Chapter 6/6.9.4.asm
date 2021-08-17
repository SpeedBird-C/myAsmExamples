TITLE      (.asm)

; This program
; Last update:
;Using the solution program from the preceding exercise as a starting point, add the following features:
;• Run in a loop so that multiple test scores can be entered.
;• Accumulate a counter of the number of test scores.
;• Perform range checking on the user’s input: Display an error message if the test score is less
;than 0 or greater than 100.

INCLUDE Irvine32.inc
.data
	prompt BYTE "Enter a score from 0-100: ",0
	promptError BYTE "Error input",0
	counter BYTE 0

.code
main PROC
	mov ecx,4
L1:

	call Score


loop L1


	



	exit
main ENDP

Score PROC
pushad

	mov edx,OFFSET prompt
	call WriteString
	call ReadInt ; in eax
	
	cmp eax,101
	jae Error


	inc counter

	cmp eax,90
	jae A3
	

	cmp eax,80
	jae B3

	cmp eax,70
	jae C3

	cmp eax,60
	jae D3

	cmp eax,0
	jae F3

	cmp eax,0
	jl ErrorMin

Error:
	mov edx,OFFSET promptError
	call WriteString
	call CrLf
	popad
	ret
ErrorMin:
	mov edx,OFFSET promptError
	call WriteString
	call CrLf
	popad
	ret 

A3:
	mov al,'A'
	call WriteChar
	call CrLf
	popad
	ret

B3:
	mov al,'B'
	call WriteChar
	call CrLf
	popad
	ret

C3:
	mov al,'C'
	call WriteChar
	call CrLf
	popad
	ret

D3:
	mov al,'D'
	call WriteChar
	call CrLf
	popad
	ret

F3:
	mov al,'F'
	call WriteChar
	call CrLf
	popad


ret
Score ENDP
END main