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
	ldr r4, =dst
	mov r5, #4
	ldr r6, =0xffffffff
	msr xpsr, r6
	mov r8, #0
up  ldr r2, [r0], #4
	ldr r3, [r1], #4
	sbcs r7, r2, r3
	str r7, [r4], #4
	subs r5, 1
	bne up
	adc r8, #0
	str r8, [r4]
STOP
	B STOP          ; Be there
N1 dcd 6,7,0,1	
N2 dcd 6,7,0,1	
	AREA mydata, DATA, READWRITE
dst DCD 0		 
	END