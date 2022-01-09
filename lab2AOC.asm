.data

  string: .space 1000

  input: .asciiz "Insira a mensagem: "
  nchar: .asciiz "Numero total de caracteres: "
  cripto: .asciiz "Mensagem criptografada: "

  line: .asciiz "\n"

.text
.globl main

main:

  li $v0, 4         
  la $a0, input     
  syscall           

  li $v0, 8        
  la $a0, string    
  li $a1, 1000       
  syscall
  
  move $t0, $a0  

loop:

  lb $t2, 0($t0)
  beqz $t2, endf
  beq $t2, 'O', O
  beq $t2, 'o', O
  beq $t2, 'I', I
  beq $t2, 'i', I
  beq $t2, 'Z', Z
  beq $t2, 'z', Z
  beq $t2, 'E', E
  beq $t2, 'e', E
  beq $t2, 'A', A
  beq $t2, 'a', A
  beq $t2, 'S', S
  beq $t2, 's', S
  beq $t2, 'G', G
  beq $t2, 'g', G
  beq $t2, 'T', T
  beq $t2, 't', T
  beq $t2, 'B', B
  beq $t2, 'b', B
  beq $t2, 'P', P
  beq $t2, 'p', P

  beq $t2, '0', c0
  beq $t2, '1', c1
  beq $t2, '2', c2
  beq $t2, '3', c3
  beq $t2, '4', c4
  beq $t2, '5', c5
  beq $t2, '6', c6
  beq $t2, '7', c7
  beq $t2, '8', c8
  beq $t2, '9', c9

continue:

  addi $t0, $t0, 1
  addi $t1, $t1, 1
  j loop



O:
  li $t4, '0'
  sb $t4, ($t0)
  j continue


I: 
  li $t4, '1'
  sb $t4, ($t0)
  j continue


Z: 
  li $t4, '2'
  sb $t4, ($t0)
  j continue


E: 
  li $t4, '3'
  sb $t4, ($t0)
  j continue

A: 
  li $t4, '4'
  sb $t4, ($t0)
  j continue

S: 
  li $t4, '5'
  sb $t4, ($t0)
  j continue

G: 
  li $t4, '6'
  sb $t4, ($t0)
  j continue

T: 
  li $t4, '7'
  sb $t4, ($t0)
  j continue
B: 
  li $t4, '8'
  sb $t4, ($t0)
  j continue
P:
  li $t4, '9'
  sb $t4, ($t0)
  j continue

c0: 
  li $t4, 'O'
  sb $t4, ($t0)
  j continue
c1: 
  li $t4, 'I'
  sb $t4, ($t0)
  j continue
c2: 
  li $t4, 'Z'
  sb $t4, ($t0)
  j continue
c3: 
  li $t4, 'E'
  sb $t4, ($t0)
  j continue
c4: 
  li $t4, 'A'
  sb $t4, ($t0)
  j continue
c5: 
  li $t4, 'S'
  sb $t4, ($t0)
  j continue
c6: 
  li $t4, 'G'
  sb $t4, ($t0)
  j continue
c7: 
  li $t4, 'T'
  sb $t4, ($t0)
  j continue
c8: 
  li $t4, 'B'
  sb $t4, ($t0)
  j continue
c9: 
  li $t4, 'P'
  sb $t4, ($t0)
  j continue
  
endf:

  li $v0, 4
  la $a0, nchar
  syscall

  addi $t1, $t1, -1
  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 4
  la $a0, line
  syscall

  li $v0, 4
  la $a0, cripto
  syscall
  
  li $v0, 4
  la $a0, string
  syscall
    
  li $v0, 10
  syscall