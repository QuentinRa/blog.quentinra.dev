@as -gstabs max-array.s -o max-array.o
@ld -Oo max.o max-array.o files/sprintfd.o

	.equ SYS_EXIT, 1
	.equ SYS_READ, 3
	.equ SYS_WRITE, 4

	.arm
	.data

sz: .word 5
ary: .word 1,5,7,46,89

strfin:	.asciz "\n"
str:	.space 256

	.text
	.globl _start

_start:

	@Prepare registres pour max(int, int*) donc r0 taille et r1 adresse tableau
	
	ldr r3,=sz
	ldr r0,[r3]			@je met la taille du tableau dans r0
	ldr r1,=ary 		@je met ladresse du tableau dans r1

	bl max 				@Appelle la fonction globl max qui met le max dans r0
	
	mov r1,r0			@met la valeur en transformer en string dans r1 (max)
	ldr r0,=str			@on lui donne une adresse ou mettre la chaine
	bl sprintfd			@on appelle convertisseur qui met dans r0 chaine et r1 sa taille
	
	mov r2,r1			@met la taille dans r2 write(...,...,taille)
	mov r1,r0			@met la chaine dans r1 write(...,chaine,taille)
	mov r0,#1			@met la sortie dans r0 write(1,chaine,taille)
	mov r7,#SYS_WRITE	@on dit que l'on va appeller write
	swi #0x0			@on l'appelle

	mov r0,#1			@met la sortie dans r0 		write(0,...,...)
	ldr r1,=strfin		@on met chaine dans r1		write(1,"\n",...)
	mov r2,#1			@on donne la taille dans r2 write(1,"\n",1)
	mov r7,#SYS_WRITE	@on dit que l'on va faire un write
	swi #0x0 			@on fait le write     
	
	@ON nOublie pas de dire que lon a fini

	mov r7,#SYS_EXIT	@On dit que l'on va quitter
	mov r0,#0			@Code de retour est zéro
	swi #0x0			@on fait return
	
	.end

