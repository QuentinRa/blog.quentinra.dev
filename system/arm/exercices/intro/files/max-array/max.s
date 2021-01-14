	.arm
	.data
	.text
	.globl max

max:
	@dans r0, on a taille
	@dans r1, on a tab
	@dans r2, on a i
	@dans r3, on a max
	@dans r4, la valeur actuelle lue
	
	push {r2-r4,lr}		@empille les registres utilisé car possiblement utilisé par printf
						@jempille lr qui contient la prochaine instruction a executer
	
	mov r2, #1			@i=1
	ldr r3, [r1]		@max=tab[0]

blc:
	cmp r2, r0			@ i < taille
	beq exit			@ sil sont egaux donc i>=taille on quitte

	ldr r4, [r1], #4	@un int = 4 octect donc je lis valeur adresse r1 je la met dans r4
						@puis javance de 4 (donc je passe à lint suivant)
	cmp r4, r3			@if(tab[0] > maximum)
	movpl r3, r4		@max=tab[i]

	add r2, #1			@i++
	b blc				@on boucle

exit:
	mov r0, r3			@met le max dans r0
	pop {r2-r4,pc}		@dépille le registres empilés plus haut, je donne au programme
						@counter (celui qui contient ladresse de la prochaine instruction
						@a executer ladresse de lr donc il retourne juste après bl max)
	
	.end
