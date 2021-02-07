===================================
Lois de probabilités (rappels)
===================================

Une fonction de distribution (~loi de probabilité)
est une fonction permettant de représenter un ensemble
connu de valeurs prises par une distribution (droite/courbe/...).

Elles permettent de déterminer la fréquence (probabilité/probabilité_totale)
pour une distribution de prendre une valeur.

Support d'une loi
	On parle de support, domaine de définition
	pour parler de l'ensemble des valeurs pouvant être prises par une loi.
	Si la support est fini, alors on peut calculer l'étendue ou la dispersion
	avec max-min.

Indépendantes et identiquement distribuées (i.i.d)
	Des variables sont dites i.i.d si elles suivent la même fonction de distribution
	et sont indépendantes. C'est un critère important pour que certains calculs
	restent vrais.

Loi binomiale
-------------------

On cherche la probabilité d'avoir k succès sur n épreuves avec probabilité de p succès
et q=1-p d'échec.

.. math::

	P(X=k) = p^k q^{n-k} * C^k_n` \\
	E(X) = np \\
	V(x) = npq

Loi cauchy
-------------------

La loi de cauchy n'a ni espérance ni variance.

Loi khi-deux
-------------------

Il s'agit d'une loi de la somme des carrés de k loi normales
centrées réduites indépendantes, avec k le degré de liberté (ddl ou df).

Il s'agit d'une loi Gamma de paramètres k_gamma=k/2
et de theta = 1/2.

.. math::

		E(X=k) = k \\
		V(X=k) = 2k

Loi exponentielle
-------------------

.. math::

	P(X=k) = \lambda * e^{-\lambda{x}} * \mathbb{1}_{[0,+\infty]} \\
	E(x) = 1/\lambda \\
	V(x) = 1/\lambda^2

Loi F/Loi de Fisher
---------------------

Elle est construite depuis deux variables aléatoires indépendantes
suivant une loi du khi-deux à respectivement d1 et d2 degrés de liberté
(on note F(d1,d2)).

.. math::

	E(x) = d2/(d2-2) \\
	V(x) = compliquée

Loi Gamma
-------------------

Une loi gamma possède un paramètre k (nombre de lois)
et Theta (échelle) soit :math:`\Gamma(k,\theta)`.

.. math::

		E(X=k) = k\theta \\
		V(X=k) = k\theta^2

Loi géométrique
-------------------

La loi géométrique (ou loi de Pascal) indiquant la probabilité d'avoir n le nombre de succès
sachant une probabilité p.

.. math::

	P(X=n) = q^{n-1} * p \\
	E(X)= 1/p \\
	V(X)= q/p^2

Loi hypergéométrique
-----------------------

Il s'agit d'une loi G(n,p,N) indiquant la probabilité d'avoir n le nombre de succès
sachant une probabilité p sur un ensemble de N valeurs possibles.

.. math::

	P(X=n) = q^{n-1} * p * C^N_n \\
	E(X) = np \\
	V(X) = npq * \frac{N-n}{N-1}

Loi log normale
------------------------

Loi X est une loi log-normale si
Y = ln(X) suit une loi normale d'espérance :math:`\mu`
et de variance :code:`\sigma^2`.

.. math::

		E(X=k) = e^{\mu+\sigma^2/2} \\
		V(X=k) = (e^{\sigma^2} - 1) * e^{2\mu+\sigma^2}

Loi binomiale négative
------------------------

On cherche la probabilité d'avoir k échec avant un succès
sachant une probabilité p de succès et q=1-p d'échec.

.. math::

	E(X=k) = (kq)/p
	V(X=k) = (kq)/p^2

Loi normale/gaussienne
-----------------------

Une loi très importante en stats. On la note
N(mu, sigma^2) avec mu la moyenne est sigma-carré la variance.

Sa forme corresponds à une loi pour laquelle kurtosis (moment d'ordre 4)
vaut 3.

.. math::

	E(X) = \mu \\
	V(X) = \sigma^2

Lorsque N(0,1) alors on dit qu'il s'agit d'une loi centrée réduite. En théorie,
selon le théorème centrale limite alors toute loi peut être ramenée
à une loi normale avec :math:`\frac{k-\mu}{\sigma}`.

Généralement, on a un n-sigma-interval donc en prenant un interval de
n sigma on regarde a quel point la sous-distribution est fidèle à la loi

	*	Interval 1 sigma (-sigma, sigma) : ~68.3%
	*	Interval 2 sigma (-2sigma, 2sigma) : ~95.4%
	*	Interval 3 sigma (-3sigma, 3sigma) : ~99.7%

Le pourcentage signifie qu'il y a p% de chance que la moyenne soit dans l'interval
n-sigma.

Droite de Henry
	Il s'agit d'une droite qui est proche d'une distribution normale. Elle est généralement
	utilisée pour voir s'il s'agit bien d'une distribution gaussienne.

	Le coefficient de la droite (ak+b) est égal à :math:`(k-\mu)/\sigma` donc résoudre
	l'équation permet d'obtenir mu et sigma.

Loi poisson
-------------------

Aussi appelée la loi des événements rares, lorsque la probabilité
p est petite et le nombre d'expériences N est grand alors
la moyenne n*p tends vers une valeur fixe : :math:`\lambda`.

.. math::

	E(X) = np = \lambda \\
	V(X) = np = \lambda

On remarque V(X) = E(X) ce qui peut être utile en statistique descriptives
pour identifier une possible loi de poisson.

Loi Student T
-------------------

La fonction student T de paramètre k est
une fonction du khi-deux à k degré de liberté.

.. math::

	Si\ k>1,\ E(x) = 0 \\
	Si\ k>2,\ V(x) = k/(k-2) \\

Loi uniforme
-------------------

La fonction discrète uniforme corresponds aux probabilités égales
de tirer n'importe quelle valeur.

.. math::

	P(X=k) = 1/n \\
	E(X) = (n+1)/2 \\
	V(X) = (n^2-1)/12

Si elle est continue sur [a,b], on a

.. math::

	P(X=k) = 1/(b-a) \ \mathbb{1}_{[a,b]} \\
	E(x) : (a+b)/2 \\
	V(x) : (b-a)^2/12


Loi Weibull
-------------------

...

Loi de Pareto
-------------------

Connue avec la règle des 80-20 tels que 80% des effets
sont le résultat de 20% des causes.