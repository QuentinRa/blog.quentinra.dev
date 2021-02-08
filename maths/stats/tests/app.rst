===========================
Tests appariés
===========================

Tests si votre jeu de données contient des données appariés, c'est-à-dire que vous
avez un échantillon A et un échantillon B concernant les mêmes individus (par exemple
a deux moments différents).

Tests de comparaison des médianes
-------------------------------------

| **Objectif** : vérifier si les médianes sont égales sur des données appariées

de Mann–Whitney U (2 médianes)
	| **Fonction** : :code:`wilcox.test(data_before, data_after, paired=TRUE)`

Tests d’égalité de moyennes
-----------------------------

| **Objectif** : vérifier si la moyenne (mu) est la même

de Student T à moyenne fixée (vérifier si la moyenne vaut mu)
	| **Fonction** : :code:`t.test(data_before, data_after, paired=TRUE)`