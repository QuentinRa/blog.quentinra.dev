====================================
ANOVA (Analyse de la variance)
====================================

Anova a permet de comparer une ou plusieurs variables quantitatives
selon une ou plusieurs variables qualitatives. On va donc faire
des groupes de population selon un ou plusieurs critères.

| **Prérequis** : test normalité, égalité des variances

Avant de faire une anova, vous pouvez observer l'échantillon
avec une boxplot (ou plot.design) et regarder s'il est judicieux de continuer.

Anova à un critère/facteur (n quantitative, 1 qualitative)
	.. code:: R

		anova <- aov(ech ~ qual, data=ech)
		summary(anova) # si Pr(>F) < 5% alors différence significative

	Le test compare les moyennes et si il est valide, alors le qualification
	ayant servit à faire les groupes à une influence sur les valeurs
	de la variable quantitative (ech, un dataframe de valeurs).

Anova à deux critères/facteurs (n quantitative, 2 qualitative)
	| **Exemple** : influence de l'Alcool+Vitesse (qual1/qual2) sur le risque d’accident (quant, ici ech)

	.. code:: R

		anova <- aov(ech ~ qual1+qual2, data=ech) # ech par qual1 et ech par qual2
		# ou
		anova <- aov(ech ~ qual1*qual2, data=ech) # équivalent de la ligne suivant (je crois)
		# ou
		anova <- aov(ech ~ qual1+qual2+qual1:qual2, data=ech) # voir explication après
		# puis
		summary(anova) # si Pr(>F) < 5% alors différence significative

	On test l'échantillon ech groupé selon qual1, puis groupé selon qual2 puis groupé
	selon qual1:qual2 (qual1 et qual2) qui corresponds à la valeur i de qual2 mise à la suite de la valeur
	i de qual1.

Tests (des étendues) de Tukey/test DSH
	| **Fonction** : :code:`TukeyHSD(anova)`

	Ce test permet de voir si la différence des moyennes est significative ou non.
	On vérifie que "p adj" est supérieur à 5% sinon le test n'est pas valide.

Test de simultanéité Dunnett
	| **Fonction** (package multicomp) : :code:`glht(anova)`

	Ce test permet de voir si la différence des moyennes est significative ou non. Attention,
	le test utilise un truc aléatoire donc il faut fixer la seed sinon les résultats sont différents
	à chaque appel.