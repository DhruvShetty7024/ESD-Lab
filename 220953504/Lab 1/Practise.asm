	AREA	RESET , DATA READONLY
	EXPORT __Vectors	
__Vectors
	DCD 0X10001000 ;stack pointer value stack is empty
DCD Reset_Handler ;reset vector
	ALIGN
	AREA mycode , CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	MOV RO, #0x123
	MOV R1, #0123
	ADD R2, R1
	LDR R4, =0X22222222
STOP
	B STOP
NUM EQU 10
SRC DCD 8, 0X123456 ,34567891

	
