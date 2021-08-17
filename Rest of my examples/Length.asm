TITLE String Length                           (Length.asm)

; This program tests the Str_length procedure,
; which returns the length of a string.
; Last update: 9/7/01

INCLUDE Irvine32.inc

Str_lengthmy PROTO,
	pString:PTR BYTE		; pointer to string

.data
string_1 BYTE "H0llo",0
string_2 BYTE "#",0
string_3 BYTE 0

.code
main PROC
	call Clrscr

	INVOKE Str_lengthmy,ADDR string_1
	call DumpRegs
	INVOKE Str_lengthmy,ADDR string_2
	call DumpRegs
	INVOKE Str_lengthmy,ADDR string_3
	call DumpRegs

	exit
main ENDP
;---------------------------------------------------------
Str_lengthmy PROC USES edi,
	pString:PTR BYTE	; pointer to string
;
; Return the length of a null-terminated string.
; Receives: pString - pointer to a string
; Returns: EAX = string length
;---------------------------------------------------------
	mov edi,pString
	mov eax,0     	                ; character count
L1:
	cmp BYTE PTR [edi],0	      ; end of string?
	je  L2	                     ; yes: quit
	inc edi	                     ; no: point to next
	inc eax	                     ; add 1 to count
	jmp L1
L2: ret
Str_lengthmy ENDP

;-----------------------------------------------------------
END main
