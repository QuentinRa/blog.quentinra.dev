================================
1. Partiel 2018 ASR
================================

Exercice 1

Trois registres spécialisés sont utilisés par l’unité de contrôle d’une microarchitecture.
Donner le sigle, le nom complet et le rôle de chacun. (en français ou en anglais)

Exercice 2

Par quelles étapes passe une instruction machine lors de son exécution par le processeur ?

Exercice 3

Pour chacune des lignes de commandes suivantes, on indique ce qu’elle affiche en justifiant sa réponse.

	(a)	tu=100 ; vous = 50 ; [[ tu > vous ]] ; echo $?
	(b)	tu=249 ; vous = 4 ; [[ $tu < $vous ]] ; echo $?
	(c)	tu=0x ; u = baf ; us=0xfab ; [[ $t$u -lt $vo$us ]] ; echo $?
	(d)	a = 254 ; [[ 6#$a -gt 5#$a ]] ; echo $?

Exercice 4

Sans passer par aucune base intermédiaire, écrire les quatre nombres suivants en binaire sur 16bits :
0x4FB2, 0x80CE, 0xC343, 0x41CB.

Exercice 5

On considère l’opération 0x4FB2 - 0x80CE oû les deux opérandes sont des entiers signés sur 16 bits.

(a)
	Poser et effectuer cette opération en binaire sur 16 bits tel que le fait le matériel sachant
	qu’il n’y a pas de circuit dédié à la soustraction. Donner le résultat en binaire puis en hexadécimal ?
(b)
	Y a-t-il débordement ? Pourquoi ?

Exercice 6

Même questions qu’en 5 pour l’opération 0xC343 - 0x41CB.

Exercice 7

En exprimant les limites de l’intervalle à l’aide de puissances de 2
(et donc sans chercher à calculer les nombres correspondants),
quel est l’intervalle des entiers signés sur 32 bits ? Justifier la réponse

Exercice 8

.. code:: bash

		$hexdump -C integers.dat
		00000000 1f 00 00 00 	c6 ff ff ff	ff ff ff ff 00 00 00 80
		00000010

(a)	Combien d’entiers signés contient integer.dat ?
(b) \
	|
		En exprimant -si on le souhaite- le résultat simplement à l’aide de puissance de 2,
		quelle est en décimal la valeur de chacun de ces entiers pour une machine little-endian ?
	| Expliquer en détail comment on trouve.

Exercice 9

Quels éléments cherche-t-on en passant la commande suivante,
et quelle est la longueur minimale sur l’ensemble des noms de ces éléments ? Expliquer la réponse.

.. code:: bash

	$ ls -d . ?*[^$]$

Exercice 10

Que cherche-t-on à faire avec la ligne de commande :

.. code:: bash

	$ grep -E "(^|[5-9])[[ :upper: ]]+$" fi.txt
