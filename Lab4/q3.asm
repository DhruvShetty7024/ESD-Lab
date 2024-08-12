    AREA RESET, DATA, READONLY
    EXPORT __Vectors

__Vectors
    DCD 0x10001000       ; Stack pointer value (stack is empty)
    DCD Reset_Handler    ; Reset vector

    ALIGN

    AREA mycode, CODE, READONLY
    ENTRY
    EXPORT Reset_Handler

Reset_Handler
    ; Load the address of the hex number into R0
    LDR R0, =hex_number  ; Load the address of the hex number into R0
    LDR R1, [R0]         ; Load the hex number into R1

    ; Convert the hexadecimal number to BCD
    MOV R2, R1           ; Copy the number to R2
    MOV R3, R2, LSR #4   ; Extract the high nibble (tens digit)
    AND R3, R3, #0x0F    ; Mask the high nibble to get the BCD value
    ADD R3, R3, #0x30    ; Convert to ASCII (BCD digit)
    STRB R3, [R0, #4]    ; Store the high nibble BCD result at the address of `bcd_result`

    AND R2, R1, #0x0F    ; Extract the low nibble (ones digit)
    ADD R2, R2, #0x30    ; Convert to ASCII (BCD digit)
    STRB R2, [R0, #5]    ; Store the low nibble BCD result at the address of `bcd_result + 1`

    ; Infinite loop to stop execution
STOP
    B STOP

hex_number  DCD 0xF     ; Example hexadecimal number (0x2A)
bcd         DCD 0,0      ; Reserve 2 bytes for BCD result

    END


