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
	LDR R1, =DST
	MOV r3, #10
	
UP
	LDR r4, [r0], #4
	STR r4, [r1], #4
	subs r3, #1
	bne UP
Stop
	B Stop
SRC DCD 1,2,3,4,5,6,7,8,9,10

	AREA Mydata, DATA, READWRITE
DST DCD 0
	END