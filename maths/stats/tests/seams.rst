=====================
Test d'adéquations
=====================

Les tests d'adéquations (ou ajustement ou de conformité) sont utilisés pour mesurer la possibilité
qu'un échantillon observé et été généré par une loi théorique.

2 tests possibles

	* **test d'adéquation du khi-deux**
	* **test d'ajustement de Kolmogorov-Smirnov**

Il existe des spécialisation de ces tests comme les test de normalités
qui sont des tests d'adéquations dans le cas d'une loi normale.

	* H0 : l'ajustement est correct
	* H1 : l'ajustement n'est pas correct

Test d'adéquation du khi-deux
******************************

:code:`Conditions`
	Au moins 5 individus. Il faut avoir un tableau de contingence des proportions ?

:code:`Description`
	On calcule la différence entre les valeurs théoriques
	et celles observées.

	Pour trouver la loi théorique, il faut deviner le nombre de degrés
	de libertés qui est :code:`n - 1 - [nombre de paramètres de la loi théorique estimé]`.

:code:`Fonction`
	On utilise la fonction :code:`chisq.test(x, p = p)`
	ou avec : :code:`chisq.test(x, p = P, rescale.p = TRUE)`.
	ou avec le calcul de Monte Carlo : :code:`chisq.test(x, p = p, simulate.p.value = TRUE)`.

	p est un vecteur de probabilités (entre 0 et 1) de la même taille que x qui corresponds
	à la probabilité d'avoir chaque valeur de x.

	P à la même sémantique que p mais vous donnez des valeurs entre 0 et 100.

:code:`Note`
	On a généralement deux lois X (1,...,p) et Y (1, ..., q) alors on a une loi du Khi Deux
	qui suit (p-1)(q-1) degrés de liberté (ou alors k-r-1 avec k groupes/classes, r paramètres estimés).

	On note df le degré de liberté qu'il faut vérifier. Si R a échoué
	a trouvé le bon degré, on devra faire le calcul manuellement.

	.. code:: r

		# si R s'est trompé (df invalide), exemple de calcul manuel
		> temp <- sum((obs-théorie)^2/théorie)
		# vous devez donner le vrai df que vous aviez calculé
		> res <- 1-pchisq(temp, df=le_vrai_df)

Test d'ajustement de Kolmogorov-Smirnov
*****************************************

:code:`Conditions`
	???

:code:`Description`
	Généralement, en complément d'un test d'adéquation du khi-deux.
	On compare l'écart maximum entre la fonction de répartition théorie et celle observée.

	Si ajustement à une loi normale, on cela devient un Test de Lilliefors.

:code:`Fonction`
	On utilise la fonction :code:`ks.test(obs, th)`.

----

**Références**
	* https://www.statology.org/kolmogorov-smirnov-test-r/
	* https://www.geeksforgeeks.org/kolmogorov-smirnov-test-in-r-programming/
	* https://www.duclert.org/r-tests-statistiques/test-kolmogorov-smirnov-R.php
	* http://www.jybaudot.fr/Inferentielle/ajuskhidx.html
	* http://www.jybaudot.fr/Inferentielle/kolmogorov.html
	* https://openclassrooms.com/fr/courses/4525306-initiez-vous-a-la-statistique-inferentielle/5016620-decouvrez-les-tests-dadequation-le-khi-deux-et-kolmogorov-smirnov
	* https://fr.linkedin.com/learning/r-les-statistiques-parametriques/tester-l-ajustement-d-une-loi-de-poisson-par-le-khi-deux
	* http://www.unit.eu/cours/cyberrisques/etage_3_frederic/co/Module_Etage_3_22.html