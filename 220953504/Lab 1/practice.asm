	AREA RESET , DATA, READONLY;the code should be savedin RAM
	EXPORT __Vectors	
	
__Vectors
	DCD 0X10001000 ;stack pointer value stack is empty
	DCD Reset_Handler ;reset vector
	ALIGN
	AREA mycode , CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler ;till here info given to compiler
	MOV R0 , #0X10;numonics or instructions or opcore-operational core
	MOV R1 , #2_1010
	MOV R3 , #-2
	MOV R4 , #3_1010;3_ means till base 3
	MOV R5 , #0XFFFF
	LDR R6 , =0XFFFFF
STOP
	B STOP
NUM EQU 10
SRC DCD 8, 0X123456 ,34567891
	END
	