================================
Récursivité
================================

Niveau débutant
***********************

1. Phases
--------------

Testez la fonction suivante dans gdb :

void exemple(unsigned n) {
  if (n != 0) {
    putchar('>');
    exemple(n-1);
    putchar('<');
  } else
    putchar('O');
}
Placez un point d'arrêt sur les trois lignes qui contiennent putchar, lancez le programme, et à chaque fois qu'il atteint un
point d'arrêt utlisez la commande bt pour voir la pile des appels. Pouvez-vous identifier les phases ascendantes et descendantes ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d1>

| :code:`[TAG] IUTSF APL S1 TP24 2019`

2. Fibonacci
--------------

Écrivez une fonction qui calcule le n-ième terme de la suite de Fibonacci.

.. math::

	\begin{cases}u_0=0\\u_1=1\\\forall{n \ge 2}, \ \ \ \ \ \ u_{n} = u_{n-2} + u_{n-1}\end{cases}

Écrivez ensuite une fonction qui affiche les m premiers termes de la suite, et un programme qui exécute cette
fonction avec m valant 15.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d2>

| :code:`[TAG] IUTSF APL S1 TP24 2019`

3. Tableau
--------------

Écrivez une fonction qui prend en argument un tableau de réels et affiche ses éléments séparés par une virgule.
Employez la récursivité plutôt qu'une boucle.

.. code:: none

	1.25, 47.80, 77.01, 54.23, 895.14

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d3>

| :code:`[TAG] IUTSF APL S1 TP24 2019`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)