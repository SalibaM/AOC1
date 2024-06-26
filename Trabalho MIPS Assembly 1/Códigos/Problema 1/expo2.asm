# P1 - potencia��o, fragmento 2

	.data					# declarando as vari�veis
x:      .word 	3         			# defina o valor de x aqui
n:      .word 	4         			# defina o valor de n aqui
result: .word 	1         			# resultado inicializado com 1 (fator nulo da multiplica��o)

	.text
	.globl expo2
expo2:
    	la 	$t0, x				# carrega x no registrador
    	lw 	$t0, x
    	la 	$t1, n				# carrega n no registrador
    	lw 	$t1, n
    	la 	$t2, result			# carrega result no registrador
    	lw 	$t2, result

loop:
    	beq 	$t1, $zero, fimloop   		# if (n == 0) saia do loop
    	andi 	$t3, $t1, 1          		# if ($t1 == 1) $t1 � �mpar, t3 recebe 1
    	bnez 	$t3, impar           		# se n � �mpar, jump para �mpar

par:						# n � par: eleva x ao quadrado
    	mul 	$t0, $t0, $t0         		# x *= x
    	srl 	$t1, $t1, 1           		# n /= 2 (deslocamento l�gico para a direita)
    	j 	loop				# volta para a fun��o loop

impar:						# n � �mpar: multiplica result por x, eleva x ao quadrado
    	mul 	$t2, $t2, $t0         		# result *= x
    	mul 	$t0, $t0, $t0         		# x *= x
    	srl 	$t1, $t1, 1           		# n /= 2 (deslocamento l�gico para a direita)
    	j 	loop				# volta para a fun��o loop

fimloop:
    	li 	$v0, 1           		# imprime um inteiro (syscall)
    	move 	$a0, $t2      			# move o resultado para o argumento de impress�o
    	syscall             			
    	
	li 	$v0, 10          		# encerra o programa (syscall)
    	syscall