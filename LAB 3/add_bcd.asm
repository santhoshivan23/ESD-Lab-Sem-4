	AREA RESET, DATA, READONLY
	EXPORT __Vectors

__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	LDR R0,= SRC
	LDR R1,= DST
	LDR R8,= TMP
	LDR R9,= RES
	
	LDR R2, [R0], #4
	LDR R3, [R0]
	ADDS R4, R2, R3
	ADC R5, #0
	STR R4, [R1], #4
	STR R5, [R1]
	SUB R1, #4
	
	LDRB R2, [R1], #1
	MUL R2, #10
	STR R2, [R8]
	LDRB R2, [R8], #1
	LDRB R3, [R8]
	CMP R2, #0x00
	MOVEQ R4, #0000
	CMP R2, #0x01
	MOVEQ R4, #0001
	CMP R2, #0x02
	MOVEQ R4, #0010
	CMP R2, #0x03
	MOVEQ R4, #0011
	CMP R2, #0x04
	MOVEQ R4, #0100
	CMP R2, #0x05
	MOVEQ R4, #0101
	CMP R2, #0x06
	MOVEQ R4, #0110
	CMP R2, #0x07
	MOVEQ R4, #0111
	
	
SRC DCD 0X12344321, 0X56788765
	AREA DATASEG, DATA, READWRITE
DST DCD 0, 0
DST TEMP 0
DST RES 0, 0
	END