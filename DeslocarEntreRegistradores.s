

.global main

main:
	movi r5, 32
	movia r2, 0b00111101 00000011 01100100 11101110 
	movia r3, 0b11100111 01011010 00101001 11110001 
	addi r4, r0, 0
	br for

for:
	br deslocar
	addi r4, r4, 1 
	beq r4, r5, end
	br for
	
deslocar:
	slli r2, r2, 1
	ble r3, r0, colocaUm
	slli r3, r3, 1
	
colocaUm:
	addi r2, r2, 1
	slli r3, r3, 1
	br for

end:
	.end 
