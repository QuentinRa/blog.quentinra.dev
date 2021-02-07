===========================
Tests appariés
===========================

Tests si votre jeu de données contient des données appariés, c'est-à-dire que vous
avez un échantillon A et un échantillon B concernant les mêmes individus (par exemple
a deux moments différents).

Mann–Whitney U (comparaison de 2 médianes)
	| :code:`Prérequis` : aucun
	| :code:`wilcox.test(data_before, data_after, paired=TRUE)`