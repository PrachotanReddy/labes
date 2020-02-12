	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
      DCD  0x10001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
      ALIGN
      AREA mycode, CODE, READONLY
      ENTRY
      EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =N1       ; Load address of SRC into R0
	LDR r1, =N2
	ldr r2, [r0]
	ldr r3, [r1]
	ldr r4, =dst
	mov r5, #4
	mov r6, #0
up  adds r2, r6
	mov r6, #0
	adc r6, #0
	adds r2, r3
	adc r6, #0
	str r2, [r4], #4
	ldr r2, [r0, #4]!
	ldr r3, [r1, #4]!
	subs r5, #1
	bne up
	str r6, [r4]
STOP
	B STOP          ; Be there
N1 dcd 1,2, 3, 4	
N2 dcd 1,2,3,4	
	AREA mydata, DATA, READWRITE
dst DCD 0		 
	END