TITLE ����������� ������     (.asm)
; Write a program that contains a definition of each data type

INCLUDE Irvine32.inc
.data
	value1 BYTE 9Bh
	value2 SBYTE 0B3h
	value3 WORD 40B3h
	value4 SWORD 0C0B3h

	value5 DWORD 4460C0B3h ;; ����������� 31 ���
	value6 DWORD 0C460C0B3h ;; ����������� 32 ���

	value7 SDWORD 8460C0B3h ;; �������� 32 ���
	value8 SDWORD 4460C0B3h ;; �������� 31 ���

	val7 QWORD 123456712345678h
	val8 TBYTE 1000000000123456789Ah
	val9 REAL4 -1.2





.code
main PROC
	

	exit
main ENDP
END main