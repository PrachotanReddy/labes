	AREA    RESET, DATA, READONLY
    EXPORT  __Vectors

__Vectors 
      DCD  0x10001000     ; stack pointer value when stack is empty
      DCD  Reset_Handler  ; reset vector
      ALIGN
N1 dcd 0x9999	
N2 dcd 0x9999	
	AREA mydata, DATA, READWRITE
product dcd 0,0
temp dcd 0	
      AREA mycode, CODE, READONLY
      ENTRY
      EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =N1        
	ldr r2, [r0]
	bl bcd_hex
	mov r9, r5
	LDR r0, =N2
	ldr r2, [r0]
	bl bcd_hex
	mov r10, r5
	ldr r0, =product
	mul r9, r10
    bl hex_bcd	
	ldr r9, =temp
up2	ldr r12, [r9], #1
	ldr r11, [r9], #1
	lsl r11, #4
	orr r12, r11
	strb r12, [r0], #1
	subs r1, #1
	bne up2
STOP
	B STOP           
bcd_hex	mov r3, #1
	mov r4, #0xa
	mov r5, #0
	mov r7, #0xf
up	mov r6, r2
	and r6, r7
	mla r5, r6, r3, r5
	mul r3, r4
	lsr r2, #4
	cmp r2, #0
	bne up
	bx lr
hex_bcd
	mov r8, #0
	ldr r1, =temp
up1	cmp R9, #0xa		   
    bcc store        
	sub r9, #0xa       
	ADD R8, #01		 		
	B up1
store	
		strb r9, [r1], #1
		mov  r9, r8
		mov r8, #0
		cmp r9, #0xa
		bcs up1
        strb r9, [r1]
		ldr r8, =temp
		sub r1, r8
		bx lr
	END