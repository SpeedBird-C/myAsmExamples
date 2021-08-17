TITLE      (.asm)

; This program
; Last update:

INCLUDE Irvine32.inc
GetDateTime PROTO, pStartTime: PTR QWORD

.data
	startTime	QDWORD	?
.code
main PROC
	
	INVOKE GetDateTime,ADDR startTime





	exit
main ENDP
GetDateTime PROC,
	pStartTime:PTR QWORD
	LOCAL sysTime:SYSTEMTIME,flTime:FILETIME

	INVOKE GetLocalTime,ADDR systime

	INVOKE SystemTimeToFileTime,ADDR sysTime,ADDR flTime
	mov esi,pStartTime
	mov eax,flTime.loDateTime
	mov DWORD PTR [esi],eax

	mov	eax,flTime.hiDateTime
	mov	DWORD PTR [esi+4],eax
	ret
GetDateTime ENDP
END main