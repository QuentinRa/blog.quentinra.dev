.. _enc_int:

=========================================
Encodage des entiers signés
=========================================

On utilisera des base principalement les base 2 (binaire), 8 (octal) et 16 (hexadécimal) pour représenter des
nombres.

Les valeurs prises sont de 0 à n-1 avec n le nombre de la base.

On représentera les entiers jusqu’à 9 puis les lettres de l’alphabet de A à Z (base max 35 -> 0-Z).

BASE 2
--------------

Soit un nombre, je recherche une combinaison pour l’obtenir, je mets 1 si j’ai utilisé un chiffre sinon 0.

Inversement, si j’ai un chiffre binaire, je fais la somme des 1 multipliés par la puissance de 2 correspondante
pour obtenir mon nombre.

=========== =========== =========== =========== =========== =========== =========== =========== ===========
:math:`2^8` :math:`2^7` :math:`2^6` :math:`2^5` :math:`2^4` :math:`2^3` :math:`2^2` :math:`2^1` :math:`2^0`
=========== =========== =========== =========== =========== =========== =========== =========== ===========
256         128         64          32          16          8           4           2           1
=========== =========== =========== =========== =========== =========== =========== =========== ===========

.. code:: bash

		#Ex avec 12
		12
		# décompose avec des valeurs du tableau
		= 8 + 4
		#on réécris le tableau avec des 1 dans les 2^ utilisés pour écrire 12
		= 0*256+0*128+0*64+0*32+0*16+1*8+1*4+0*2+0*1
		# ce qui donne
		000001100
		# puis pour revenir à 12, on multiple par 2^ position du 1 dans le tableau
		# ce qui donne (de droite vers le dernier 1 à gauche)
		0*2^0+0*2^1+1*2^2+1*2^3 = 2^2+2^3 = 4 + 8 = 12

BASE 8
--------------

Pour la base 8, on part du principe que un nombre en base 8 ⇔ 3 en base 2,
on rajoute des zéros devant notre nombre binaire pour convertir s’il en manque.

BASE 16
--------------

Sur le même principe, un nombre en base 16 ⇔ 4 en base 2.