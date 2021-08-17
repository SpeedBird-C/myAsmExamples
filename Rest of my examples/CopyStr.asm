TITLE Copying Strings                    (CopyStr.asm)

; Testing the Str_copy procedure
; Last update: 9/8/01

INCLUDE Irvine32.inc

Str_copy1 PROTO,
 	source:PTR BYTE, 		; source string
 	target:PTR BYTE		; target string

Str_length PROTO,
	pString:PTR BYTE		; pointer to string

.data
string_1 BYTE "ABCDEFG",0
string_2 BYTE 100 DUP(?)

.code
main PROC
	call Clrscr

	INVOKE Str_copy1,	; copy string_1 to string_2
	  ADDR string_1,
	  ADDR string_2

	mov  edx,OFFSET string_2
	call WriteString
	call Crlf

	exit
main ENDP


;---------------------------------------------------------
Str_copy1 PROC USES eax ecx esi edi,
 	source:PTR BYTE, 		; source string
 	target:PTR BYTE		; target string
;
; Copy a string from source to target.
; Returns: nothing
; Requires: the target string must contain enough
; space to hold a copy of the source string.
;----------------------------------------------------------
	INVOKE Str_length,source 		; EAX = length source
	mov ecx,eax		               ; REP count
	inc ecx         		          ; add 1 for null byte
	mov esi,source
	mov edi,target
	cld               		          ; direction = up
	rep movsb      		          ; copy the string
	ret
Str_copy1 ENDP


;---------------------------------------------------------

END main
