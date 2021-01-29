=============================
Opérations et Structures
=============================

Les opérations sont

	* les basiques : :code:`+,-,/,*`, :code:`nombre^puissance`, :code:`%%` (modulo), :code:`%/%` (division entière)
	* l'assignation : :code:`variable <- valeur` (= marche mais à éviter)
	* autre : :code:`sqrt, abs, log, xor, sum, ...`
	* concatenation (string) : :code:`paste(string, string, ...)`
	* vecteurs : :code:`a %in% v` (test si a dans vecteur v)

Les comparateurs sont

	* les basiques : :code:`>, >=, <=, <, ==, !=`
	* ou logique : :code:`|` (tester une condition vraie) [#3]_
	* et logique : :code:`&` (tester plusieurs conditions vraies) [#3]_
	* négation : :code:`!` (inverse le résultat de la condition)

.. [#3] Les symboles :code:`&&` et :code:`||` existent et font pareil que :code:`&` et :code:`|`.
	La seule différence est que dans le cas d'un vecteur, && et || font le et/ou uniquement sur le
	premier élément (donc cela ne retourne pas un vecteur).

Structures de contrôle

	* branchement : :code:`if (condition) { bloc }` ou :code:`if (c){ code } else { code }`
	* branchement (2) : :code:`ifelse(condition, valeur_si_true, valeur_si_false)`
	* branchements : :code:`switch(valeur, possible_valeur_1, ....)`
	* for (a éviter, utiliser les indexes) ou un if : :code:`for(i in vecteur) {}`
	* while : :code:`while(condition) {}`
	* while infini (utiliser break pour quitter) : :code:`repeat {}`

Utile : :code:`next` (passer au suivant), :code:`break` (quitter boucle).

Vous avez des méthodes qui exécutent une fonction f sur tous les
éléments de v et

	* :code:`lapply(v, f)` : retourne un vecteur
	* :code:`sapply(v, f)` : retourne une matrice
	* :code:`tapply(v, f)` : retourne un data.frame
	* :code:`apply(v, f)` : retourne ...
