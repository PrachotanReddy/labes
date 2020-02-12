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
	LDR R6, =RESULT	;Quotient 
	MOV R2,#00
	LDR R0, =VALUE1	;pointer to the first value1
	LDR R1,[R0]		;load the first value into r1
	LDR R0,=VALUE2	;pointer to the second value
	LDR R3, [R0]		;load  second number into r3
up	cmp  R1, R3		;compare two numbers  
    bcc store       ; branch if r1 lower 
	sub r1, r3      ;Subtract if r1 greater or equal
	ADD R2,#01		;increment a counter 		
	B up		 
store	STR R2,[R6,#4]
	STR R1,[R6]		;Store remainder.
STOP
	B STOP
VALUE1 DCD 0x20000000	;First 32 bit number
VALUE2 DCD 0x5000	;Second 16 bit number 
	AREA data, DATA, READWRITE
RESULT DCD 0,0
