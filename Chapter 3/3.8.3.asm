TITLE 3.8.3 Символические целые константы (Symbolic Integer Constants)     (.asm)

;  Write a program that defines symbolic constants for all of the days of the week. Create an array
;variable that uses the symbols as initializers

INCLUDE Irvine32.inc
	Mon=1
	Tue=2
	Wed=3
	Thur=4
	Fri=5
	Sat=6
	Sun=7
.data
	
	ListWeek BYTE Mon,Tue,Wed,Thur,Fri,Sat,Sun
	ListWeekSize=($-ListWeek)

.code
main PROC






	exit
main ENDP
END main