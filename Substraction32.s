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
	LDR r0,N1
	LDR r1,N2
	LDR r3,=DST
	MOV r5,#0
	subs r4,r0,r1
	adc r5,#0
	str r4,[r3]
	str r5, [r3, #4]
here
	B here
N1 DCD 25
N2 DCD 30

	AREA MyData, DATA, READWRITE
DST DCD 0