.equ SYS_EXIT, 1

	.arm
	.data

tab:	 .word 1,2,3,4,5
sz:      .word 5

	.text
	.global _start

_start :

	; exemple : mov
	mov r0, r1 ; met la valeur de r1 dans r0
	mov r0, #5 ; met une constante immédiate dans r0
	mov r0, #SYS_EXIT ; met une constante dans r0, avec SYS_EXIT une constante

	; exemple : ldr
	ldr r0, tab  ; met une adresse dans r0
	ldr r0, =tab ; met la valeur contenue dans a une adresse dans r0 soit 1
	ldr r1, [r0] ; met dans r1, la valeur contenu a l'adresse contenue dans r0
	ldrb r1, [r0] ; met dans r1, la valeur contenue du premier octet de l'adresse contenue dans r0
	ldrh r1, [r0] ; met dans r1, la valeur contenue des 2 premiers octets de l'adresse contenue dans r0

	str r1, [r0] ; met le contenue de r1 a l'adresse contenue dans r0

.end