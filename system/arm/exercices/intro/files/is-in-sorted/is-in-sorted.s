	.equ SYS_EXIT, 1
	.equ SYS_READ, 3
	.equ SYS_WRITE, 4

	.arm
	.data

val: .word 7
sz: .word 5
ary: .word 1,5,7,46,89

strfin:	.asciz "\n"
str:	.space 256

	.text
	.globl _start

_start:
	
	@prepare les registres pour aller memb(int valeur,int taille,int * tableau)

	ldr r1, =val 		@met ladresse de val dans r1
	ldr r0, [r1]		@charge la valeur à ladresse dans r1 dans r0 donc r0=valeur

	ldr r2, =sz			@met ladresse de sz dans r2
	ldr r1, [r2]		@charge la valeur à ladresse dans r2 dans r1 donc r1=size

	ldr r2, =ary		@met ladresse du tableau dans r2

	bl memb				@appelle fonction, elle met dans r0 son retour

	@On va maintenant afficher

	mov r1, r0			@on met valeur retournée dans r1 pour la convertit en string
	ldr r0, =str 		@on lui donne ladresse ou mettre le resultat

	bl sprintfd			@conversion, dans r0 la chaine, dans r1 sa taille

	@ on a write(chaine,taille,...) -> on veut write(1,chaine,taille)

	mov r2, r1			@write(chaine,taille,taille)
	mov r1, r0			@write(chaine,chaine,taille)
	mov r0,#1			@write(1,chaine,taille)
	mov r7,#SYS_WRITE	@dit que l'on va faire write
	swi #0				@fait le write

	@fait un saut de ligne : on écris un caractère saut de ligne

	mov r0,#1
	ldr r1, =strfin
	mov r2,#1
	mov r7,#SYS_WRITE	@dit que l'on va faire write
	swi #0				@fait le write

	mov r0,#1
	mov r7,#SYS_EXIT	@dit que l'on a fini
	swi #0

	.end
