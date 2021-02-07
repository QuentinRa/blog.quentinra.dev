===================================
Statistiques et R
===================================

Les prérequis sont de savoir lire du R (concepts de base et un peu avancés).

1. Introduction
===================

L'objectif des statistiques est depuis des observations (=données=Data)
d'une population (pas forcément humaine),
de déterminer des caractéristiques puis une loi de probabilité qui est proche des observations
ce qui nous permettra de déduire ou émettre des hypothèses.

Population
	On considère nos données comme ceux d'une population. Il s'agit généralement
	d'une matrice.

Variables
	Il s'agit généralement des colonnes (j) de la matrice. Elles sont
	qualitatives ou quantitatives.

Individu
	Il s'agit d'une ligne (i) de la matrice. Ainsi, la valeur
	i,j corresponds à la valeur de la variable j pour l'individu i.

Valeur
	La valeur i,j corresponds à la valeur de la variable j pour l'individu i.
	On note NA l'absence de valeur.

Échantillon (représentatif)
	Il s'agit d'une sous-partie de la population. Généralement, il faut que les variables
	aléatoires soient indépendantes et identiquement distribuée (i.i.d) sinon cela
	pourra fausser des test (utiliser :code:`sample()`).

Modèle
	On appelle modèle nos hypothèses sur la distribution de l'échantillon. Il s'agit
	généralement d'une loi de probabilité avec ses paramètres.

Données appariés
	Si vous avez deux jeux de données concernant les mêmes individus (mais par exemple
	a deux moments différents) alors on parle de données appariés. Ces données ont leur
	propres tests car il ne respectent pas le critère d'indépendance par exemple.

On rappelle la fonction :code:`data("data_set")` qui importe un dataset
depuis un nom ou liste les dataset disponibles.

Pour la suite, on considère data : notre jeu de données, ech = échantillon
et var : une variable (qualitative/quantitative), quant : une variable
quantitative et qual : une variable quantitative.

2. Recherche d'une stratégie d'analyse
============================================

J'essaye actuellement d'élaborer un plan pour analyser les données.

	* Objectif 1 : Découverte, il s'agit de comprendre ce qu'on manipule

		* identifier s'il y a des valeurs NA et les gérer
		* extraire l'échantillon d'analyse
		* identifier le nombre d'individus/variables
		* identifier le type des variables
		* identifier les potentielles points à étudier
		* transformer des variables (qualitatives->quantitatives ou inverse)

	* Objectif 2 : Statistique descriptive (analyse de la distribution)

		* on cherche à trouver des propriétés (modèle) de notre distribution
		* on va faire plein de graphiques (histogramme, ...) et observer
		* on regarde si notre distribution suit une loi normale
		* on regarde si nos variables sont indépendantes
		* on peut observer les moments
		* on peut superposer une loi pour tester

	* Objectif 3 : Statistiques inférentielle (test du modèle)

		* on va faire des tests pour vérifier notre modèle
		* un test ne suffit pas à conclure
		* il faudra ensuite tester le modèle sur un autre échantillon

Découverte
=========================

Extraire un échantillon
	On va généralement faire un échantillon (:code:`ech <- sample(data, size)`)
	de 75% de nos données pour avoir une majorité de données servant à construire notre modèle (apprentissage) et un autre
	set d'observations permettant de vérifier notre modèle (validation).

Gérer les valeurs NA
	Vous pouvez voir le nombre de valeurs NA avec :code:`sum(is.na(ech$var))` (pour chaque
	variable qui retourne le nombre de NA), ou alors :code:`summary(ech)` (retourne dans
	:code:`NA's:<nombre>` le nombre de NA par colonne) ou encore graphiquement
	:code:`library(visdat);vis_miss(ech)`.

		* solution 1 : supprimer les lignes (et donc perdre beaucoup d'informations)
		* solution 2 : remplacer NA par une valeur (en tenant compte des autres valeurs pour ne rien fausser)
		* ... d'autres solutions ... ?

Fonctions utiles
		* :code:`summary()` : le nombre de NA, les moyennes, ...
		* :code:`view()` : afficher (graphiquement)
		* :code:`head()` : le début donc les premières valeurs
		* :code:`dim()` : savoir combien de lignes=individus/colonnes=variables on manipule
		* :code:`names()` : savoir les noms des variables manipulées
		* :code:`str()` : voir les types des variables et une idée des valeurs prises
		* :code:`complete.cases()` : le nombre de lignes sans NA donc ok
		* :code:`range()` : retourne le min et le max
		* D'autres fonctions : :code:`var, sd, quantile, ...`

Statistique descriptive
=========================

...

Statistiques inférentielle
=============================

...

-----

**Crédits**

	* Nicolas BRUNEL (enseignant à l'ENSIIE)
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* "Initiation à R" de Eric Preud’homme (Université du Havre)
	* "OperaMagistris" de Vincent ISOZ
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**

	* http://www.jybaudot.fr/Inferentielle/ajuskhidx.html
	* https://fr.wikipedia.org/wiki/Test_F
	* https://en.wikipedia.org/wiki/Nonparametric_statistics
	* http://www.unit.eu/cours/cyberrisques/etage_3_frederic/co/Module_Etage_3_22.html
	* https://support.minitab.com/fr-fr/minitab/18/help-and-how-to/modeling-statistics/anova/supporting-topics/basics/understanding-test-for-equal-variances/
	* http://foucart.thierry.free.fr/StatPC/livre/chapitre6/fisher.htm
	* http://www.sthda.com/french/wiki/visualiser-une-matrice-de-correlation-par-un-correlogramme
	* https://fr.wikipedia.org/wiki/Plan_d%27exp%C3%A9riences