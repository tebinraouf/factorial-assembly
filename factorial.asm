TITLE MASM Template						(main.asm)

; Description:
; 
; Revision date:

INCLUDE Irvine32.inc
.data

readStr    DB    50 DUP(0)

.code 
main PROC
	call Clrscr

	push 5
	call factorialProc
	mov eax, ebx
	call writeint
	
	lea eax, readStr
	mov ecx,1
	call ReadChar ;pause screen
	
	exit

main ENDP

factorialProc PROC
	push ebp
	mov ebp, esp
	mov eax, [ebp+8]
	cmp eax, 0
	jle zeroOneFactorial
	cmp eax, 1
	jle zeroOneFactorial
	dec eax
	cmp eax, 1	
	jle operation
	push eax
	call factorialProc
	operation:
		mov ebx, [ebp+8]
		mul ebx
		cmp ebx, 4
		mov ebx, eax
		pop ebp
		ret 4
	zeroOneFactorial:
		pop ebp
		mov ebx, 1
		ret
factorialProc ENDP

END main



