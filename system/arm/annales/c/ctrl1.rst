================================================
1. Contrôle 2019 ASR ARM
================================================

**Exercice 1**

On veut obtenir deux fois le contenu de r1 dans r2. Proposez
en n'utilisant que ces deux registres et avec au plus deux instructions
parmi add, sub, rsb une solution pour

	* p = 95 (astuce : 95 = 128-33)
	* p = -19 (astuce : -19 = -16-3)

**Exercice 2**

1. Rappeler comment ARM gère les constantes immédiates

2. Montrer (1) pour

	* 0x84000003
	* 0x28000004

**Exercice 3**

Expliquer ligne par ligne l'évolution de r2 et r3
en détaillant les calculs et le contenu des registres en hexadécimal.

On suppose que, juste avant l'exécution de la ligne 1, r2 contient 0,
et r3 contient la valeur 2.

.. code:: ca65

	teq r2, #1
	cmppl r3, #8
	cmpmi r3, #3
	submis r2, r3, r2

**Exercice 4**

Deux cas : r2 contient 0x1000000 et r2 contient 0x33. Vous devez
décrire pour les deux cas les instructions exécutées (1) et l'évolution
des registres r2 et r3 (2).

Vous détaillerez les calculs et le contenu de ces registres en hexadécimal.

.. code:: ca65

	tst r2, #0xff000000
	eor r3, r3
	bne Lab
	tst r2, #0xff
	addpls r2, r3, r2, ror #2
	rsbmis r3, r2, r3
	Lab: subpls r2, r2, 0x4000000
	submis r3, r3, 0x4000000