================================
Test sur les données appariées
================================

Tests si votre jeu de données contient des données appariés, c'est-à-dire que vous
avez un échantillon A et un échantillon B concernant les mêmes individus (par exemple
a deux moments différents).

Nous avons deux tests sur la moyenne

	* **Student T à moyenne fixée**
	* **test des signes**

Student T à moyenne fixée
*************************

:code:`Conditions`
	Données appariées.

:code:`Fonction`
	La fonction est :code:`t.test(data_before, data_after, paired=TRUE)`.

Test des signes
*************************

:code:`Conditions`
	Données appariées.

:code:`Description`
	On considère l'échantillon avant/après, on compare les classements et on met un + si
	un individu monte, - s'il descends et on le retire s'il ne bouge pas. S'il y a autant de + que de - alors la
	médiane de la distribution n'a pas changée.

:code:`Fonction`
	La fonction :code:`SIGN.test(data, md = med, alternative = "two.sided", conf.level = 0.95)`)
	du package :code:`BSDA`.