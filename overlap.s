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
	
	LDR R0, =SRC        ; Load address of SRC into R0
	LDR r4, =1
	mov r6, #10
	mov r7, #5
	
st	str r4, [r0]
	add r4, #1
	add r0, #4
	subs r6, #1
	bne st
	
	
	add r1, #(size-1)*4 
up	ldr r2, [r0], #-4
	str r2, [r1], #-4
	subs r5, #1
	bne up
STOP
	B STOP          ; Be there
size equ 10	
ol   equ 2	
	AREA mydata, DATA, READWRITE
SRC DCD 0		 
	END