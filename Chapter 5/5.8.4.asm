TITLE 5.8.4              (.asm)

Comment !
Use the solution program from the preceding exercise as a starting point. Let this new program
repeat the same steps three times, using a loop. Clear the screen after each loop iteration.
!
INCLUDE Irvine32.inc

.data
val1 SDWORD ?
val2 SDWORD ?
str1 BYTE "Enter first integer:  ",0
str2 BYTE "Enter second integer: ",0
str3 BYTE "The sum is:           ",0

.code
main PROC
	call ClrScr
	mov ecx,3
	L1:
; Input the first integer
	mov  dh,10
	mov  dl,20
	call Gotoxy
	mov  edx,OFFSET str1
	call WriteString
	call ReadInt
	mov  val1,eax

; Input the second integer
	mov  dh,12
	mov  dl,20
	call Gotoxy
	mov  edx,OFFSET str2
	call WriteString
	call ReadInt

	add  eax,val1

; Display the sum
	mov  dh,14
	mov  dl,20
	call Gotoxy
	mov  edx,OFFSET str3
	call WriteString
	call WriteInt
	call Crlf
	call Crlf
	call ReadInt
	mov eax,0
	call ClrScr
	loop L1
	exit
main ENDP
END main