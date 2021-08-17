TITLE                            (.asm)

Comment !
 Write a procedure named FastMultiply that multiplies any
unsigned 32-bit integer by EAX, using only shifting and addition. Pass
the integer to the procedure in the EBX register, and return the product
in the EAX register. Write a short test program that calls the procedure
and displays the product. (We will assume that the product is never
larger than 32 bits.)


!
INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
str1 BYTE "Fast Multiplication Program - ** DEMO **",
	       0dh,0ah,0dh,0ah,0

.code
main PROC
	call Clrscr
	mov  edx,OFFSET str1
	call WriteString

L1:
	mWrite "Enter an unsigned integer (0 to quit): "
	call ReadDec
	.IF CARRY?
	  mWrite <"Error: Integer is out of range",0dh,0ah>
	  jmp L1
	.ELSE
	mov  ebx,eax
	.ENDIF
	cmp eax,0
	je  quit


L2:
	mWrite "Enter an unsigned integer: "
	call ReadDec
	.IF CARRY?
	  mWrite <"Error: Integer is out of range",0dh,0ah>
	  jmp L2
	.ENDIF

	mWrite <"--------------------------------",0dh,0ah>

	; EBX = multiplicand, EAX = multiplier
	call FastMultiply	; EAX = product
	jc   L1	; CF=1 indicates error

	mWrite "The product is:       "
	call WriteDec	; display product
	call Crlf
	call Crlf
	jmp  L1

quit:
	exit
main ENDP

;-----------------------------------------------------------------
FastMultiply PROC uses ecx edx esi
;
; Multiplies any unsigned 32-bit integer by EAX, using only
; shifting and addition.
; Receives: EBX = integer to multiply by EAX
; Returns: EAX = product of EBX times EAX
;----------------------------------------------------------------
	mov edx,eax	; make a copy of multiplier
	mov eax,0	; clear accumulator
	mov ecx,0	; initialize bit position counter

MultiplyLoop:
	shr edx,1	; low bit set?
	jnc L1	; no: skip this round
		; yes: continue
	mov esi,ebx	; make copy of multiplicand

	; Test without special loop
	;clc
	;shl esi,cl
	call ShiftLeft	; shift left very carefully!

	jc  TooLarge	; quit if result too large
	add eax,esi	; add partial product to accumulator
	jc  TooLarge	; quit if result too large

L1:	inc ecx
	cmp ecx,32	; end of loop?
	jb  MultiplyLoop	; no: multiply next bit
	clc	; yes: CF=0 indicates success
	jmp L2	; all done

TooLarge:
	mWrite "Error: Product is too large for a 32-bit integer"
	;mNewLine
	stc	; CF=1 indicates error

L2:	ret
FastMultiply ENDP


;-------------------------------------------------
ShiftLeft PROC
;
; Receives: ESI (target value); CL = shift count
; Shifts 1 bit at a time; Returns immediately
; if the Carry flag is set.
; Returns: Shifted value in ESI
;-------------------------------------------------
	push ecx
	clc
	cmp  ecx,0
	je   exitProc

L1:	shl  esi,1
	jc   exitProc
	loop L1

exitProc:
	pop ecx
	ret
ShiftLeft ENDP



END main