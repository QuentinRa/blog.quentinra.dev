==========================================
Manipulation des entiers
==========================================

Pour écrire un chiffre négatif (complément à 2)
----------------------------------------------------------

* on fait l’inverse dit complément à 1 (1 devient 0 et 0 devient 1)
* on ajoute 1 au résultat (donc on fait +1 au complément).

Pour lire un chiffre
------------------------

* Si le bit de poids fort est 1, on fait le complément à 2 et on met un 1 devant le résultat.
* Si le bit de poids fort est 0, on fait comme pour les entiers non signés.

Faire des calculs
-----------------------

Débordement (=overflow)
	On ne peut pas obtenir le bon résultat car il n’est pas dans notre intervalle, on parle de débordement.
	Un débordement est dit sans conséquences si le résultat est toujours bon.

Addition/Soustraction
	| Signe opposés : pas de problème (par exemple faire x - y équivaut a faire x + -y : ok)
	| Signe pareils : retenue et signe identique alors sans conséquences sinon débordement avec conséquences.

		* si deux nombres négatifs

			* faire le complément à 2 des deux nombres
			* on fait l'addition et on vérifie qu'il n'y a pas de débordement

**Exemple de détermination du débordement**

Ex : Somme de 11000000 + 10000001 : deux nombres négatifs.

Complément à 2 de 11000000 :

1) Inverse

.. image:: /assets/system/linux/images/use/1.png

2) ajoute 1

.. image:: /assets/system/linux/images/use/2.png

Le complément à 2 est 64 donc -64 (négatif).

Complément à 2 de 10000001 :

1) Inverse

.. image:: /assets/system/linux/images/use/3.png


2) ajoute 1

 .. image:: /assets/system/linux/images/use/4.png

Le complément à 2 est 127 donc -127 (négatif).

On cherche donc à calculer -64 + - 127 = ?

.. image:: /assets/system/linux/images/use/5.png

Le calcul donne 65 or - 64 + -127 ≠ 65 ; on explique cela
car les bits de retenue et de signe sont différents donc il y
a un débordement **avec conséquences**.