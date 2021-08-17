TITLE Comparing Strings                    (Compare.asm)

; This program tests the Str_compare procedure,
; which compares two null-terminated strings.
; Last update: 9/7/01

INCLUDE Irvine32.inc

Str_compare1 PROTO,
	string1:PTR BYTE,
	string2:PTR BYTE

.data
string_1 BYTE "ABCDEFG",0
string_2 BYTE "ABCDEFG",0
string_3 BYTE	"YOTA",0		;0
string_4 BYTE	"YOTA",0		;0

.code
main PROC
	call Clrscr

	INVOKE Str_compare1,
	  ADDR string_3,
	  ADDR string_4
	Call DumpRegs

	exit
main ENDP
;----------------------------------------------------------
Str_compare1 PROC USES eax edx esi edi,
	string1:PTR BYTE,
	string2:PTR BYTE
;
; Compare two strings. Affects the Zero and Carry flags 
; exactly as they would be by the CMP instruction.
; Returns: nothing
;-----------------------------------------------------
    mov esi,string1
    mov edi,string2

L1: mov  al,[esi]
    mov  dl,[edi]
    cmp  al,0    		; end of string1?
    jne  L2      		; no
    cmp  dl,0    		; yes: end of string2?
    jne  L2      		; no
    jmp  L3      		; yes, exit with ZF = 1

L2: inc  esi      		; point to next
    inc  edi
    cmp  al,dl   		; chars equal?
    je   L1      		; yes: continue loop
                 		; no: exit with flags set
L3: ret
Str_compare1 ENDP


;---------------------------------------------------------
END main