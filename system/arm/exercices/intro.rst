================================
Introduction
================================

Niveau débutant
***********************

1. Compréhension des instructions
-----------------------------------

Donnez la sémantique des instructions suivantes

Ex: :code:àdd r3, r4, r5` à pour sémantique :code:`r3:=r4+r5`

1. :code:`ldr r1, [r0]`
2. :code:`cmp r7, r8`
3. :code:èorne r7, r8, r8`
4. :code:`subs r3, r2, #5`
5. :code:`mvnne r3, r2`
6. :code:`rsbles r3, r2, #0`

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/d1>

| :code:`[TAG] IUTSF ASR TD 2019 S2`

2. Compréhension de code
---------------------------

Que calcule le code ARM suivant ?

.. code:: ca65

		 .data
		int1: .word 78
		int2: .word 1003
		int3: .word -4

		 .text
		 .globl _start
		_start:
		 ldr r0, =int1
		 ldr r1, [r0]

		 ldr r0, =int2
		 ldr r2, [r0]

		 ldr r0, =int3
		 ldr r3, [r0]

		 mov r4, r1

		 cmp r2, r4
		 movpl r4, r2

		 cmp r3, r4
		 movpl r4, r3

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/d2>

| :code:`[TAG] IUTSF ASR TD 2019 S2`

Niveau supérieur
***********************

1. max-array
---------------------------

On va reprendre la recherche de la valeur maximale dans un tableau.

(a) \
	On écrit max-array.c dans lequel on dispose de la fonction max qui prend en arguments
	la taille et l’adresse d’un tableau d’entiers et en retourne la valeur maximale.
	Dans le programme principal, on fait la saisie, par interaction avec l’utilisateur, des
	nouvelles valeurs (taille du tableau et valeurs dans le tableau), puis l’appel de la
	fonction. C’est le programme principal qui affiche la valeur maximale.
(b) \
	On écrit max-array.s qui utilise une fonction max qui prend les mêmes arguments.
	Pour parcourir le tableau, on utilisera le post-indexed addressing mode où l’offset est
	une constante immédiate. La taille et les entiers dans le tableau sont donnés dans la
	section .data. On peut partir d’une copie de ASR/ARM/ary-sample.s.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/s1>

| :code:`[TAG] IUTSF ASR TP20 2019 S2`

2. is-in-sorted
----------------------

On cherche si un entier donné est présent dans un tableau d’entiers trié, disons, par ordre
croissant.

(a) \
	On écrit is-in-sorted.c dans lequel on dispose de la fonction memb à qui on passe
	la valeur de x, la taille et l’adresse d’un tableau d’entiers. Elle retourne une position
	dans le tableau où se trouve la valeur de x, si x est un élément du tableau, et elle
	retourne -1 sinon. La taille du tableau, les entiers dans le tableau, et la valeur de x
	sont saisies de manière interactive avec l’utilisateur C’est dans le programme principal
	qu’on saisit toutes les valeurs. C’est le programme principal qui affiche le résultat.

	Note. On ne parcourt pas le tableau puisqu’il est trié (s’inspirer de la méthode dite du
	binary search utilisée pour le log en cinq tests.) On examine les positions pertinentes
	dans le tableau, sans changer le pointeur sur le début du tableau.
(b) \
	On écrit is-in-sorted.s, qui fait appel à une fonction memb, pour réaliser la même
	chose que dans le programme C précédent, sans changer la valeur dans le registre de
	base chargé initialement par l’adresse du début du tableau.
(c) \
	Adapter update-array.sh pour qu’il permette aussi de mettre jour la valeur de
	x, toujours par interaction avec l’utilisateur. Utiliser update-array.sh ainsi adapté
	pour faire plusieurs tests avec is-in-sorted.s.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/s2>

| :code:`[TAG] IUTSF ASR TP20 2019 S2`

3. invert-array
----------------------

On cherche à inverser l’ordre des éléments dans un tableau d’entiers.

Ainsi, si un tableau est : :code:`| 72 | 0 | -34 | 2 | 41 | 12 |`
alors il doit devenir : :code:`| 12 | 41 | 2 | -34 | 0 | 72 |`.

(a) \
	On écrit invert-array.c dans lequel on dispose de deux fonctions. La fonction disp
	qui affiche les éléments d’un tableau d’entiers, et la fonction invert qui inverse les
	éléments dans un tableau d’entiers. Chacune des deux fonctions reçoit la taille du
	tableau et l’adresse du début du tableau. La taille du tableau et les entiers dans le
	tableau sont saisis de manière interactive avec l’utilisateur. C’est dans le programme
	principal qu’on saisit toutes les valeurs, puis on appelle la fonction invert qui, elle-
	même appelle la fonction disp.

	**Contrainte**. On ne doit pas utiliser de tableau intermédiaire. On utilisera deux pointeurs :
	un sur le début du tableau, l’autre sur la fin du tableau. (\*) On place les valeurs
	trouvées à ces adresses dans deux variables disons, x, y, respectivement. On écrit la
	valeur de y à l’adresse indiquée par le premier pointeur et on écrit la valeur de x à
	l’adresse indiquée par le deuxième pointeur. Le premier pointeur avance, le deuxième
	recule et on recommence en (\*).

(b) \
	On écrit invert-array.s

	On notera que la fonction disp fait appel à la fonction sprintfd. Dans la fonction
	invert, on utilisera un mode d’adressage pre-indexed ou post-indexed où l’offset est
	une constante immédiate.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<intro/s3>

| :code:`[TAG] IUTSF ASR TP20 2019 S2`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignants à l'IUT de Sénart-Fontainebleau)
	* Frédéric GERVAIS (enseignants à l'IUT de Sénart-Fontainebleau)