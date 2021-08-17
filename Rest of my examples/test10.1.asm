TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc

mWrite	MACRO text
	LOCAL string
	.data 
		string BYTE text,0
	.code
	push edx
	mov edx,OFFSET string
	call WriteString
	pop edx
ENDM
mWriteLn MACRO text
	mWrite text
	call CrLf
ENDM
.data
	
.code
main PROC
	;mWrite "Enter name"
	;mWrite "Enter soname"
	mWriteLn "New"
	exit
main ENDP
END main