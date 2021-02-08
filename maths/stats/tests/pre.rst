===========================
Tests préliminaires
===========================

Test de normalité
---------------------

| **Objectif** : tester si une distribution suit une loi normale/gaussienne.
| **Utilité** : Vérifier la normalité modèle avant d'appliquer d'autres tests

| de **Shapiro-Wilk** : :code:`shapiro.test()`
| de **Anderson-Darling** (package nortest)  : :code:`ad.test()`
| de **Cramer-von Mises** (package nortest) : :code:`cvm.test()`

Rappel : on peut utiliser une droite de Henry comme outil complémentaire au test (cf QQ-Plot).

Test de comparaison/sur les proportions
-----------------------------------------

| **Objectif** : trouver la proportion d'individus suivant un certain critère
| **Utilité** : vérifier si loi binomiale

	Cas 1 proportion : on a reçu x succès sur n, p=proba et on veut vérifier si c'est vrai.
		| **Fonction** : :code:`prop.test(x,n,p=proba,correct=FALSE)`
		| **Fonction** : :code:`binom.test`

	Cas 2 proportions : on a x succès sur N1 et y sur N2
		| **Fonction** : :code:`prop.test(x=c(x,y), n=c(N1,N2),correct=FALSE)`

Tests d’égalité de\ moyennes
---------------------------------

| **Objectif** :
| **Utilité** :