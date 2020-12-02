============================================
6. Barrel Shifter
============================================

============================ =============================================
{shift_types}	               Sémantique
============================ =============================================
LSL (Logical Shift Left)	   On avance de {shift_amount} vers la gauche, les bits en trop à gauche sont perdus, les bits à droite sont remplacés par des zéros (multiplication par 2{shift_amount})
LSR (Logical Shift Right)    On avance de {shift_amount} vers la droite, les bits en trop à droite sont perdus, les bits à gauche sont remplacés par des zéros (division non signée par 2{shift_amount})
ASR (Arithmetic shift right) On repère {shift_amount} fois le bit de signe, puis on écrit Rb, les bits en trop à droite sont perdus. (division signée par 2{shift_amount})
ROR (rotate right)           On met les {shift_amount} derniers bit de Rb, puis on écrit Rb, les bits en trop à droite sont perdus.
RRX (rotate right Extended)  On fait une rotate right mais avec une étape supplémentaire : on déplace l’ancien bit de signe au début et l’ancien dernier à la place du bit de signe {shift_amount} fois.
============================ =============================================

On peut effectuer ces décalages dans une opération ou directement en appelant le décalage

	* :code:`{opération}{cond}{S} Rd,Rn,Rb, {shift_type} {shift_amount}`
	* :code:`{shift_type} Rd, Rb,{shift_amount}`

Explication et notes

	* on fait un shift de type {shift_type} avec pour valeur shift_amount (ex: ASR #2)
	* Rb n’est pas modifié.
	* Par exemple, on peut utiliser le barrel shifter pour lire des valeurs d'un tableau sans le modifier !

.. code:: ca65

		; exemple : addition de r0 = r0 + r1 ; avec r1 décalé de 2 positions
		add r0, r0, r1, lsl #2

Pre-indexed
	On fait un calcul sur l'adresse avant d'accéder à la mémoire.

	.. code:: ca65

			ldr r3, [r2, #-8]
			; | cond | 010 | 0 | 0 | 0 | 1 | 0010 | 0011 | 0000 0000 1000 |
			; condition (eq, ...) | 010 = code de ldr | pré-indexed ? | unsigned ? | write back ? |
			; 1 | r2 (registre shifté) | r3 (registre destination) | constante

			; autre exemple
			ldr r3, [r2, r1, lsl#16] @r3 = r2 + r1 * 2^16
			; | cond | 010 | 1 | 0 | 0 | 1 | 0010 | 0011 | 10 000 | 00 | 0001 |
			; condition (eq, ...) | 010 = code de ldr | pré-indexed ? | unsigned ? | write back ? |
			; 1 | r2 | r3 | shift amount : 16 | type de shift : 00 = lsl | r1

	On peut écraser le registre shifté avec la valeur après rotation en ajoutant un '!' .

	.. code:: ca65

		ldr r3, [r2, #-8]!

Post-indexed
	On accède à la mémoire puis fait un calcul sur l'adresse et de sauvegarder la modification dans le registre shifté.

	.. code:: ca65

		ldr r3, [r2], r1