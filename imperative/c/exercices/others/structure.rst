================================
Structures
================================

Niveau débutant
***********************

1. Date
--------------

Écrivez un programme qui affiche la date au format ISO 8601 (AAAA-MM-JJ).

La fonction time vous donne cette date, mais exprimée en secondes écoulées depuis le 1er janvier 1970,
ce qui n'est pas très pratique. La fonction localtime permet de décomposer la date en éléments exploitables.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d1>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

2. Tailles
--------------

Écrivez un programme qui affiche la taille en octets d'un enregistrement
contenant trois champs de type char. Êtes-vous surpris ?

Modifiez le programme pour que le deuxième champ soit un int. Comment expliquez-vous la nouvelle taille ?
Placez ce champ en premier dans la définition de la structure. Qu'est-ce qui change ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d2>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

3. Groupe
--------------

Écrivez un programme qui affiche la liste des noms des utilisateurs qui appartiennent au groupe students20
(adaptez avec un groupe d'utilisateurs sur votre pc).
La fonction getgrnam devrait vous y aider : lisez sa page manuelle.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d3>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

4. Complexes
--------------

Un complexe est un nombre pouvant s'écrire en forme algébrique z = x + i.y où i désigne la racine carrée de -1.

on nomme x la partie réelle de z et y sa partie imaginaire. Définissez une structure pour représenter un complexe sous
forme algébrique.

Écrivez ensuite des fonctions pour calculer le module, le conjugué et l'inverse d'un complexe. Pour mémoire :

.. image:: /assets/imperative/c/exercice/structures4d.png

5. Rectangles
--------------

Un rectangle est représenté par les coordonnées entières de son coin supérieur gauche et par
ses dimensions entières (largeur et hauteur).

Définissez la structure correspondante. En vous basant sur ce type, écrivez une fonction qui affiche un rectangle,
et une fonction qui demande à l'utilisateur de cliquez deux fois et qui renvoie le rectangle ayant un coin à chaque position cliquée.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d5>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

6. Alterations
-----------------

Reprenez l'exercice précédent. Ajoutez une procédure qui effectue une translation sur un rectangle et une procédure
qui effectue la rotation de 90° ou -90° centrée sur son coin supérieur gauche.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d6>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

7. Combinaisons
-------------------

Reprenez l'exercice précédent. Ajoutez une fonction qui renvoie l'intersection de deux rectangles, et une fonction qui
renvoie la réunion de deux rectangle (c'est à dire le plus petit rectangle qui les contient tous les deux).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<structure/d7>

| :code:`[TAG] IUTSF APL S1 TP17 2019`

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