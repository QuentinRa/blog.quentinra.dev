==============================================================
5. Conditions - Exemples de code avec conditions
==============================================================

Exemple de code
	Il existe des opérateurs pouvant être ajoutés après le nom de chaque opération, par exemple si on veut faire une
	addition si égalité (eq) alors on met addeq.

	.. code:: ca65

			mov r0, #6 @mets 6 dans r0
			; on va comparer si 6 ? = ? 6
			; ce qui mets à jour les flags
			cmp r0, #6

			; si r0 contient bien 6, alors on ajoute 6
			addeq r0, #6
			; sinon on ajoute 4 (ne = not equals)
			addne r0, #4


Exemple du {s}
		En temps normal, une opération ne modifie pas les valeurs NZCV mais il est possible de faire en sorte que
		ce soit le cas en ajoutant un s après l'éventuelle condition

		.. code:: ca65

				mov r0, #2 ; mets 2 dans r0, ne modifie pas NZCV
				cmp r0, #6 ; comparer 2 égal 6 ?, modifie NZCV

				addnes r0, #4 ; si r0 != 6, alors on ajoute 4. modifie NZCV

Exemple de code avec branchement (donc faire une boucle !)
	.. code:: ca65

		; while(r != 0) { ...; r--; }
		boucle:
		 cmp r0, #0
		 beq exit ; si la condition est vraie, alors on quitte

		 ; mise à jour de r0
		 sub r0, r0, #1

		 ; code de la boucle
		 b boucle

		exit:
		 ; ...