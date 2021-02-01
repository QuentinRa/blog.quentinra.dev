===================================
Statistiques et R
===================================

Les prérequis sont de savoir lire du R (concepts de base et un peu avancés). Attention,
mon niveau de compréhension en statistiques est faible.

1. Introduction
===================

L'objectif des statistiques de depuis des observations (données)
de déterminer une loi de probabilité qui se rapproche aux observations
et de pouvoir déduire ou émettre des hypothèses.

On considère généralement des données de la forme d'une matrice. Les colonnes (j)
sont appelés variables et les lignes (i) sont les individus. La valeur i,j corresponds
à la valeur de la variable j pour l'individu i.

Il arrive assez souvent qu'il manque des données (donc la valeur NA) en
R. Vous pouvez voir avec :code:`summary()` dans chaque colonne la ligne :code:`NA's:<nombre>`
qui indique le nombre de valeurs nulles correspondant à cette variable.

	* solution 1 : supprimer les lignes (et donc perdre beaucoup d'informations)
	* solution 2 : remplacer NA par une valeur (en tenant compte
	* ... d'autres solutions ... ?

2. Recherche de stratégie
============================

Voici un essai d'une stratégie selon mes observations.

	* Objectif 1 : séparation

		* cette partie est "faite" en même temps que notre second objectif
		* je dirais que c'est ici qu'on traite le cas des valeurs NA
		* il faudra découper nos données en 2 catégories -----------voir ci après-----------------

	* Objectif 2 : avoir une idée générale des données que l'on manipule

		* :code:`summary()` : le nombre de NA, les moyennes, ...
		* :code:`head()` : le début donc les premières valeurs
		* :code:`dim()` : savoir combien de lignes/colonnes on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok

	* Objectif 3 : présentation

		* ...

	* Objectif 4 : trouver une loi

		* on peut faire un histogramme, un diagramme de points, ...
		* on peut superposer une loi pour tester
		* pour chercher la loi, on peut essayer des trucs comme

			* si la moyenne est 3 : une loi de poisson de paramètre 3