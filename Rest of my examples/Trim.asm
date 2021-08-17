TITLE Trim Trailing Characters             (Trim.asm)

; Test the Trim procedure. Trim removes trailing all
; occurrences of a selected character from the end of
; a string.
; Last update: 11/24/01

INCLUDE Irvine32.inc

Str_trim9 PROTO,
	pString:PTR BYTE,		; points to string
	char:BYTE		; character to remove

Str_length PROTO,
	pString:PTR BYTE		; pointer to string

ShowString PROTO,
	pString:PTR BYTE

.data
; Test data:
string_1 BYTE 0		; case 1
string_2 BYTE "#",0		; case 2
string_3 BYTE "Hello###",0		; case 3
string_4 BYTE "Hello",0		; case 4
string_5 BYTE "H#",0		; case 5
string_6 BYTE "#H",0		; case 6

.code
main PROC
	call Clrscr

	;INVOKE Str_trim9,ADDR string_1,'#'
	;INVOKE ShowString,ADDR string_1

	;INVOKE Str_trim9,ADDR string_2,'#'
	;INVOKE ShowString,ADDR string_2

	INVOKE Str_trim9,ADDR string_3,'#'
	INVOKE ShowString,ADDR string_3

	INVOKE Str_trim9,ADDR string_4,'#'
	INVOKE ShowString,ADDR string_4

	INVOKE Str_trim9,ADDR string_5,'#'
	INVOKE ShowString,ADDR string_5

	INVOKE Str_trim9,ADDR string_6,'#'
	INVOKE ShowString,ADDR string_6

	exit
main ENDP

;-----------------------------------------------------------
ShowString PROC USES edx, pString:PTR BYTE
; Display a string surrounded by brackets.
;-----------------------------------------------------------
.data
lbracket BYTE "[",0
rbracket BYTE "]",0
.code
	mov  edx,OFFSET lbracket
	call WriteString
	mov  edx,pString
	call WriteString
	mov  edx,OFFSET rbracket
	call WriteString
	call Crlf
	ret
ShowString ENDP
;-----------------------------------------------------------
Str_trim9 PROC USES eax ecx edi,
	pString:PTR BYTE,		; points to string
	char:BYTE		; char to remove
;
; Remove all occurences of a given character from
; the end of a string.
; Returns: nothing
; Last update: 1/18/02
;-----------------------------------------------------------
	mov  edi,pString
	INVOKE Str_length,edi		; returns length in EAX
	cmp  eax,0		; zero-length string?
	je   L2		; yes: exit
	mov  ecx,eax		; no: counter = string length
	dec  eax
	add  edi,eax		; EDI points to last char
	mov  al,char		; char to trim
	std		; direction = reverse
	repe scasb		; skip past trim character
	jne  L1		; removed first character?
	dec  edi		; adjust EDI: ZF=1 && ECX=0
L1:	mov  BYTE PTR [edi+2],0		; insert null byte
L2:	ret
Str_trim9 ENDP
END main