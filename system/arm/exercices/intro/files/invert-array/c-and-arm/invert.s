	.arm
	.data
	.text
	.globl invert

	@r0 = taille tableau
	@r1 = adresse tableau
	@r2 = x
	@r3 = y
	@r4 = tmp

invert:

	@preparations
	push{r2-r6,lr}

	@flemme