TITLE Sum of Integers                 (CSum.asm)

; This program demonstrates recursion as it sums
; the integers 1-n.
; Last update: 06/20/02

INCLUDE Irvine32.inc

.code
main PROC
	mov  ecx,5	; count = 5
	mov  eax,0	; holds the sum
	call CalcSum	; calculate sum
L1:	call WriteDec	; display eax
	call Crlf
	exit
main ENDP

;--------------------------------------------------------
CalcSum PROC
; Calculates the sum of a list of integers
; Receives: ECX = count
; Returns: EAX = sum
;--------------------------------------------------------
	cmp  ecx,0	; check counter value
	jz   L2	; quit if zero
	add  eax,ecx	; otherwise, add to sum
	dec  ecx	; decrement counter
	call CalcSum	; recursive call
	add edx,1
L2:	ret
CalcSum ENDP

END Main