================================
Listes chainées
================================

Niveau débutant
***********************

1. Maximum
------------------

Écrivez un programme qui crée une liste contenant 10 entiers de type unsigned short choisis aléatoirement entre 111 et 999,
et qui affiche ensuite le contenu de la liste, puis (à part) le plus grand élément qu'elle contient.

La création (et la destruction) de la liste, son affichage et la recherche de son plus grand élément devront prendre
la forme de fonctions distinctes.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d1>

| :code:`[TAG] IUTSF APL S1 TP22 2019`

2. Circulation
------------------

Écrivez une fonction qui retire le dernier élément d'une liste, et partant de là une autre fonction qui effectue
une permutation circulaire sur une liste (tous les éléments avancent d'une position, le dernier élément se retrouve au début).

Écrivez une fonction qui ajoute un élément à la fin d'une liste, et une fonction qui retire le premier
élément d'une liste. Écrivez ensuite une fonction qui applique à une liste une permutation circulaire dans
le sens inverse (tous les éléments reculent d'une position, le premier élément se retrouve à la fin).

Testez vos fonctions dans un programme qui crée une liste comme au premier exercice et qui permet à l'utilisateur
de lui appliquer une rotation de son choix.

.. code:: none

		bob@box:~$ ./a.out
		181 572 648 251 994 637 518 249 175 321
		choisissez une rotation : -5
		637 518 249 175 321 181 572 648 251 994

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d2>

| :code:`[TAG] IUTSF APL S1 TP22 2019`

3. Sélection
------------------

Écrivez une fonction qui ordonne une liste par la méthode du tri par sélection. Pour cela, la liste de départ sera
considérée comme la «liste non triée». On crée une nouvelle liste dite «liste triée», qui est initialement vide.

	*	On retire le plus grand élément de la liste non triée,
	*	On ajoute cet élément au début de la liste triée,
	*	On recommence jusqu'à avoir vidé la liste non triée.

Écrivez un programme qui teste cette fonction sur une liste générée comme au premier exercice.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d3>

| :code:`[TAG] IUTSF APL S1 TP22 2019`

4. Arc-en-ciel
------------------

Une liste chaînée circulaire est une liste où le dernier élément ne contient pas NULL dans son champ suivant,
mais plutôt l'adresse du premier élément. On obtient ainsi une chaîne qui boucle sur elle-même, et que l'on peut donc parcourir
sans fin.

Écrivez un programme qui affiche dans une fenêtre graphique un texte (passé en argument de la ligne de commande) dont les lettres
alternent parmi les 7 couleurs de l'arc-en-ciel. Les couleurs en question seront stockées dans une liste circulaire.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d4>

| :code:`[TAG] IUTSF APL S1 TP22 2019`

5. Anneaux
------------------

On souhaite représenter l'anneau ℤ/nℤ par une liste doublement chaînée circulaire. Dans une liste doublement chaînée,
chaque maillon contient l'adresse du maillon suivant et l'adresse du maillon précédent.

Écrivez la définition d'un élément de l'anneau (c'est à dire un maillon). Écrivez ensuite les fonctions suivantes :

	*	une fonction qui crée l'anneau (c'est à dire la liste chaînée avec tous ses maillons),
	*	une fonction qui affiche un élément,
	*	une fonction qui donne le successeur d'un élément,
	*	une fonction qui donne le prédécesseur d'un élément,
	*	une fonction qui teste si un élément est nul.

Enfin, en n'utilisant que les fonctions ci-dessus et aucune opération arithmétique, écrivez une fonction qui représente
l'addition et une fonction qui représente le produit dans cet anneau.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d5>

| :code:`[TAG] IUTSF APL S1 TP22 2019`

6. Chaînes
------------------

En C, les chaînes de caractères ne sont pas des listes chaînées, étrangement. Mais nous pouvons arranger ça :
écrivez les définitions nécessaires pour représenter une chaîne de caractères comme une liste chaînée où
chaque maillon contient un unique caractère.

Écrivez ensuite une fonction qui transforme une chaîne tableau en une chaîne liste,
et une fonction qui fait l'inverse. Testez-les.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d6>

| :code:`[TAG] IUTSF APL S1 TP23 2019`

7. Extensions
------------------

Si nous souhaitons utiliser les chaînes définies à l'exercice précédent, il faut pouvoir remplacer complètement
les anciennes chaînes. Écrivez donc des fonctions qui procurent pour les nouvelles chaînes les fonctionnalités de puts et fgets.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d7>

| :code:`[TAG] IUTSF APL S1 TP23 2019`

8. Raffinements
------------------

Les nouvelles chaînes introduites à l'exercice 1 n'ont pas encore à leur disposition toutes les opérations disponibles
avec les chaînes traditionnelles. Ajoutez des fonctions qui remplacent strlen, strcpy, strcat et strcmp.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d8>

| :code:`[TAG] IUTSF APL S1 TP23 2019`

9. Crible
------------------

Le Crible d'Euler est une variante du Crible d'Ératosthène. On souhaite afficher la liste de tous les nombres premiers
jusqu'à 1000. Pour cela, on crée une liste de tous les entiers entre 2 et 1000.

Le premier élément est forcément premier et on peut l'afficher. En multipliant cet élément par tous les éléments
de la liste (y compris lui-même), on identifie des maillons à retirer de la liste. Une fois la liste purgée,
le premier élément est forcément le prochain nombre premier, et on peut donc recommencer. Et ainsi de suite jusqu'à vider
entièrement la liste.

Écrivez un programme qui met en oeuvre cet algorithme.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<linked/d9>

| :code:`[TAG] IUTSF APL S1 TP23 2019`

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