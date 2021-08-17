TITLE  test    (.asm)

; This program from 4.4.5
; Last update: 2021

INCLUDE Irvine32.inc
.data
	;myDouble DWORD 12345678h

	myBytes BYTE 10h,20h,30h,40h
	myWords WORD 8Ah,3Bh,72h,44h,66h
	myDoubles DWORD 1,2,3,4,5
	myPointer DWORD myDoubles

	
.code
main PROC
	;mov ax,WORD PTR myDouble+2
	;mov al,BYTE PTR myDouble+2
	;mov ah,BYTE PTR myDouble+2
	;mov eax,DWORD PTR myDouble
	;----
	;mov esi,OFFSET myBytes
	;mov ax,WORD PTR [esi]	  ; AX=1020 2010
	;mov eax, DWORD PTR myWords ; EAX=10 20 30 40
	

	mov esi,myPointer
	mov  ax,WORD PTR [esi+2]
	mov  ax,WORD PTR [esi+6]
	mov  ax,WORD PTR [esi-4]



	exit
main ENDP
END main