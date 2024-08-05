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
    LDR R3, =borrow     ; Load the address to store the borrow value into R3

    ; Initialize borrow to 0
    MOV R4, #0          ; R4 will store the borrow

    ; Subtract the lowest 32-bit words
    LDR R5, [R0]        ; Load lower 32 bits of num1 into R5
    LDR R6, [R1]        ; Load lower 32 bits of num2 into R6
    SUBS R7, R5, R6     ; Subtract the lower 32-bit words with borrow
    STR R7, [R2]        ; Store result in result[0]
    MOV R4, R7, ASR #31 ; Extract borrow (bit 31 of R7) into R4

    ; Subtract the second 32-bit words
    LDR R5, [R0, #4]    ; Load the second 32 bits of num1 into R5
    LDR R6, [R1, #4]    ; Load the second 32 bits of num2 into R6
    SUBS R7, R5, R6     ; Subtract with borrow
    STR R7, [R2, #4]    ; Store result in result[1]
    MOV R4, R7, ASR #31 ; Extract borrow (bit 31 of R7) into R4

    ; Subtract the third 32-bit words
    LDR R5, [R0, #8]    ; Load the third 32 bits of num1 into R5
    LDR R6, [R1, #8]    ; Load the third 32 bits of num2 into R6
    SUBS R7, R5, R6     ; Subtract with borrow
    STR R7, [R2, #8]    ; Store result in result[2]
    MOV R4, R7, ASR #31 ; Extract borrow (bit 31 of R7) into R4

    ; Subtract the highest 32-bit words
    LDR R5, [R0, #12]   ; Load the highest 32 bits of num1 into R5
    LDR R6, [R1, #12]   ; Load the highest 32 bits of num2 into R6
    SUBS R7, R5, R6     ; Subtract with borrow
    STR R7, [R2, #12]   ; Store result in result[3]
    MOV R4, R7, ASR #31 ; Extract borrow (bit 31 of R7) into R4
    STR R4, [R3]        ; Store final borrow value

    ; Infinite loop to stop the processor
STOP
    B STOP

; Define the 128-bit numbers
num1
    DCD 0x12345678     ; num1[0]
    DCD 0x23456789     ; num1[1]
    DCD 0x34567890     ; num1[2]
    DCD 0x45678901     ; num1[3]

num2
    DCD 0x11111111     ; num2[0]
    DCD 0x22222222     ; num2[1]
    DCD 0x33333333     ; num2[2]
    DCD 0x44444444     ; num2[3]
	
	AREA mydata, DATA, READWRITE
result
    DCD 0, 0, 0, 0     ; Placeholder for result (4 x 32-bit words)

borrow
    DCD 0              ; Placeholder for borrow


	END
