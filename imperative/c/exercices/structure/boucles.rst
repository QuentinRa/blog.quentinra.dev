================================
Boucles (while, for, ...)
================================

Niveau débutant
***********************

1/15 Séquence
------------------------

Écrivez un programme qui demande deux entiers puis affiche dans l'ordre croissant
tous les entiers compris entre ces deux valeurs (au sens large).

Faites trois versions de votre programme, et utilisez une forme de boucle différente pour chaque.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d1>

| :code:`[TAG] IUTSF APL S1 TP5 2019`

2/15 Filtrage
------------------------

Écrivez un programme qui demande la moyenne du Bac et affiche la mention correspondante.

Lorsque l'utilisateur rentre une note de bac qui n'est pas comprise entre
10 et 20, on lui repose la question jusqu'à ce qu'il donne une note correcte.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d2>

| :code:`[TAG] IUTSF APL S1 TP5 2019`

3/15 Table
------------------------

Écrivez un programme qui demande un entier, puis affiche la table de multiplication correspondante.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d3>

| :code:`[TAG] IUTSF APL S1 TP5 2019`


4/15 Division
------------------------

Écrivez un programme qui demande à l'utilisateur une valeur entière positive ou nulle, puis une valeur
entière strictement positive, et qui affiche ensuite le quotient et le reste de la division euclidienne
de la première valeur par la deuxième, en utilisant dans vos calculs seulement des additions et des soustractions.

.. code:: none

		Entrez une valeur >= 0 : 46
		Entrez une valeur > 0  : 7
		-->  46 = 6 x 7 + 4

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d4>

| :code:`[TAG] IUTSF APL S1 TP5 2019`

5/15 Tables
------------------------

Écrivez un programme qui affiche plusieurs tables de multiplication. Avant l'affichage de chaque table,
le programme demandera à l'utilisateur sur quel entier baser la table. S'il répond -1,
le programme s'arrêtera sans rien afficher de plus.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d5>

| :code:`[TAG] IUTSF APL S1 TP5 2019`

6/15 Bornes
------------------------

Écrivez un programme qui laisse l'utilisateur saisir autant d'entiers naturels qu'il le souhaite.
Lorsque celui-ci saisit la valeur -1, cela signifie que la saisie est terminée. Le programme
affiche alors seulement la plus petite et la plus grande des valeurs saisies.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d6>

| :code:`[TAG] IUTSF APL S1 TP5 2019`

7/15 Devinette
------------------------

Écrivez un programme qui donne cinq tentatives à l'utilisateur pour deviner un
nombre entre 0 et 100. À chaque tentative infructueuse, le programme offrira un indice en affichant + ou -.

Utilisez des constantes nommées pour représenter le nombre de tentatives et la valeur maximum.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d7>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

8/15 Primarité
------------------------

Écrivez un programme qui demande à l'utilisateur un entier naturel puis indique
si cet entier est premier.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d8>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

9/15 Table
------------------------

Écrivez un programme qui affiche la table de multiplication.

Utilisez dans votre programme une constante nommée pour représenter la taille de la table
(10 dans l'exemple ci-dessus). Votre programme devra encore fonctionner si on choisit une taille
différente en changeant la valeur de cette constante.

.. code:: none

	 	 X  |   0   1   2   3   4   5   6   7   8   9  10
               -----+--------------------------------------------
		 0  |   0   0   0   0   0   0   0   0   0   0   0
		 1  |   0   1   2   3   4   5   6   7   8   9  10
		 2  |   0   2   4   6   8  10  12  14  16  18  20
		 3  |   0   3   6   9  12  15  18  21  24  27  30
		 4  |   0   4   8  12  16  20  24  28  32  36  40
		 5  |   0   5  10  15  20  25  30  35  40  45  50
		 6  |   0   6  12  18  24  30  36  42  48  54  60
		 7  |   0   7  14  21  28  35  42  49  56  63  70
		 8  |   0   8  16  24  32  40  48  56  64  72  80
		 9  |   0   9  18  27  36  45  54  63  72  81  90
		10  |   0  10  20  30  40  50  60  70  80  90 100

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d9>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

10/15 Progression
------------------------

Écrire un programme qui affiche le nième terme de la suite de Fibonacci,
définie par la relation de récurrence suivante :

.. math::

	\begin{cases}u_0=0\\u_1=1\\\forall{n \ge 2}, \ \ \ \ \ \ u_{n} = u_{n-2} + u_{n-1}\end{cases}

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d10>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

11/15 Figures
------------------------

Un théorème dû à Lagrange affirme que tout entier naturel peut s'écrire comme
la somme de quatre carrés. Par exemple :

.. code:: none

		28=25+1+1+1
		28=16+4+4+4
		28=9+9+9+1

Ou encore :

.. code:: none

	10=9+1+0+0
	10=4+4+1+1

Écrivez un programme qui demande un entier naturel, et affiche toutes ses décompositions sous la
forme d'une somme de 4 carrés (attention, chaque décomposition ne doit apparaître qu'une seule fois).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d11>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

12/15 Facteurs
------------------------

Écrivez un programme qui demande un entier naturel non nul, et affiche sa décomposition en
facteurs premiers. Par exemple,

.. code:: none

	Entrez un entier naturel non nul : 280
	280 = 2*2*2*5*7

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d12>

| :code:`[TAG] IUTSF APL S1 TP6 2019`

13/15 Sapin
--------------------------

Écrivez le programme correspondant à la session suivante :

.. code::

		Hauteur ? 6

		     *
		    ***
		   *****
		  *******
		 *********
		***********

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d13>

| :code:`[TAG] IUTSF APL S1 TP7 2019`

14/15 Figures
--------------------------

Écrivez le programme correspondant à la session suivante :

.. code:: none

		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? 1

		Hauteur ? 4

		*
		**
		***
		****
		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? 2

		Hauteur ? 5

		*****
		*   *
		*   *
		*   *
		*****
		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? q

		Au revoir...

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d14>

| :code:`[TAG] IUTSF APL S1 TP7 2019`

15/15 Diviseur
------------------------

Écrivez un programme qui demande deux entiers naturels à l'utilisateur,
puis affiche leur plus grand commun diviseur.

L'algorithme d'Euclide nous donne un bon moyen de faire ce calcul :

	* Si b = 0, pgcd(a, b) = a
	* Sinon, pgcd(a, b) = pgcd(b, a mod b)

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/d15>

| :code:`[TAG] IUTSF APL S1 TP7 2019`

Niveau supérieur
***********************

1/1 Disque
------------------------

Écrivez un programme qui demande le rayon, puis affiche un disque formé d'étoiles.

.. code:: none

 Rayon ? 10

            * * * * * * * * *
          * * * * * * * * * * *
      * * * * * * * * * * * * * * *
      * * * * * * * * * * * * * * *
    * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
  * * * * * * * * * * * * * * * * * * *
    * * * * * * * * * * * * * * * * *
      * * * * * * * * * * * * * * *
      * * * * * * * * * * * * * * *
          * * * * * * * * * * *
            * * * * * * * * *

On se souviendra que les points d'un disque sont les points dont la distance au centre est inférieure au rayon.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<boucles/s1>
	Proposition de correction n°2			<boucles/s1_2>

| :code:`[TAG] IUTSF APL S1 TP7 2019`

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)