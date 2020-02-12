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
	LDR R6, =RESULT	  
	MOV R2, #00
	LDR R0, =VALUE1	 
	LDR R1,[R0]		 
up	cmp  R1, #0xa		   
    bcc store        
	sub r1, #0xa       
	ADD R2, #01		 		
	B up
store	strb r1, [r6], #1
		mov  r1, r2
		mov r2, #0
		cmp r1, #0xa
		bcs up
        strb r1, [r6]
		mov r3, r6
		ldr r2, =packed
		ldr r6, =RESULT
		sub r4, r3, r6
up1		ldrb r0, [r6], #1
		ldrb r1, [r6], #1
		lsl r1, #4
		orr r1, r0
		strb r1, [r2], #1
		sub r4, #1
		cmp r4, #2
		bcs up1
stop
	B stop
VALUE1 DCD 0xffff	 
	AREA data, DATA, READWRITE
RESULT DCD 0,0,0,0,0,0,0,0,0,0
packed dcd 0
	end
