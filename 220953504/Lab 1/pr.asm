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
	LDR R0, = SRC
	LDR R1,[R0]
	LDR R2,[R0,#4]
STOP
	B STOP
NUM EQU 10
SRC DCD 8, 0X123456 ,34567891
	END
	