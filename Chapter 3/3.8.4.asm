TITLE      (.asm)

; Write a program that defines symbolic names for several string literals (characters between
;quotes). Use each symbolic name in a variable definition.

INCLUDE Irvine32.inc
	exampleText EQU <"This is an example">
	someText TEXTEQU <"This is\
		my example"> 

.data
text BYTE someText
text2 BYTE exampleText



.code
main PROC

	mov al,text
	call DumpRegs





	exit
main ENDP
END main