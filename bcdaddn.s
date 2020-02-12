	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
      DCD  0x10001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
      ALIGN
N1 dcd 0x00999999	
N2 dcd 0x19999999	
	AREA mydata, DATA, READWRITE
dst DCD 0
      AREA mycode, CODE, READONLY
      ENTRY
      EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =N1       ; Load address of SRC into R0
	ldr r2, [r0]
	LDR r0, =N2
	ldr r3, [r0]
	ldr r0, =dst
	mov r5, #8
	mov r6, #0
	mov r9, #0xf
	mov r4, #0
up	mov r1, #0
	mov r7, r2
	mov r8, r3
	and r7, r9
	lsr r7, r4
	add r7, r6
	mov r6, #0
	and r8, r9
	lsr r8, r4
	bl addn
	add r1, #4
	add r4, #4
	lsl r9, r1
	subs r5, #1
	bne up
	strb r6, [r0]
STOP
	B STOP          ; Be there
addn	adds r7, r8
		cmp  R7, #0xa		   
		bcc store        
		sub r7, #0xa       
		ADD R6, #01		 		
store	strb r7, [r0], #1
        bx lr 
	END