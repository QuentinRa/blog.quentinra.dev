=========================================
Test de comparaison de deux moyennes
=========================================

Cinq tests possibles

	* **de Student T à moyenne fixée**
	* **de Student T a deux moyennes**
	* **de Mann–Whitney (Wilcoxon)**
	* **Test Z à une moyenne**
	* **Test Z à deux moyenne**

Je crois qu'un test d'égalité des moyennes peut nous aider à vérifier si est possible que moyenne
estimée soit celle d'un échantillon par exemple.

Test T de Student a deux moyennes
***********************************

:code:`Conditions`
	Distribution normale et généralement plus de 30 individus.

	Les variances doivent être égales (si c'est pas le cas, R utilisera un test alternatif)
	et vous pouvez le "vérifier" avec un test ou alors
	en regardant si les écarts types sont "a peu près" les mêmes (à vous de décider
	c'est quoi "à peu près"...).

:code:`Description`
	Ce test est également appelé test de student homoscédastique lorsque les variances sont égales

:code:`Fonction`
	| La fonction est :code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`.
	| Ou alors :code:`t.test(quant~qual, alternative="two.sided", var.equal=TRUE)`.
	| Ou encore :code:`t.test(quant~qual, var.equal=TRUE)`.

	Si vous donnez FALSE à var.equal alors le **test de Welch** serait fait à la place.

de Student T à moyenne fixée
***********************************

:code:`Conditions`
	Distribution normale et généralement plus de 30 individus.

:code:`Fonction`
	| La fonction est :code:`t.test(x=ech, alternative="two.sided", mu=moyenne)`
	| ou simplement :code:`t.test(ech, mu=moyenne)`

	On a ici les hypothèses

		* H0 : la moyenne vaut mu
		* H1 : la moyenne ne vaut pas mu

	et data notre jeu de données.

de Mann–Whitney (Wilcoxon)
****************************

:code:`Conditions`
	Marche si moins de 30 individus	et si les populations ne sont pas de la même taille.
	Si vous avez plus de 50 individus alors en R, il va retourner une approximation.

	Il me semble que faire un test de Mann–Whitney (Wilcoxon) c'est uniquement pour les variables
	qui ne suivent pas une loi normale.

:code:`Description`
		Selon Wikipédia, les noms alternatifs sont

			* test de Wilcoxon-Mann-Whitney
			* test de Mann–Whitney–Wilcoxon (MWW)
			* test U de Mann-Whitney
			* test de la somme des rangs de Wilcoxon

	On classe les individus en rangs et on regarde si en moyenne, le rang
	d'un groupe est supérieur à celui d'un autre.

:code:`Fonction`
	| La fonction est :code:`wilcox.test(quant~qual, data=ech, paired=FALSE, exact=FALSE)`
	| ou :code:`wilcox.test(quant~qual)` tout simplement.

Test Z à une moyenne, unilatéral gauche
******************************************

:code:`Conditions`
	On suppose la loi normale ou un échantillon grand.

:code:`Fonction`
	La fonction est :code:`z.test(ech, alternative = "less", mu = mu, conf.level = 0.95)`
	du package :code:`BSDA`.

Test Z à deux moyennes
************************

:code:`Conditions`
	On suppose la loi normale ou un échantillon grand.

:code:`Fonction`
	La fonction est :code:`z.test(ech, alternative = "two.sided", mu = mu, conf.level = 0.95)`
	du package :code:`BSDA`.

----

**Références**
	* http://www.jybaudot.fr/Inferentielle/compmoyind.html
	* http://www.jybaudot.fr/Inferentielle/testz.html