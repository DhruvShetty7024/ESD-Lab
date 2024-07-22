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
	MOV R0 , #0x10;numonics or instructions or opcore-operational core and end part is adressing mode-#0x123
	MOV R1 , #10
	ADD R2 , #33
	ADD R2 , R1
	LDR R4 , =0X22222222
STOP
	B STOP
NUM EQU 10
SRC DCD 8, 0X123456 ,34567891
	END
	