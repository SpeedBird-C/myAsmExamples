TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
.data
	semaphore	WORD 11001010b
.code
main PROC
	movsx eax,semaphore
	call WriteBin

	BTS semaphore,6

	movsx eax,semaphore
	call CrLf
	call WriteBin


	exit
main ENDP
END main