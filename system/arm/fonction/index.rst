============================================
4. Fonctions
============================================

Explications
	* vous allez écrire une fonction généralement dans un autre fichier
	* l'étiquette global contiendra le nom de la fonction
	* les arguments de la fonction seront dans les registres :
		* si un argument alors dans r0
		* si deux argument alors dans r0, r1
		* etc...
	* il n'y a aucune garantie que les arguments sont valides.
	* si la fonction retourne un/des résultat, alors il seront dans r0, r1, ...
	* vos registres peuvent être écrasés, vous devez donc en faire une copie au cas ou (voir pile)

Déclaration
	.. code:: ca65

			.arm
			.data
			.text

			; déclaration de la fonction
			; pas forcément dans un autre fichier mais c'est mieux

			; ceci est une fonction max, sa signature est
			; int max(int nombre1, int nombre2);
			.global max

		max:
		 ; code de la fonction
		 ; ...
		.end

	L'étiquette global permet de rendre la fonction accessible depuis un autre fichier.
	Vous pouvez coder des fonction utilisées par ce code mais uniquement dans ce fichier.

Appel de la fonction
	Vous devez remplir les registres avec les arguments puis appeler
	la fonction avec :code:`bl`.

	.. code:: none

			; ...

			mov r0, #5 ; nombre1 = 5
			mov r1, #13 ; nombre2 = 13

			bl max; ; appel de max(5,13)

			; r0 contient le résultat soit 13

			; ...

