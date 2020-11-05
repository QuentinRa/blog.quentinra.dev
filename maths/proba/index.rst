.. _proba:

================================
Probabilités
================================

1. Espaces de probabilités
================================

1.1 Notations
***************

* :math:`\omega` (petit-omega) un résultat possible
* :math:`\Omega` (omega) l'ensemble des résultats possibles
* A un événement tel que :math:`A \subset \Omega`. :math:`\overline{A}`
  est l'évènement contraire.
* :math:`\emptyset` un événement impossible
* :math:`\mathbb{P}(A)` la probabilité de l'évènement A, comprise entre 0 et 1
* :math:`\mathbb{P}(A) \cap \mathbb{P}(B) = \emptyset` deux événements incompatibles

.. note::

	Le nombre d'éléments d'un ensemble E, appelé cardinal de E est généralement noté \|E\| ou #E ou card(E) ou card E.

1.2 Définitions
*****************

Tribu
	:math:`\mathbb{F}` est une tribu sur :math:`\Omega`, soit un ensemble d'éléments de :math:`\Omega`,
	si

		* :math:`\Omega \in \mathbb{F}`
		* la tribu est stable par complémentaire
		* la tribu est stable par union dénombrable

Probabilité
	| Soit un espace de probabilité :math:`(\Omega, F)`.

	Il s'agit d'une application :math:`\mathbb{P}(F) \to [0,1]`, soit les probabilités des éléments de l'ensemble F
	sont toutes comprises dans l'intervalle 0-1.

	Quelques propriétés :
		* :math:`\mathbb{P}(\Omega) = 1` et :math:`\mathbb{P}(\emptyset) = 0`
		* :math:`\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)`
		* :math:`\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)`
		* :math:`A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)`

Support
	On appelle support d'une loi, l'espace de définition d'une loi de probabilité,
	soit le X dans P(X = x).  Proba en dehors = 0

	Somme dans le support donc que les valeurs possibles.

Loi de probabilité/Densité de probabilité
	Il s'agit d'une application, croissante et à valeur positives telle que
	la somme des valeurs fasse 1.

2. Variable aléatoire discrète (:math:`\Omega` fini)
================================================================

:math:`\Omega` fini
	Un ensemble fini est un ensemble qui est dénombrable. Si Oméga est fini, cela signifie que les probabilités
	sont par exemple dans :math:`\mathbb{N}` ou dans :math:`\mathbb{Z}`.

	Lorsque oméga est fini, on prend :math:`\mathbb{F}=P(\Omega)` soit l'ensemble des parties (donc tous les sous-ensembles
	possibles) d'Oméga.

Loi discrète
	On définit :math:`\mathbb{P}_{X_w}{k} = \mathbb{P}(X_w=k)` la probabilité que :math:`X_w` prenne la valeur k.

	.. note::

			w est optionnel s'il n'y a qu'une seule loi X.

.. note::

	Dans le cas discret, la tribu étant l'ensemble de parties d'Oméga, on peut écrire l'espace
	de probabilité :math:`(\Omega, \mathbb{P})` au lieu de :math:`(\Omega, \mathbb{F}, \mathbb{P})`

2.1 Probabilités
******************

Probabilité conditionnelle
	Soit A et B deux évènements, il est possible de calculer la probabilité de A sachant celle de B

	.. math::

		\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}

	.. note::

		Par produit en croix, on obtient :math:`\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)`.

Formule de Bayes
	On déduis depuis la formule de la probabilité conditionnelle, la formule suivante appelée formule de bayes

	.. math::

		\mathbb{P}(A|B) := \frac{\mathbb{P}(B) * \mathbb{P}(A|B)}{\mathbb{P}(B)}

Probabilité uniforme
	Soit :math:`\Omega` fini et dénombrable, :math:`\forall{w} \in \Omega \ alors \ \mathbb{P}(w) = \frac{1}{card(\Omega)}`.

	Dans ce cas, :math:`\mathbb{P}(A) = \frac{card(A)}{card(\Omega)} = \frac{|A|}{|\Omega|}`

2.2 Variables aléatoires indépendantes
*****************************************

Variables aléatoires indépendantes
	Les variables :math:`X_1, ..., X_n` sont indépendantes (noté :math:`\perp` (perp)) si

	.. math::

		\mathbb{P}(X_1, ..., X_n = xn) = \prod_{i=1}^n \mathbb{P}(X_i = xi)

	.. note::

		En texte, la probabilité des événements :math:`X_1, ..., X_n` est égale au
		produit des probabilités de chaque événement.

		.. code-block:: c

				//on lance 1 dé, 1 pièce, 1 dé
				//la probabilité pour la somme des dés dépends de 2 événements disjoints (1er et 3e)
				p(somme dés = 7, pièce = F) = 1/6 * 1/2

				//p(A) = |A|/|Ω| = |toutes les combinaisons qui font 7| / |toutes les combinaisons possibles|
				p(somme dés=7) = (p(6+1) + p(2+5) + p(4+3) +
 						p(1+6) + p(5+2) + p(3+4))
 						/ (6*6) //6 possibilités au premier lancé, 6 au second
 				= 6/36 = 1/6

2.3 Lois de probabilités
************************************

2.3.1 Loi binomiale
------------------------

Une loi binomiale notée B(n,p) correspond au nombre de succès sur n épreuves, avec une probabilité
p de succès.

.. math::

	\begin{cases}
	\mathbb{P}(X=k) = 0 & si & k > n  \\
	\mathbb{P}(X=k) =  C_n^k p^k(1-p)^{n-k}  & sinon  \\
	\end{cases}

.. note::

	Il faut lire ici
		* Si k (nombre de succès) est plus grand que n (nombre d'épreuves), alors la probabilité d'avoir k succès sur n est 0
		* sinon, alors on multiplie la probabilité d'avoir k succès (:math:`p^k`) par la probabilité d'avoir n-k échecs (:math:`(1-p)^{n-k}`).

			* on a n-k échecs car on a pris les k premiers tirages bons (succès) car on veut k succès donc le reste des n tirages sont forcément des échecs
			* on doit cependant multiplier le tout par les permutations de notre tirage (:math:`C_n^k`)

2.3.2 Loi de poisson
------------------------

L'objectif est de trouver le nombre de succès sachant un certain nombre d'épreuves n indépendantes.
On suppose n, le nombre d'épreuves, très grand et p, leur probabilité, très petite.

Notation : :math:`\lambda` ~ :math:`\mathbb{P}(\lambda)`

Loi de poisson : :math:`\mathbb{P}(X=k) = \frac{\lambda^k *  e^{-\lambda}}{k!}`

| Espérance : E(X) = np = :math:`\lambda`
| Variance : :math:`\sigma = \frac{\lambda}{n}`

.. hint::

	Ceci se démontre avec la formule de l'espérance.

		:math:`\sum_{k \in \mathbb{N}} k * P(X=k)`

		:math:`= \sum_{k \in \mathbb{N}} k *  \frac{\lambda^k *  e^{-\lambda}}{k!}`

		:math:`= \sum_{k \in \mathbb{N}} k *  \frac{\lambda^k *  e^{-\lambda}}{k!}`

		:math:`= e^{-\lambda} * \sum_{k \in \mathbb{N}}  \frac{\lambda^k}{(k-1)!}`

		:math:`= \lambda e^{-\lambda} * \sum_{k \in \mathbb{N}} \frac{\lambda^{k-1}}{(k-1)!}`

		par développement en série de e^x`

		:math:`= \lambda e^{-\lambda} * e^{\lambda}`

		:math:`= \lambda e^{-\lambda+\lambda} =`

		:math:`= \lambda e^{0}`

		:math:`= \lambda * 1`

		:math:`= \lambda`

2.3.3 Loi géométrique
------------------------

On fait n tirages sans remise. La loi géométrique permet de déterminer le premier succès

Notation : T ~ :math:`G(p)`

Loi géométrique : :math:`\mathbb{P}(X=k) = (1-p)^{k-1}p`

| Espérance : :math:`\mathbb{E}(X) = \ \frac{1}{p}`
| Variance : :math:`\mathbb{V}(X) = \ \frac{1-p}{p^2}`

2.4 Espérance
******************

2.4.1 Définition
------------------------

Espérance
	On définit l'espérance (~moyenne) notée :math:`\mathbb{E}(X)` ou :math:`\mathbb{E}X` ou :math:`\mathbb{E}[X]`

	.. math::

		\sum_{x_i \in \Omega}^{} x_i \mathbb{P}{(X_w = x_i )}

	.. note::

		Cette formule dit que l'espérance c'est la somme de chacune des valeurs d'Oméga multiplié par
		sa probabilité.

	L'espérance est

		* Linéaire : :math:`\mathbb{E}[X, \lambda Y] = \mathbb{E}[Y] + \lambda \mathbb{E}[Y]`
		* Positive : Si X vad positive, ps :math:`\mathbb{E}(X) \ge 0`
		* Croissante : :math:`X \ge Y` ps :math:`\mathbb{E}(X) \ge \mathbb{E}(Y)`
		* indépendante, alors :math:`\mathbb{E}[X * Y] = \mathbb{E}[X] * \mathbb{E}[Y]`

	.. note::

		| ps est l'abréviation de presque sûr.
		| , (virgule) se lit "et" donc plus (+)

2.4.2 Inégalités
------------------------

Tchebychev
	Si a > 0 alors :math:`\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[X^2]}{a^2}`

Jensen
	X intégrable et :math:`\varphi` converge alors :math:`\mathbb{E}[\varphi(x)] > \varphi (\mathbb{E}[X])`

Cauchy-Schwarz
	Soit deux v.a. X, Y alors :math:`\mathbb{E}[XY]^2 \le \mathbb{E}[X^2] * \mathbb{E}[Y^2]`

Markov
	:math:`\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[ |X| ]}{a}`

2.5 Variance et co-variance
************************************

2.5.1 Variance de X
------------------------

Il s'agit de l'écart autour de la moyenne.

.. math::

	V(X) = \mathbb{E}[(X - \mathbb{E}[X])^2]

	V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2

Propriétés de la variance

	* :math:`V(a + \lambda X^2) = \lambda^2 V(X)`
	* :math:`V(X + Y) = V(X) + V(Y) - 2cov(XY)` (voir co-variance)

2.5.2 Co-variance (ou covariance)
-----------------------------------

La covariance permet de calculer la variation et l'indépendance de deux
variables aléatoires.

.. math::

	cov(x,y) = \mathbb{E}[ ( X - \mathbb{E}[X]) (Y - \mathbb{E}[Y]) ]

	cov(x,y) = \mathbb{E}[XY] - \mathbb{E}[X] \mathbb{E}[Y]

Propriétés de la variance

	* cov(X,X) = V(X)
	* cov(X,Y) = cov(Y,X)
	* :math:`cov(\lambda * X,Y) =  \lambda *cov(Y,X)`
	* si a et b sont indépendants (:math:`\perp`) alors cov(XY) = 0 (réciproque n'est pas vraie)
	* :math:`\mathbb{P}(X, Y) = \frac{cov(X,Y)}{\sqrt{V(X)*V(Y)}}`

3. Variables à densité/continues
===================================

Une variable à densité ou continue est une variable
aléatoire qui prends des valeurs dans :math:`\mathbb{R}`.

On note généralement :math:`f_X(x)` notre variable aléatoire qui suit la loi
X.

Calculer la probabilité la probabilité que P(X=x) revient à calculer
l'air sous la courbe de :math:`f_X(x)` soit une intégrale.

On a les propriétés suivantes :

	* :math:`\mathbb{P}(X \in A) = \int_{x \in \Delta A}^{} fxdx`
	* densité/loi de proba si :math:`\int_{-\infty}^{+\infty} fxdx = 1`
	* P(X=valeur) = 0
	* :math:`\mathbb{P}(a \le X \le b) = \int_{a}^{b} fxdx`
	* la fonction doit être positive

3.1 Fonction de répartition
******************************

La fonction :math:`F_x(x)` est définie par :math:`F_X(x) = P(X \le x)`.

On a les propriétés suivantes :

	* :math:`\mathbb{P}(X \le x) := \mathbb{P}(X < x)`
	* :math:`0 \ge F_X(x) \ge 1`
	* F est croissante et continue à droite
	* :math:`\lim_{x \rightarrow +\infty}F(x) = 1`
	* :math:`\lim_{x \rightarrow -\infty}F(x) = 0`
	* Si A_n suite monotone, P(\lim_{n \rightarrow +\infty} A_n) = \lim_{n \rightarrow +\infty} A_n * P(A_n)

Théorème de transfert
	Le théorème de transfert consiste à prendre une variable aléatoire, lui
	appliquer une fonction et obtenir une nouvelle valeur aléatoire.

3.2 Espérance et variance
******************************

Espérance
	Soit :math:`f_X(x)` une fonction de densité intégrable (les densités non intégrables n'ont pas d'espérance),
	on définit

	.. math::

		\mathbb{E}[X] = \int_{-\infty}^{+\infty} xf(x)dx

	Remarques

		* E(X) = 0, alors X est centrée
		* E(X) est finie, alors X peut être centrée

Variance
	Soit :math:`f_X(x)` une fonction de densité intégrable, on définit

	.. math::

		V[X] = \int_{-\infty}^{+\infty} (x-\mathbb{E}[X])^2f(x)dx

3.3 Loi usuelles
******************************

3.3.1 Loi uniforme
-------------------------------------

Une loi uniforme sur un interval [a,b] a pour densité

.. math::

	f(x) = \frac{1}{b-a} {\bf 1}\!\!{\rm 1}_{[a,b]}x

3.3.2 Loi gaussienne
-------------------------------------

La loi normale, notée :math:`N(m,\sigma^2)` avec m la moyenne et sigma la variance à pour densité

.. math::

	f(x) = \frac{1}{\sqrt{2\pi\sigma^2}} * e^{ -\frac{1}{2} (\frac{x-m}{\sigma})^2 }

Loi normale centée réduite, N(0,1) à pour densité

.. math::

	f(x) = \frac{1}{\sqrt{2\pi}} e^{-\frac{1}{2} x^2}

On utilise généralement la forme :math:`\frac{X-m}{\sigma}` pour centrer réduire la loi.

3.3.3 Loi exponentielle
-------------------------------------

La loi exponentielle :math:`\epsilon(\lambda)` est définie par la loi  de densité

.. math::

	f(x) = \lambda e^{-\lambda{x}} {\bf 1}\!\!{\rm 1}_{\mathbb{R}^+}x

:math:`E[X] = \frac{1}{\lambda}`.

3.3.4 Loi de Cauchy
-------------------------------------

La loi de cauchy est définie par la densité suivante, sachant a>0

.. math::

	f(x) = \frac{a}{\pi} \frac{1}{x^2+a^2}

:math:`E[X] = existe\ pas`.

5. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Dénombrement                              <exercices/count>
		Probabilités conditionnelles              <exercices/condition>
		Loi de probabilités                       <exercices/loi>
		Non triés                                 <exercices/non_rank>

|
|


------

**Crédits**
	* Oleg LOUKIANOV (enseignant à l'IUT de Sénart-Fontainebleau)
	* Vathana LY VATH (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* Tribu et Tribu borélienne
		* http://www.les-mathematiques.net/phorum/read.php?3,779703,779703
		* http://dictionnaire.sensagent.leparisien.fr/Tribu%20bor%C3%A9lienne/fr-fr/
		* https://www.techno-science.net/definition/5291.html
		* https://www.ilemaths.net/sujet-tribu-borelienne-402711.html
		* https://fr.wikipedia.org/wiki/Tribu_bor%C3%A9lienne
		* Discord: Yann J#2613 et FennecFeu#4212
	* Lois
		* http://www.math.univ-toulouse.fr/~rau/retro%20stat%20inf/c1.pdf
		* https://misterprepa.net/les-lois-discretes-formules-mathematiques/
		* http://maths.cnam.fr/Membres/ghorbanzadeh/lois.pdf
		* https://fr.wikipedia.org/wiki/Loi_de_probabilit%C3%A9#Lois_discr%C3%A8tes
		* https://fr.wikipedia.org/wiki/Loi_de_probabilit%C3%A9_marginale
		* https://fr.wikipedia.org/wiki/Loi_de_Bernoulli
		* https://fr.wikipedia.org/wiki/Liste_de_lois_de_probabilit%C3%A9
		* https://fr.wikipedia.org/wiki/Loi_g%C3%A9om%C3%A9trique
		* https://fr.wikipedia.org/wiki/Loi_normale#Loi_normale_centr%C3%A9e_r%C3%A9duite
		* https://fr.wikipedia.org/wiki/Fonction_gaussienne
		* https://fr.wikipedia.org/wiki/Loi_normale
		* https://fr.wikipedia.org/wiki/Loi_exponentielle
		* Poisson

			* https://www.techno-science.net/definition/6212.html
			* http://www.jybaudot.fr/Probas/parampoisson.html

	* Espérance, variance et covariance
		* https://www.techno-science.net/definition/5950.html
		* https://fr.wikipedia.org/wiki/Formulaire_de_d%C3%A9veloppements_en_s%C3%A9ries
		* https://fr.wikiversity.org/wiki/S%C3%A9rie_enti%C3%A8re
		* https://fr.wikipedia.org/wiki/Covariance
		* http://dictionnaire.sensagent.leparisien.fr/Variance%20(statistiques%20et%20probabilit%C3%A9s)/fr-fr/

	* autre
		* http://atomurl.net/math/