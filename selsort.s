 ;Write an assembly program to sort an array using selection sort

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
		LDR R0,= dst
l2		mov r1, r0				; r1 as i
		mov r3, r0
		add r3, #4				; r3 as j=i+1
		add r10, r9, #1			; counter for i
l1		ldr r4, [r3]
		ldr r7, [r1]			; load from mem
		cmp r4, r7
		bcs up					; if larger skip updating i
		mov r1, r3
up		add r3, #4				; update the pointer j
		add r10, #1				; inc counter
		cmp r10, #5			;counter for j
		bne l1
		ldr r2, [r0]
		ldr r6, [r1]			; load data for swapping
		str r2, [r1]
		str r6, [r0]			;swap and store
		add r0, #4
		add r9, #1
		cmp r9, #4			; counter for j
		bne l2
		 		
HERE  	B HERE		; STAY HERE
		AREA mydata, DATA, READWRITE
dst		DCD 0, 0, 0, 0, 0
		end
	 
	