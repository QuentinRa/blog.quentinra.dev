=================================
Espérance
=================================

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

Tchebychev
	Si a > 0 alors :math:`\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[X^2]}{a^2}`

Jensen
	X intégrable et :math:`\varphi` converge alors :math:`\mathbb{E}[\varphi(x)] > \varphi (\mathbb{E}[X])`

Cauchy-Schwarz
	Soit deux v.a. X, Y alors :math:`\mathbb{E}[XY]^2 \le \mathbb{E}[X^2] * \mathbb{E}[Y^2]`

Markov
	:math:`\mathbb{P}( |x| \ge a) \le \frac{\mathbb{E}[ |X| ]}{a}`