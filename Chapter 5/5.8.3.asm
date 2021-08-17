TITLE      (.asm)

;Write a program that clears the screen, locates the cursor near the middle of the screen, prompts
;the user for two integers, adds the integers, and displays their sum.

INCLUDE Irvine32.inc
.data
	prompt1 BYTE "Enter two numbers to sum ",0
	values DWORD 2 DUP(9)
.code
main PROC
	
	call ClrScr
	mov dh,10
	mov dl,40
	call GotoXY
	mov edx,OFFSET prompt1
	mov esi,OFFSET values
	mov ecx,LENGTHOF values
	call getNum
	call writeNum

	exit
main ENDP
	getNum PROC
		push edx
		push esi
		push ecx
		L1:
			call WriteString
			call ReadInt
			mov [esi],eax
			add esi,TYPE DWORD
			call CrLf
		loop L1
		pop ecx
		pop esi
		pop edx
		
		ret
	getNum ENDP


	writeNum PROC
		push edx
		push esi
		push ecx
		mov eax,0
		L1:
			add eax,[esi]
			add esi,TYPE DWORD
		loop L1

		pop ecx
		pop esi
		pop edx
		call WriteInt
		ret
	writeNum ENDP



END main