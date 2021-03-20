=========================================
Test de comparaison de deux moyennes
=========================================

Quatre tests possibles

	* **de Student T à moyenne fixée**
	* **de Student T a deux moyennes**
	* **Test Z à une moyenne**
	* **Test Z à deux moyenne**

Je crois qu'un test d'égalité des moyennes peut nous aider à vérifier si est possible que moyenne
estimée soit celle d'un échantillon par exemple.

Test T de Student a deux moyennes
***********************************

:code:`Conditions`
	Distribution normale et généralement plus de 30 individus. Et les variances sont égales (~voir fonction).

:code:`Description`
	Ce test est également appelé test de student homoscédastique lorsque les variances sont égales

:code:`Fonction`
	La fonction est :code:`t.test(x=data1, y=data2, alternative="two.sided", var.equal=TRUE)`.

	Si vous donnez FALSE à var.equal alors le **test de Welch** serait fait à la place.