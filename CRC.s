main:
	movi r2, 0b01101100 #Dado de 32 bits 11011110
	movi r3, 0b1011 #Polinômio
	movi r4, 0 # Contador  
	movi r5, 3 # Constante
	movi r6, 1 # auxiliar para verificar se bit mais significativo é 1
	
	slli r6, r6, 31 # Move o bit 1 para ser o mais significativo
	slli r3, r3, 28 # Movendo o polinômio para os bits mais significativos

loop:
	# rotacionar até encontrar  bit 1
	# (loop qtd de bits dados) - 1
		# (loop2 qtd de bits polinomio) - 1
	blt r4, r5, deslocaDado
	movi r5, 31 # n-1 bits 
 loop2:
	blt r4, r5, deslocaPolinomio
	
	br end
	
deslocaDado: 
	addi r4, r4, 1 # atualiza o contador
	blt r2, r0, calcular # bit mais significativo é zero?
	slli r2, r2, 1
	
	br loop	
	
calcular:	
	xor r2, r2, r3
	slli r2, r2, 1 # rotaciona dados
	
	br loop
	
deslocaPolinomio:
	addi r4, r4, 1 # atualiza o contador
	and r1, r2, r6 # verifica se o bit mais significativo é 1
	beq r1, r0, calcular2 
	xor r2, r2, r3
	srli r3, r3, 1
	srli r6, r6, 1
	  
	br loop2
	
calcular2:
	srli r3, r3, 1 # rotaciona polinomio
	srli r6, r6, 1 # rotacionar auxiliar 
	
	br loop2
	
end:
	.end
