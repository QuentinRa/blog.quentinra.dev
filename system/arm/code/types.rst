============================================
2. Coder en ARM - Types
============================================

Types

Il existe 3 types :

	*	.ascii convertir une chaîne selon code ascii
	*	.asciz convertir une chaîne selon code ascii avec \0 à la fin
	*	.word 4 octets (int)

.. code:: ca65

	val: .word 4

Une variable peut être soit une valeur soit une adresse

.. code:: ca65

		; déclaration d’un pointeur
		tab: .word 1,5,7,46,89
		; taille du tableau
		; . contient le nombre de valeur écrite juste avant donc 5 ici
		taille: .