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
LCM_Handler
    LDR R0, =a          ; Load the address of the first number (a)
    LDR R1, =b          ; Load the address of the second number (b)
    LDR R2, [R0]        ; Load the value of a into R2
    LDR R3, [R1]        ; Load the value of b into R3
    MOV R4, #1          ; Initialize i = 1

LCM_Loop
    MUL R5, R4, R2      ; Compute i * a
    MOV R6, R5          ; Move the product to R6
    UDIV R7, R6, R3     ; Divide (i * a) by b, result in R7
    MLS R8, R7, R3, R6  ; Compute remainder = (i * a) - (quotient * b)
    CMP R8, #0          ; Compare remainder with 0
    BEQ LCM_Found       ; If remainder == 0, LCM is found, exit loop

    ADD R4, R4, #1      ; Increment i
    B LCM_Loop          ; Repeat the loop

LCM_Found
    STR R5, [R0, #4]    ; Store LCM (i * a) at memory location (LCM)
    B STOP              ; Infinite loop to stop execution

STOP
    B STOP

; Define the numbers a and b
    AREA mydata, DATA, READWRITE
a   DCD 12              ; Example value for a
b   DCD 15              ; Example value for b
LCM DCD 0               ; Placeholder for storing the LCM result

    END
