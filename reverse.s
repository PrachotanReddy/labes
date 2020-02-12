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
	LDR R0, =SRC
	MOV R6, #10
	LDR R4, =1
	
st

	STR r4, [r0]
	ADD r4, #1
	ADD r0, #4
	SUBS r6, #1
	BNE st
	
	LDR R0, =SRC        ; Load address of SRC into R0
	LDR R1, =SRC         
	ADD R1, #36          ; 	R1 points to last data
	mov r5, #5	         ;	counter
up	ldr r2, [r0]
	ldr r3, [r1]
	str r2, [r1], #-4
	str r3, [r0], #4
	subs r5, #1
	bne up
STOP
	B STOP          ; Be there

	AREA mydata, DATA, READWRITE
SRC DCD 0		 
	END