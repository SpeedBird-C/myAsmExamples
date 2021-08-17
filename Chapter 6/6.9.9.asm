TITLE      (.asm)

; Write a program that randomly chooses among three different colors for displaying text on the
; screen. 

INCLUDE Irvine32.inc
.data
msg BYTE "Line of text with randomly chosen color",0

.code
main PROC

call ClrScr
	call Randomize	; seed the random number generator

	mov edx, OFFSET msg	; line of text
	mov ecx, 20	; counter (lines of text)

L1:	call ChooseColor
	call SetTextColor
	call WriteString	; display line of text
	call Crlf
	loop L1




	exit
main ENDP

ChooseColor PROC
;
; Selects a color with the following probabilities:
; white = 30%, blue = 10%, green = 60%.
; Receives: nothing
; Returns: EAX = color chosen
;-----------------------------------------------

	mov eax, 10	; range of random numbers (0-9)
	call RandomRange	; EAX = Random number
	cmp eax,4
	jae A
	cmp eax,3
	je	B
	jmp	R


A:
	mov eax, green
	ret
B:
	mov eax, blue
	ret
R:
	mov eax, white
	ret

ChooseColor ENDP
END main