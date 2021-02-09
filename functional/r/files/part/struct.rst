=============================
Structures et boucles
=============================

Vous n'allez normalement pas utiliser ces structures
ou peut être le :code:`ifelse` mais sinon les fonctions
:code:`apply` suffisent généralement.

Structures de contrôle

	* branchement : :code:`if (condition) { bloc }` ou :code:`if (c){ code } else { code }`
	* branchement (2) : :code:`ifelse(condition, valeur_si_true, valeur_si_false)`
	* branchements : :code:`switch(valeur, possible_valeur_1, ....)`
	* for (a éviter, utiliser les indexes ou un if) : :code:`for(i in vecteur) {}`
	* while : :code:`while(condition) {}`
	* while infini (utiliser break pour quitter) : :code:`repeat {}`

Utile : :code:`next` (passer au suivant), :code:`break` (quitter boucle).

Vous avez des méthodes qui exécutent une fonction f sur tous les
éléments de v.

	* :code:`lapply(v, f)` : retourne une liste
	* :code:`sapply(v, f)` : retourne un vecteur (character)
	* :code:`tapply(v, indices, f)` : indice i et associé à la valeur i du vecteur v après avoir appliqué f. Retourne un tableau.
	* :code:`apply(v, f)` : appliquer a tous les éléments d'une matrice

