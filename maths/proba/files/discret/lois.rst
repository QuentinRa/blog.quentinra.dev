===================================
Lois de probabilités discrètes
===================================

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