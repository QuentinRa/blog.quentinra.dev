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

de Levene et de Brown-Forsythe
	| **Fonction** (package car) : :code:`leveneTest(quant, qual)`
	| **Fonction** (package lawstat) : :code:`levene.test(quant, qual, location = "median")`

de Bartlett
	| **Fonction** : :code:`bartlett.test(quant, qualif)`
	| **Condition** : plus de 4 individus par échantillon
	| **Robustesse** : #groupes ne doit pas être plus grand/proche de #echantillon

	Pareil que le test de fisher à deux variances par groupes.

Tests d’égalité de moyennes
-----------------------------

| **Objectif** : vérifier si la moyenne (mu) est la même
| **Utilité** : ...
| **Prérequis** : normalité ou plus de 30 individus

de Student T à moyenne fixée (vérifier si la moyenne vaut mu)
	| **Fonction** : :code:`t.test(x=data, alternative="two.sided", mu=valeur)`

de Student T a deux moyennes (homoscédastique)
	| **Fonction** : :code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`
	| **Condition** : variance égales

	Si vous donnez FALSE à var.equal alors le test de Welch serait fait à la place.

Test Z à une moyenne, unilatéral gauche
	| **Fonction** (package BSDA) : :code:`z.test(ech, alternative = "less", mu = mu, conf.level = 0.95)`

Test Z à deux moyennes
	| **Fonction** (package BSDA) : :code:`z.test(ech, alternative = "two.sided", mu = mu, conf.level = 0.95)`

Tests (des étendues) de Tukey/test DSH
	| **Fonction** : :code:`TukeyHSD(anova)`

	Ce test permet de voir si la différence des moyennes est significative ou non.
	On vérifie que "p adj" est supérieur à 5% sinon le test n'est pas valide.

Test d’indépendance
------------------------

| **Objectif** : savoir si des variables sont indépendantes
| **Utilité** : study.test

du Khi deux
	| **Fonction** : :code:`chisq.test(tab,correct=FALSE)`)
	| **Condition** : tab de 2 variables qualitatives
	| **Robustesse** : au moins 5 individus

	On peut regarder le :code:`$expected` pour vérifier ou encore les résidus
	:code:`$residuals` (valeur ij élevé = cette valeur joue un rôle élevé dans la liaison des variables)
	calculés selon la formule :math:`(observed - expected) / sqrt(expected)`.

	Le correct corresponds à la correction de continuité (T=oui, F=non).

de Fisher
	| **Fonction** : :code:`fisher.test(tab)`
	| **Condition** : tab de 2 variables qualitatives (matrice/tableau)

	Très très gourmand en ressources.

Test de valeurs aberrantes/outliers
------------------------------------

| **Objectif** : identifier les valeurs extrêmes
| **Utilité** : identifier (pour supprimer) les valeurs extrêmes

de Grubbs
	| **Fonction** (package outliers) : :code:`grubbs.test(ech, two.sided = TRUE)`

de Dixon
	| **Fonction** (package outliers) : :code:`dixon.test(ech)`