	AREA    RESET, DATA, READONLY
     	EXPORT  __Vectors

__Vectors 
	DCD  0x40001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
  
    	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler
	ldr r0, =fib
	mov r1, #0
	mov r2, #1
	mov r3, #8
	strb r1, [r0], #1
up	strb r2, [r0], #1
	mov r4, r2
	add r2, r1
	mov r1, r4
	subs r3, #1
	bne up
STOP
	B STOP
	AREA data, DATA, READWRITE
fib DCD 0
	end
