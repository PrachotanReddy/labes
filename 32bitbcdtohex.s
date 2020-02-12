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
up	cmp  R1, #16		   
    bcc store        
	sub r1, #16       
	ADD R2, #01		 		
	B up
store	str r2,[r6],#4
		cmp r2, #16
		bcc stop
		b up
stop
	B stop
VALUE1 DCD 0x52	 
	AREA data, DATA, READWRITE
RESULT DCD 0
	end
