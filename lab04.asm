.data

 	bem_vindo: .asciiz "Bem-vindo a Loja de Computadores Unifesp!"
 	categoria: .asciiz "Escolha a categoria de produtos: "
 	finalizar_compra: .asciiz "0. Finalizar compra"
  	processador: .asciiz "1. Processador"
  	mem_int: .asciiz "2. Memoria interna"
  	mem_ext: .asciiz "3. Memoria externa"
  	perif: .asciiz "4. Perifericos"
  	opcao: .asciiz "Digite a opcao desejada: "

  	processadores: .asciiz "Processadores: "
  	voltar: .asciiz "0. Voltar"
  	ryzen: .asciiz "1. AMD Ryzen 7 4.2GHz (R$2100,50)"
  	i9: .asciiz "2. Intel Core i9 5.2GHz (R$3800,00)"
  	modelo: .asciiz "Digite o numero do modelo do produto desejado: "

  	mem_int2: .asciiz "Memoria interna: "
  	corsair: .asciiz "1. DDR4 com 8GB Corsair (R$210,20)"
  	kingstone: .asciiz "2. DDR4 com 16GB Kingstone (R$550,00)"

  	mem_ext2: .asciiz "Memoria externa: "
  	seagate: .asciiz "1. HD de 2TB Seagate (R$390,00)"
	crucial: .asciiz "2. SSD de 1TB Crucial (R$705,00)"

	perif2: .asciiz "Perifericos: "
	mouse: .asciiz "1. Mouse Logitech (R$100,90)"
	ms: .asciiz "2. Teclado Microsoft (R$220,00)"

	qnt: .asciiz "Digite a quantidade: "

	pedido: .asciiz "Pedido: "
	val_unit: .asciiz "Valor unitario: "
	val_tot: .asciiz "Valor total: "
	x: .asciiz "x"
	val_total_pedido: .asciiz "Valor total do pedido: "
	reais: .asciiz "R$"

	ryzen2: .asciiz "AMD Ryzen 7 4.2GHz"
	i92: .asciiz "Intel Core i9 5.2GHz"
	corsair2: .asciiz "DDR4 com 8GB Corsair"
	kingstone2: .asciiz "DDR4 com 16GB Kingstone"
	seagate2: .asciiz "HD de 2TB Seagate"
	crucial2: .asciiz "SSD de 1TB Crucial"
	mouse2: .asciiz "Mouse Logitech"
	ms2: .asciiz "Teclado Microsoft"
	spc: .asciiz " "

	p1: .float 2100.50
	p2: .float 3800.00
	p3: .float 210.20
	p4: .float 550.00
	p5: .float 390.00
	p6: .float 705.00
	p7: .float 100.90
	p8: .float 220.00
	t: .float 0.00
  	line: .asciiz "\n"

  	array:
  		.align 2
  		.space 16
  	array2:
  		.align 2
  		.space 16

.text
.globl main

main:

  	li $v0, 4         
  	la $a0, bem_vindo     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall
main2:

  	li $v0, 4         
  	la $a0, categoria     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, finalizar_compra     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, processador     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, mem_int     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, mem_ext     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, perif     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, opcao     
  	syscall

  	li $v0, 5              
  	syscall
  	move $s0, $v0

  	li $t0, 0
  	li $t1, 1
  	li $t2, 2
  	li $t3, 3
  	li $t4, 4

  	beq $s0, $t0, finalizar
  	beq $s0, $t1, process
  	beq $s0, $t2, memoria_int
  	beq $s0, $t3, memoria_ext
  	beq $s0, $t4, perifericos

finalizar:
	li $v0, 4         
  	la $a0, pedido     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	lw $t1, array($zero)
  	or $t0, $s2, $t1
  	bne $t0, $zero, print_processor
  	continue1:
  		li $t4, 4
  		lw $t1, array($t4)
  		or $t0, $s4, $t1
  		bne $t0, $zero, print_mem_int
  	continue2:
  		li $t4, 8
  		lw $t1, array($t4)
  		or $t0, $s6, $t1
  		bne $t0, $zero, print_mem_ext
  	continue3: 
  		li $t4, 12
  		lw $t1, array($t4)
  		or $t0, $t9, $t1
  		bne $t0, $zero, print_perif
  	continue4:

  	li $v0, 4         
  	la $a0, val_total_pedido     
  	syscall

  	li $v0, 4         
  	la $a0, reais     
  	syscall

  	li $v0, 2         
  	lwc1 $f12, t     
  	syscall

  	li $v0, 10
  	syscall

print_processor:
	li $t0, 1
	li $t1, 2

	beq $s1, $t0, rz

	lw $t2, array2($zero)
	beq $t2, $t1, intel
	link1:

  		li $t1, 2
		lw $t2, array2($zero)
		beq $t2, $t1, intel

		j continue1
	rz: 
		li $v0, 1         
  		move $a0, $s2     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall	

		li $v0, 4         
  		la $a0, ryzen2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p1     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall 

  		lwc1 $f2, p1
  		mtc1 $s2, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j link1

  	intel:
  		lw $t2, array($zero)
  		
  		li $v0, 1 
  		move $a0, $t2     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall

  		li $v0, 4         
  		la $a0, i92     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		lwc1 $f2, p2
  		mtc1 $t2, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j continue1

print_mem_int:
	li $t0, 1
	li $t1, 2
	li $t3, 4
	beq $s3, $t0, crs

	lw $t2, array2($t3)
	beq $t2, $t1, kngs
	link2:

  		li $t1, 2
		lw $t2, array2($t3)
		beq $t2, $t1, kngs

		j continue2
	crs: 
		li $v0, 1         
  		move $a0, $s4     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall	

		li $v0, 4         
  		la $a0, corsair2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p3     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall 

  		lwc1 $f2, p3
  		mtc1 $s4, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j link2

  	kngs:
  		li $t3, 4
  		lw $t2, array($t3)
  		
  		li $v0, 1 
  		move $a0, $t2     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall

  		li $v0, 4         
  		la $a0, kingstone2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p4     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		lwc1 $f2, p4
  		mtc1 $t2, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j continue2

print_mem_ext:
	li $t0, 1
	li $t1, 2
	li $t3, 8
	beq $s5, $t0, segt

	lw $t2, array2($t3)
	beq $t2, $t1, crc
	link3:

  		li $t1, 2
		lw $t2, array2($t3)
		beq $t2, $t1, crc

		j continue3
	segt: 
		li $v0, 1         
  		move $a0, $s6     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall	

		li $v0, 4         
  		la $a0, seagate2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p5     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall 

  		lwc1 $f2, p5
  		mtc1 $s6, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j link3

  	crc:
  		li $t3, 8
  		lw $t2, array($t3)
  		
  		li $v0, 1 
  		move $a0, $t2     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall

  		li $v0, 4         
  		la $a0, crucial2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p6     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		lwc1 $f2, p6
  		mtc1 $t2, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j continue3

  		
process:
	li $v0, 4         
  	la $a0, processadores     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, voltar     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, ryzen     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, i9     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, modelo     
  	syscall

  	li $v0, 5              
  	syscall
  	move $t0, $v0

  	li $t1, 1
  	li $t2, 2
  	beq $t0, $t1, s_1
  	beq $t0, $t2, s_2 
  	beq $s1, $zero, main2
  	s_1:
  		move $s1, $t0

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_rz
  	s_2:
  		sw $t0, array2($zero)

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_i9

  	count_rz:
  		li $v0, 5              
  		syscall
  		move $s2, $v0
		j main2
  	count_i9:
  		li $v0, 5              
  		syscall
  		sw $v0, array($zero)
		j main2

memoria_int:
	li $v0, 4         
  	la $a0, mem_int2     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, voltar     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, corsair     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, kingstone     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, modelo    
  	syscall

  	li $v0, 5              
  	syscall
  	move $t0, $v0

  	li $t1, 1
  	li $t2, 2
  	beq $t0, $t1, s_3
  	beq $t0, $t2, s_4 
  	beq $s3, $zero, main2

  	s_3:
  		move $s3, $t0

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_crs
  	s_4:
  		li $t1, 4
  		sw $t0, array2($t1)

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_kng

  	count_crs:
  		li $v0, 5              
  		syscall

  		move $s4, $v0
		j main2
  	count_kng:
  		li $v0, 5              
  		syscall

  		li $t1, 4
  		sw $v0, array($t1)
		j main2

  


memoria_ext:

	li $v0, 4         
  	la $a0, mem_ext2     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, voltar     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, seagate     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, crucial     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, modelo    
  	syscall

  	li $v0, 5              
  	syscall
  	move $t0, $v0

  	li $t1, 1
  	li $t2, 2
  	beq $t0, $t1, s_5
  	beq $t0, $t2, s_6 
  	beq $s5, $zero, main2

  	s_5:
  		move $s5, $t0

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_sgt
  	s_6:
  		li $t1, 8
  		sw $t0, array2($t1)

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_crc

  	count_sgt:
  		li $v0, 5              
  		syscall

  		move $s6, $v0
		j main2
  	count_crc:
  		li $v0, 5              
  		syscall

  		li $t1, 8
  		sw $v0, array($t1)
		j main2

perifericos:
	li $v0, 4         
  	la $a0, perif2     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, voltar     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, mouse     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, ms    
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, line     
  	syscall

  	li $v0, 4         
  	la $a0, modelo    
  	syscall

  	li $v0, 5              
  	syscall
  	move $t0, $v0

  	li $t1, 1
  	li $t2, 2
  	beq $t0, $t1, s_7
  	beq $t0, $t2, s_8 
  	beq $s5, $zero, main2

  	s_7:
  		move $s7, $t0

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_msl
  	s_8:
  		li $t1, 12
  		sw $t0, array2($t1)

  		li $v0, 4         
  		la $a0, qnt     
  		syscall

  		j count_tlms

  	count_msl:
  		li $v0, 5              
  		syscall

  		move $t9, $v0
		j main2
  	count_tlms:
  		li $v0, 5              
  		syscall

  		li $t1, 12
  		sw $v0, array($t1)
		j main2


print_perif:
	li $t0, 1
	li $t1, 2
	li $t3, 12
	beq $s5, $t0, mslog

	lw $t2, array2($t3)
	beq $t2, $t1, teclms
	link4:

  		li $t1, 2
		lw $t2, array2($t3)
		beq $t2, $t1, teclms

		j continue4
	mslog: 
		li $v0, 1         
  		move $a0, $t9     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall	

		li $v0, 4         
  		la $a0, mouse2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p7     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall 

  		lwc1 $f2, p7
  		mtc1 $s6, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j link4

  	teclms:
  		li $t3, 12
  		lw $t2, array($t3)
  		
  		li $v0, 1 
  		move $a0, $t2     
  		syscall	

  		li $v0, 4         
  		la $a0, x     
  		syscall

  		li $v0, 4         
  		la $a0, spc    
  		syscall

  		li $v0, 4         
  		la $a0, ms2     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_unit     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		li $v0, 2         
  		lwc1 $f12, p8     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, val_tot     
  		syscall

  		li $v0, 4         
  		la $a0, reais     
  		syscall

  		lwc1 $f2, p8
  		mtc1 $t2, $f3

  		cvt.s.w $f3, $f3

  		mul.s $f4, $f2, $f3

  		lwc1 $f5, t
  		la $t0, t
  		add.s $f5, $f4, $f5
  		s.s $f5, 0($t0)

  		li $v0, 2         
  		mov.s $f12, $f4    
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		li $v0, 4         
  		la $a0, line     
  		syscall

  		j continue4

  	


  









  	
	