TITLE Boolean Calculator      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data
CaseTable	BYTE '1'
		DWORD AND_func
Sizeofone=($-CaseTable)
		BYTE '2'
		DWORD OR_func
		
		BYTE '3'
		DWORD NOT_func

		BYTE '4'
		DWORD XOR_func

		BYTE '5'
		DWORD Exit_func
AmoutOfFuncs=($-CaseTable)/Sizeofone
Hellomsg		BYTE		0dh,0ah,"1. x AND y",0dh,0ah
			BYTE		"2. x OR y",0dh,0ah
			BYTE		"3. NOT y",0dh,0ah
			BYTE		"4. x XOR y",0dh,0ah
			BYTE		"5. Exit",0dh,0ah,0

msgAND		BYTE		"AND proc",0dh,0ah,0
msgOR		BYTE		"OR proc",0dh,0ah,0
msgNOT		BYTE		"NOT proc",0dh,0ah,0
msgXOR		BYTE		"XOR proc",0dh,0ah,0
msgEXIT		BYTE		"EXIT proc",0dh,0ah,0

askf			BYTE		"Enter first num",0dh,0ah,0
asks			BYTE		"Enter second num",0dh,0ah,0


.code
main PROC
	mov edx,OFFSET Hellomsg
	mov esi,OFFSET CaseTable
	
L1:
	;call ClrScr
	call WriteString
	call ReadChar; int al
	call CrLf
	call ChooseFunction
	jc finish
jmp L1




finish:
	exit
main ENDP
AND_func PROC
	mov edx,OFFSET msgAND
	call WriteString
	
	mov edx,OFFSET askf
	call WriteString
	call ReadHex; in eax
	mov ebx,eax; first value

	mov edx,OFFSET asks
	call WriteString
	call ReadHex; eax - second value
	
	mov edx,ebx ; теперь edx - это значение первого
	mov ebx,eax ; теперь ebx - это значение второго 
	mov eax,edx ; теперь eax -это значение первого


	AND eax,ebx

	call WriteHex

	ret
AND_func ENDP

OR_func PROC
	mov edx,OFFSET msgOR
	call WriteString


	mov edx,OFFSET askf
	call WriteString
	call ReadHex; in eax
	mov ebx,eax; first value

	mov edx,OFFSET asks
	call WriteString
	call ReadHex; eax - second value
	
	mov edx,ebx ; теперь edx - это значение первого
	mov ebx,eax ; теперь ebx - это значение второго 
	mov eax,edx ; теперь eax -это значение первого


	OR eax,ebx

	call WriteHex

	ret
OR_func ENDP


NOT_func PROC
	mov edx,OFFSET msgNOT
	call WriteString


	mov edx,OFFSET askf
	call WriteString
	call ReadHex; in eax

	NOT eax

	call WriteHex

	ret
NOT_func ENDP


XOR_func PROC
	mov edx,OFFSET msgXOR
	call WriteString




	mov edx,OFFSET askf
	call WriteString
	call ReadHex; in eax
	mov ebx,eax; first value

	mov edx,OFFSET asks
	call WriteString
	call ReadHex; eax - second value
	
	mov edx,ebx ; теперь edx - это значение первого
	mov ebx,eax ; теперь ebx - это значение второго 
	mov eax,edx ; теперь eax -это значение первого


	XOR eax,ebx

	call WriteHex


	ret
XOR_func ENDP

Exit_func PROC
	mov edx,OFFSET msgEXIT
	call WriteString

	stc	; CF = 1


	ret
Exit_func ENDP



ChooseFunction PROC
push edx
push esi
mov ecx,AmoutOfFuncs
cycle:
		cmp [esi],al
		jne	again
		call NEAR PTR [esi+1]
		jmp fin
	again:
		add esi,Sizeofone
loop cycle
fin:
pop esi
pop edx
	
ret
ChooseFunction ENDP

END main