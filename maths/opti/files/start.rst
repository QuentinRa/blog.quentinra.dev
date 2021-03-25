=============================
Initiation à l'optimisation
=============================

Vos étapes, sont depuis le modèle (votre texte avec votre problème)

	* trouver vos variables de décisions : x,y, ... (pas x1 x2 c'est pas lisible)
	* trouver la fonction objective : :math:`f(x)`, votre fonction à optimiser, souvent de la forme :math:`f(x) = a x + b y + ...`
	* trouver d'éventuelles contraintes (:math:`x+y \le 1`, :math:`x \in X`, ...)

Une fois ceci fait, vous aurez probablement à adapter votre système, pour que votre logiciel puisse le lire
(par exemple certains ne supporte que des contraintes :math:`\le` donc pas de :math:`=` ou :math:`\ge`...).
Puis ce que ce n'est pas le sujet principal, l'implémentation venant en dernier, regardez
la partie 5 si c'est votre objectif.