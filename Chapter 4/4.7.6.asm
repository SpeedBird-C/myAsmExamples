TITLE  Fibonacci Numbers    (.asm)

;  Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence,
;described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n-1)+Fib(n-2). Place
;each value in the EAX register and display it with a call DumpRegs statement (see Section 3.2)
;inside the loop


INCLUDE Irvine32.inc
.data
	val1 DWORD 1
	val2 DWORD 1

.code
main PROC
	mov eax,0
	mov ecx,7
L1:
	mov edx,eax 
	add eax,val1
	mov val1,edx
	
	call DumpRegs

	loop L1
	




	exit
main ENDP
END main