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

...

Loi exponentielle
-------------------

.. math::

	P(X=k) = \lambda * e^{-\lambda{x}} * \mathbb{1}_{[0,+\infty]} \\
	E(x) = 1/\lambda \\
	V(x) = 1/\lambda^2

Loi F
-------------------

...

Loi Gamma
-------------------

...

Loi géométrique
-------------------

...

Loi hypergéométrique
-----------------------

...

Loi binomiale négative
------------------------

...

Loi normale/gaussienne
-----------------------

...

Loi poisson
-------------------

...

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