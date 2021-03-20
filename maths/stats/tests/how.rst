======================
Comprendre les tests
======================

**Théorie des tests d'hypothèses de Neyman–Pearson**

On va poser une hypothèse

	* H0 (statut quo) : ce qui est supposé
	* H1 (but) : ce qu'on veut montrer

On considère deux erreurs possibles

	* alpha : on pense H1 vraie alors que H0 est vraie
	* beta : on pense H0 vraie alors que H1 est vraie

Le lemme de Neyman–Pearson fixe un alpha (généralement 0.05 car 1-0.95=0.05 et
0.95 pour 95% pour un intervalle de confiance à 95%) et on minimise beta.

On va obtenir un :code:`p` (:code:`p-value` dans R), que vous devez interpréter comme suit

	* :code:`p < \alpha` : H1 est vraie
	* :code:`sinon` : H0 est vraie

**Fisher**

Avec fisher, l'interprétation de :code:`p` change. Plus p est petit, est plus le résultat
est probable d'être celui attendu. Et vice-versa.

**Bilan?**

On utilise généralement Fisher, mais lorsqu'on veut être sûr du résultat (parce qu'il y a une décision importante
prise selon le résultat, on utilise les tests d'hypothèses de Neyman–Pearson).

L'idée est que 0.049 est vraie avec Neyman–Pearson mais 0.05 est faux. Ceci est peut être un peu
trop arbitraire et on peut donc éviter de renier une hypothèse est considérer que cela reste
très probable. En revanche, si c'est un résultat important, on va éviter de prendre
des risques et utiliser Neyman–Pearson qui est strict.

**Explications**

Imaginons deux lois (ex: théorie et notre modèle), on va essayer de tester
notre jeu de données avec chaque loi.

Imaginons que nous calculions la probabilité d'un événement :code:`X=n`
selon chaque loi, nous obtenons

	* :math:`P_{théorie}(X=n) = a`
	* :math:`P_{modèle}(X=n) = b`

S'il existe une différence entre a et b (modèle et théorie donc), on peut se demander si

	* H0 : les deux lois sont similaires, c'est le résultat du hasard ?
	* H1 : les deux lois sont différentes, il existe réellement une différence significative

On introduit

	* :math:`m = (a+b)/2` : prends la moyenne
	* :math:`fusion = théorie \cup modèle` : créé un ensemble avec les deux

Si c'est la même loi, alors la probabilité d'avoir n est la moyenne de a et b donc
on a :math:`P_{fusion}(X=n) = m`.

On peut alors calculer :math:`p = P_{ (aN + bN) > |a-b| | m }` soit la probabilité
que que selon nos lois appliquées sur l'ensemble fusion, les probabilités
aN et bN soient plus grandes que la différence des précédents a et b. Si la probabilité
est supérieure à 0.05 alors on accepte H0 donc