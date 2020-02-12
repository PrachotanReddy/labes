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
store	add r1, #0x30
		strb r1, [r6], #1
		mov  r1, r2
		mov r2, #0
		cmp r1, #0xa
		bcs up
		add r1, #0x30
        strb r1, [r6]
stop
	B stop
VALUE1 DCD 0xf	 
	AREA data, DATA, READWRITE
RESULT DCD 0
	end
