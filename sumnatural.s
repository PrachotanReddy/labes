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
	LDR R0, =src 
	ldr r1, =dst
	mov r2, #0
	ldr r3, [r0]
	mla r2, r3, r3, r3
	lsr r2, #1
	str r2, [r1]
STOP
	B STOP          ; Be there
src dcd 5
	AREA mydata, DATA, READWRITE
dst DCD 0		 
	END