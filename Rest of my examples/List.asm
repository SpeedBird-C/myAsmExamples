TITLE Creating a Linked List            (List.asm)

; This program shows how the STRUC directive
; and the REPT directive can be combined to
; create a linked list at assembly time.
; Last update: 11/8/02

INCLUDE Irvine32.inc

ListNode STRUCT
  NodeData DWORD ?
  NextPtr  DWORD ?
ListNode ENDS

TotalNodeCount = 5
NULL = 0
Counter = 0

.data
LinkedList LABEL PTR ListNode
REPT TotalNodeCount
	Counter = Counter + 1
	ListNode <Counter, ($ + Counter * SIZEOF ListNode)>
ENDM
ListNode <0,0>	; tail node

.code
main PROC
	mov  esi,OFFSET LinkedList

; Display the integers in the NodeData members.
NextNode:
	; Check for the tail node.
	mov  eax,(ListNode PTR [esi]).NextPtr
	cmp  eax,NULL
	je   quit

	; Display the node data.
	mov  eax,(ListNode PTR [esi]).NodeData
	call WriteDec
	call Crlf

	; Get pointer to next node.
	mov  esi,(ListNode PTR [esi]).NextPtr
	jmp  NextNode

quit:
	exit
main ENDP
END main