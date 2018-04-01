.data
memoria: .word 1, 25, 0

.text
.global main

main:
	movia r2, memoria
	ldw r3, 0(r2)
	ldw r4, 4(r2)
	add r5, r3, r4
	stw r5, 8(r2)
	ldw r6, 8(r2)
end:
	br end
	.end
