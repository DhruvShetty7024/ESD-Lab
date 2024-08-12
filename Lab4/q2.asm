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
    LDR R0, =bcd         ; Load the address of the BCD number into R0
    LDRB R1, [R0]        ; Load the BCD number into R1 (only the lower 8 bits)

    ; Extract the tens and ones place
    MOV R2, R1, LSR #4   ; Extract the tens digit (upper nibble)
    AND R2, R2, #0xF     ; Mask the upper bits, keeping only the lower nibble
    AND R3, R1, #0xF     ; Extract the ones digit (lower nibble)

    ; Convert the BCD digits to their decimal equivalent
    MOV R4, #10          ; Load 10 into R4 for multiplication
    MUL R2, R2, R4       ; Multiply the tens digit by 10
    ADD R4, R2, R3       ; Add the ones digit to the result

    ; R4 now contains the equivalent hexadecimal value of the BCD number
    STR R4, [R0, #4]     ; Store the result in the memory location (hex_result)

    ; Infinite loop to stop execution
STOP
    B STOP

    ALIGN
bcd         DCB 0x15    ; Example BCD number 0x45 (which represents the decimal number 45)
hex_result  DCD 0        ; Placeholder to store the hexadecimal result

    END

