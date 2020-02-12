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
	LDR r0, =SRC
	LDR r5, =DST
	LDR r1, =0
	MOV r3, #10
UP
	MOV r4, #0
	LDR r2, [r0], #4
	ADDS r1, r4
	ADC r4,#0
	ADDS r1,r2
	ADC r4,#0
	subs r3,#1
	BNE UP
	STR r4,[r5]
	str r1,[r5,#4]
here

 B here
SRC DCD 1,2,1,1,1,1,1,1,1,1

	AREA MyData, DATA, READWRITE
DST DCD 0