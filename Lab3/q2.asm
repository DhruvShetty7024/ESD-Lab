	AREA	RESET , DATA , READONLY
	EXPORT __Vectors	
__Vectors
	DCD 0X10001000 ;stack pointer value stack is empty
	DCD Reset_Handler ;reset vector
	ALIGN
	AREA mycode , CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
    LDR R0, =num1       ; Load the address of the first 128-bit number into R0
    LDR R1, =num2       ; Load the address of the second 128-bit number into R1
    LDR R2, =result     ; Load the address to store the result into R2

    ; Initialize carry to 0
    MOV R3, #0          ; R3 will store the carry

    ; Add the lower 32-bit words
    LDR R4, [R0]        ; Load lower 32 bits of num1 into R4
    LDR R5, [R1]        ; Load lower 32 bits of num2 into R5
    ADDS R6, R4, R5     ; Add the lower 32-bit words with carry
    STR R6, [R2]        ; Store result in result[0]
    MOV R3, R6, ASR #31 ; Extract carry from the result (if any)

    ; Add the second 32-bit words
    LDR R4, [R0, #4]    ; Load the second 32 bits of num1 into R4
    LDR R5, [R1, #4]    ; Load the second 32 bits of num2 into R5
    ADCS R6, R4, R5     ; Add with carry
    STR R6, [R2, #4]    ; Store result in result[1]

    ; Add the third 32-bit words
    LDR R4, [R0, #8]    ; Load the third 32 bits of num1 into R4
    LDR R5, [R1, #8]    ; Load the third 32 bits of num2 into R5
    ADCS R6, R4, R5     ; Add with carry
    STR R6, [R2, #8]    ; Store result in result[2]

    ; Add the highest 32-bit words
    LDR R4, [R0, #12]   ; Load the highest 32 bits of num1 into R4
    LDR R5, [R1, #12]   ; Load the highest 32 bits of num2 into R5
    ADCS R6, R4, R5     ; Add with carry
    STR R6, [R2, #12]   ; Store result in result[3]

    ; Infinite loop to stop the processor
STOP
    B STOP

; Define the 128-bit numbers
num1
    DCD 0x12345678     
    DCD 0x23456789     
    DCD 0x34567890     
    DCD 0x45678901     

num2
    DCD 0x11111111     
    DCD 0x22222222     
    DCD 0x33333333     
    DCD 0x44444444     

	AREA mydata, DATA, READWRITE
result
    DCD 0, 0, 0, 0     ; Placeholder for result (4 x 32-bit words)

	END
