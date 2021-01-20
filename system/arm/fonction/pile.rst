===================================================
4. Fonctions - Fonctionnement de la pile
===================================================

L'utilisation de la pile est simple

	* vous empiler des registres (ordre croissant donc r0, r1, ... et pas r1, r0, ...)
	* vous dépiler des valeurs dans des registres (ordre croissant donc r0, r1, ... et pas r1, r0, ...)

Donc vous mettez des valeurs sur la pile, le premier registre le plus en bas, etc...
puis vous récupérer les valeurs.

.. code:: none

		push {lr} ; empile des registres
		pop {pc} ; depile des registres

		; plusieurs
		; notez que l'ordre est croissant !!! 0 puis 1 puis ... ;
		; possible uniquement pour r0-r7 et lr (push) ; pc (pop)
		push {r0, r1, r2}
		push {r0-r2}