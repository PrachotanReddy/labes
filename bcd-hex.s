	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
      DCD  0x10001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
      ALIGN
N1 dcd 0x99999999		
	AREA mydata, DATA, READWRITE
dst DCD 0
      AREA mycode, CODE, READONLY
      ENTRY
      EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =N1       ; Load address of SRC into R0
	ldr r1, =dst
    ldr r2, [r0]
	mov r3, #1
	mov r4, #0xa
	mov r5, #0
	mov r7, #0xf
up	mov r6, r2
	and r6, r7
	mla r5, r6, r3, r5
	mul r3, r4
	lsr r2, #4
	cmp r2, #0
	bne up
	
	str r5, [r1]
STOP

	B STOP          ; Be there
 
	END