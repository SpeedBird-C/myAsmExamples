TITLE   GSD   (.asm)

; This program looks for GSD of 2 integers
; Last update:

INCLUDE Irvine32.inc
INCLUDE Macros.inc

.data
val1 DWORD ?
val2 DWORD ?
GCD DWORD ?
.code
main PROC
	
	mWrite <"Enter firts num ",0dh,0ah> 
	call ReadInt
	mov ebx,eax
	mWrite <"Enter second num ",0dh,0ah>
	call ReadInt
	;ebx	- first
	;eax - second
	mov edx,ebx ;теперь edx это первый
	mov ebx,eax ; 
	mov eax,edx
	
	call myGCD
	mWrite <"GCD is ">
	call WriteDec

	exit
main ENDP

myGCD PROC
	

	cmp ebx,0
	jb MakePositive
	cmp eax,0
	jb MakePOs2
	jmp continue
MakePositive:
			neg ebx
MakePOs2: 
			neg eax

continue:
mov edx,0
	L1:
		mov edx,0
		div ebx
		mov eax,ebx
		mov ebx,edx
		;push edx
	cmp ebx,0
	ja	L1 
	

	
	ret
myGCD ENDP


END main