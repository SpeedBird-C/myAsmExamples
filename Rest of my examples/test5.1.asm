TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc

IntegerCount=3

.data
prompt1 BYTE "Enter int with sign: ",0
prompt2 BYTE "The sum is : ",0
array DWORD IntegerCount DUP(?)


.code
main PROC
	call ClrScr
	mov esi,OFFSET array
	mov ecx,IntegerCount
	call PromptForIntegers
	call ArraySum
	call DisplaySum
	exit
main ENDP

PromptForIntegers PROC
	pushad
	mov edx,OFFSET prompt1
L1:
	call WriteString
	call ReadInt
	mov [esi],eax
	add esi,4
	call CrLf
	
	loop L1

	popad
	ret

PromptForIntegers ENDP


ArraySum PROC
	push esi
	push ecx
	mov eax,0

L1:
	add eax,[esi]
	add esi,4

	loop L1

	pop ecx

	pop esi
	ret
ArraySum ENDP

DisplaySum PROC
	
	push edx

	mov edx,OFFSET prompt2
	call WriteString
	call WriteInt
	call CrLf

	pop edx
	ret
DisplaySum ENDP

END main