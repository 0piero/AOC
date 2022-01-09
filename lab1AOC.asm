	.data
dia:	.asciiz "Entre com o dia (DD): "
dia_invalido:	.asciiz "Dia invalido.\n"
mes:	.asciiz "Entre com o mes (MM): "
mes_invalido:	.asciiz "Mes invalido.\n"
ano:	.asciiz "Entre com o ano (AAAA): "
ano_invalido:	.asciiz "Ano invalido.\n"
linha:	.asciiz "\n"
saida:	.asciiz "Data Atual: "
bar:	.asciiz "/"	
	.text
	.globl main
main:
	li $v0,4
	la $a0,mes
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	
	while1:
		slti $t0,$s0,1
		slti $t1,$s0,13
		
		nor $t0,$t0,$t0
		and $t2,$t0,$t1
		
		bne $t2,$zero,read_dia
		
		li $v0,4
		la $a0,linha
		syscall
		
		li $v0,4
		la $a0,mes_invalido
		syscall
		
		li $v0,4
		la $a0,mes
		syscall
		
		li $v0,5 
		syscall
		move $s0,$v0
		
		j while1
		
	read_dia:
		li $v0,4
		la $a0,linha
		syscall
	
		li $v0,4
		la $a0,dia
		syscall
		
		li $v0,5
		syscall
		move $s1,$v0
		while2:
			slti $t0,$s1,1
			slti $t1,$s1,32
			
			nor $t0,$t0,$t0
			and $t2,$t0,$t1
			
			bne $t2,$zero,read_ano
			
			li $v0,4
			la $a0,linha
			syscall
			
			li $v0,4
			la $a0,dia_invalido
			syscall
		
			li $v0,4
			la $a0,dia
			syscall
		
			li $v0,5 
			syscall
			move $s1,$v0
		
			j while2
			
		read_ano:
			li $v0,4
			la $a0,linha
			syscall
			
			li $v0,4
			la $a0,ano
			syscall
		
			li $v0,5
			syscall
			move $s2,$v0
			while3:
				slti $t0,$s2,1980
				slti $t1,$s2,2051
				
				nor $t0,$t0,$t0
				and $t2,$t0,$t1
				
				bne $t2,$zero,output
				
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,ano_invalido
				syscall
		
				li $v0,4
				la $a0,ano
				syscall
		
				li $v0,5 
				syscall
				move $s2,$v0
		
				j while3
			
			output:
				li $v0,4
				la $a0,linha
				syscall
				
				li $t0,10
				li $t1,9
				li $t5,1
				
				slt $t2,$t1,$s0  #mes maior que 9
				slt $t3,$t1,$s1  #dia maior que 9 
				and $t4,$t2,$t3
				beq $t4,$t5,print
				
				slt $t2,$t1,$s0  #mes maior que 9 
				slt $t3,$s1,$t0  #dia menor que 10 
				and $t4,$t2,$t3
				beq $t5,$t4,print_0
				
				slt $t2,$s0,$t0  #mes menor que 10
				slt $t3,$t1,$s1  #dia maior que 9 
				and $t4,$t2,$t3
				beq $t4,$t5,print0_
				
				slt $t2,$s0,$t0  #mes menor que 10
				slt $t3,$s1,$t0  #dia menor que 10 
				and $t4,$t2,$t3
				beq $t4,$t5,print00
				
				
				
				
			print_0:
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,saida
				syscall
				
				li $v0,1
				la $a0,($s0)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($zero)
				syscall
				
				li $v0,1
				la $a0,($s1)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s2)
				syscall
				
				li $v0,10
				syscall
			print0_:
	      		li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,saida
				syscall
				
				li $v0,1
				la $a0,($zero)
				syscall
				
				li $v0,1
				la $a0,($s0)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s1)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s2)
				syscall
				
				li $v0,10
				syscall
			print00:
				li $v0,4
				la $a0,linha
				syscall
		
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,saida
				syscall
				
				li $v0,1
				la $a0,($zero)
				syscall
				
				li $v0,1
				la $a0,($s0)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($zero)
				syscall
				
				li $v0,1
				la $a0,($s1)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s2)
				syscall
				
				li $v0,10
				syscall
			print:
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,linha
				syscall
				
				li $v0,4
				la $a0,saida
				syscall
				
				li $v0,1
				la $a0,($s0)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s1)
				syscall
				
				li $v0,4
				la $a0,bar
				syscall
				
				li $v0,1
				la $a0,($s2)
				syscall
				
				li $v0,10
				syscall
				
				
				
		
		
		
	