================================
Exercices non triés
================================

1. Un petit problème de croisement
-------------------------------------

.. image:: /assets/math/graph/exercice/nr1.png

Est-il possible de tracer une ligne continue telle que tout segment est coupé exactement une fois par cette ligne ?
Modéliser le problème par un problème de graphe et le résoudre.

2. Parcours de musée
-------------------------------------

On Souhaite tracer le parcours d’un musée de sorte que chaque personne ne passe pas plus d’une fois devant la même oeuvre.
Voici deux plans de musées. Les E entourés sont des escaliers. Dans le musée 1, des tableaux sont accrochés sur les murs
dessinés en gras. Dans le musée 2, les oeuvres sont disposés dans les salles (pas forcément aux murs)
sauf dans la salle vide.

.. image:: /assets/math/graph/exercice/nr2.png

1. Modéliser ce problème dans le musée 1 sous forme d’un problème de graphe et le résoudre.
2. Modéliser ce problème dans le musée 2 sous forme d’un problème de graphe et le résoudre.
3. Pourquoi la modélisation n’est-elle pas la même, qu’est ce qui a changé ?

3. Équipement d'un atelier
-------------------------------------

Dans un grand atelier sont installées neuf machines, a, b, . . ., h et i. Les pièces mécaniques
qui y sont fabriquées doivent passer successivement sur plusieurs machines (perceuses, soudeuses,
polisseuses, ...). On désire construire, pour un coût minimum, des tapis roulants permettant de
conduire les pièces d’une machine à une autre machine. Le tableau ci-dessous indique pour chaque
machine M quelles sont les machines qui peuvent suivrent dans la chaîne de production. On doit
donc relier M à chacune de ces machines par une succession de tapis roulant. Modélisez ce problème
par un problème graphe et résolvez le.

.. image:: /assets/math/graph/exercice/nr3.png

4. Stable et degré
--------------------

Soit G un graphe tel que :math:`1 \le d(x_1) \le ... \le d(x_n)`
et il existe p dans :math:`[2,n]` tel que :math:`\sum_{i=0}^{p-2} d(x_{n-i} \le n-p`.

Montrer que tout stable maximal possède au moins p éléments.

5. Empiler
--------------

Soient :math:`C_1, C_2, C_3` les trois cylindres (à base triangulaire) suivants. Ils sont colorés sur
les trois faces verticales (pas sur les bases). La couleur de la face arrière est indiquée en haut.

.. image:: /assets/math/graph/exercice/nr5.png

On cherche une façon d’empiler parallèlement les cyclindres de sorte que chaque face de la pile
ainsi construite possède au plus une fois chaque couleur. Modéliser ce problème par un problème
de graphe et le résoudre.

6. Plan de mariage
--------------------

Comment effectuer à un mariage un plan de table de sorte que deux personnes qui ne s’apprécient
pas ne soient pas à la même table ? Modéliser ce problème par un problème de graphe.

|

-----

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)
	* Wikle (étudiant à l'ENSIIE)