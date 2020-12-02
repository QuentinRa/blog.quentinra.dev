============================================
2. Coder en ARM - Constantes immédiates
============================================

Les constantes immédiates, de la forme #nombre
par exemple :code:`#0`.

Il s'agit d'une valeur donnée aux opérations qui prennent un argument
de type :code:`Operand2`.

Cependant, ce n'est pas une vrai constante donc vous ne pouvez pas mettre
certaines valeurs.

Encodage des constantes immédiates
-------------------------------------

Les constantes immédiates est codée sur 12 bits

	* les 4 premier bits contiennent la rotation, il faut faire 2^rotation pour obtenir la vraie rotation à appliquer au 8 bits.
	* les 8 autres bits contiennent le nombre

On ne peux représenter que les nombres pour lesquels l'espace entre le premier et le dernier bit à 1 est inférieur
ou égal à 8 et donc le nombre de décalages se note 2^rotation.

.. note::

	Dit autrement, il faut écrire le nombre en base 2, et regarder que entre le 1 et le dernier 1 il y a au max 8 nombres
	(extrémités incluses). Ensuite il faut regarder qu'on peut mettre les 8 valeurs tout à droite, en décalant d'une puissance
	de 2 (donc 0,1,2,4,8,...).

Retrouver un nombre depuis une constante immédiate
		.. code:: c

				// on dispose de la constante immédiate avec rotation:0001, nombre:00000001
				0001 00000001
				// on met les 8 bits sur 32 bits
				00000000 00000000 00000000 00000001
				// on calcule la rotation
				0001 en base 2 = 1 en base 10. Rotation = 2^1 = 2
				//applique la rotation
				10000000 00000000 00000000 00000000 // 1
				01000000 00000000 00000000 00000000 // 2
				// donc le nombre est
				1073741824

Convertir un nombre en une constante immédiate
		.. code:: c

				// nombre au hasard : 748 326
				00000000 00001011 01101011 00100110 // invalide, 19 entre 1er et dernier 1

				// nombre au hasard : 32000
				00000000 00000000 01111101 00000000 // test 1 : ok, écart = 7
				// test 2 : décalage s'écrit de la forme 2^nombre ?
				// on choisi nos 8 bits 'comme on veut' (on ne modifie pas l'ordre) et on les mets à droite
				00000000 00000000 00000000 01111101 // pour remettre ce bloc à sa place, il faut décaler de 24 bits
				// or on ne peut pas écrire 2^n = 24, test 2 : invalide.

				// nombre : -58
				10000000 00000000 00000000 00111010 //écart = 7, test 1 : ok
				// on choisi nos 8 bits comme on veut, ici j'ai déplacé le 10 de tout à gauche, tout à droite
				00000000 00000000 00000000 11101010 //on voit ici que décaler le 10 de 2 nous redonne le nombre de départ
				// démo:
				00000000 00000000 00000000 01110101 //1
				10000000 00000000 00000000 001110100 //2
				// et 2^1 = 2 ! donc la rotation vaut 1.
				//
				// constante : rotation = 0001 = 1 ; nombre = 11101010 = 234
				// soit  0001 11101010