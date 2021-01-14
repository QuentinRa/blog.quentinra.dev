	.arm
	.data
	.text

	.globl memb

	@r0 = valeur recherchée
	@r1 = taille tableau
	@r2 = adresse tableau
	@r3 = ??? -> ici ce sera min
	@r4 = ??? -> ici ce sera max
	@r5 = ??? -> ici ce sera notre indice actuel
	@r6 = ??? -> la valeur extraite du tableau
	@r8 = ??? -> ici ce sera la future valeur de retour

memb:
	push {r3-r6,r8,lr}		@empille registres car possiblement utilisés par printf
							@empille lr qui contient la prochaine istruction

	mov r5,#0				@ i = 0
	mov r3,#0				@ min = 0
	mov r4,r1				@ max = size;
	sub r4,r4,#1				@ max = size - 1;
	mov r8, #-1				@ valeur retour = -1

blc:
	cmp r3,r4				@regarde si min == max
	beq exit				@s ils sont egaux on quitte
	add r5, r3,r4			@ i = min+max
	lsr r5,r5,#1			@ i/=2

	ldr r6, [r2, r5, lsl#2]	@recupère la valeur du tableau
	cmp r0,r6				@tab[i] == valeur ?
	addeq r5,r5,#1			@si oui : i++ car indice commence à zéro
	moveq r0,r5				@si oui : valeur retour = i;
	beq return				@si oui : return

							@si tab[i] > valeur donc tab[i] - valeur > 0
	subpl r4, r5, #1		@ max = i - 1;

							@si tab[i] < valeur donc tab[i] - valeur < 0
	addmi r3, r5, #1		@ min = i + 1;
	b blc					@ on boucle

exit:
							@ici on fait le dernier test
	add r5, r3,r4			@ i = min + max
	lsr r5, r5, #2			@ i /= 2
	ldr r6, [r2, r5, lsl#2]	@ int  = 2pow2 octect, on cherche depuis *(tab+i*2pow2) = tab[i]
	cmp r6,r0				@ tab[i] == valeur ?
	moveq r0,r5				@met la valeur de notre indice dans r0 si ils sont egaux
	b return

return:
	pop {r3-r6,r8,pc} 		@depille, on donne ladresse de lr à pc == return

	.end

