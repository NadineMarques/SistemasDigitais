main:
	movi r2, 0b00001000
	movi r3, 0b00001011
	
	
loop:
	addi r2, r2, 1
	xor r1, r2, r3
	bge r3, r2, loop
	
end:
	.end