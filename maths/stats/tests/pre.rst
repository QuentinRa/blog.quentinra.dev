===========================
Tests préliminaires
===========================

Test de normalité
---------------------

| **Objectif** : tester si une distribution suit une loi normale/gaussienne.
| **Utilité** : Vérifier la normalité modèle avant d'appliquer d'autres tests

| de **Anderson-Darling** (package nortest)  : :code:`ad.test(ech)`
| de **Anderson-Darling** (package ADGofTest)  : :code:`ad.test(ech, pnorm)`
| de **Cramer-von Mises** (package nortest) : :code:`cvm.test(ech)`

| de **Shapiro-Wilk** : :code:`shapiro.test(ech)`
| **Robustesse** : avoir peu de valeurs identiques, plus puissant que les autres

Rappel : on peut utiliser une droite de Henry comme outil complémentaire au tests
de normalité (cf QQ-Plot).

Tests d'égalités de variances
--------------------------------

| **Objectif** : savoir si les variances sont égales
| **Utilité** : test préliminaire de l'ANOVA
| **Prérequis** : normalité, i.i.d

de Fisher (2 variances)
	| **Fonction** : :code:`var.test(x=var1,y=var2)`
	| **Fonction** : :code:`var.test(quant~qualif, data=ech)`

	On peut tester l'égalité de variance entre x,y ou entre
	ou sur x mais groupée selon une formule (formula = critère de groupage).

de Bartlett
	| **Fonction** : :code:`bartlett.test(quant, qualif)`
	| **Condition** : plus de 4 individus par échantillon
	| **Robustesse** : #groupes ne doit pas être plus grand/proche de #echantillon

	Pareil que le test de fisher à deux variances par groupes.

Tests d’égalité de moyennes
-----------------------------

| **Objectif** : vérifier si la moyenne (mu) est la même
| **Utilité** : ???
| **Prérequis** : normalité ou plus de 30 individus

de Student T à moyenne fixée (vérifier si la moyenne vaut mu)
	| **Fonction** : :code:`t.test(x=data, alternative="two.sided", mu=valeur)`

de Student T a deux moyennes
	| **Fonction** : :code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`
	| **Condition** : variance égales