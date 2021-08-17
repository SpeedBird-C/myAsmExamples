TITLE 3.8.1 Вычитание трех целых чисел
; вычитаются три 16-разрядных числа и используются только рег процессора
; 3 16-bit numbers should be computed using only registers
INCLUDE Irvine32.inc
 
 .code
 main PROC
    COMMENT !
     mov eax,0e860h
     mov ebx,000ECh
     mov edx,0E001h
     sub eax,ebx
     sub eax,edx
     !
     ; теперь 16 ричными регистрами - now 16 bit 
     mov eax,0h
     mov ax,100h
     sub ax,50h
     sub ax,25h
     call DumpRegs
 exit
 main ENDP
 END main
