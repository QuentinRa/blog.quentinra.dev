==================================
Variance et co-variance
==================================

Variance
------------------------

Il s'agit de l'écart autour de la moyenne.

.. math::

	V(X) = \mathbb{E}[(X - \mathbb{E}[X])^2]

	V(X) = \mathbb{E}[X^2] - \mathbb{E}[X]^2

Propriétés de la variance

	* :math:`V(a + \lambda X^2) = \lambda^2 V(X)`
	* :math:`V(X + Y) = V(X) + V(Y) - 2cov(XY)` (voir co-variance)

Co-variance (ou covariance)
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
	* :math:`cov(\lambda * X) =  \lambda^2 *cov(X)`
	* :math:`cov(A+B,C) = cov(A,C) + cov(B,C)` (cov bilinéaire/bi=2 variables)
	* si a et b sont indépendants (:math:`\perp`) alors cov(XY) = 0 (réciproque n'est pas vraie)
	* :math:`\mathbb{P}(X, Y) = \frac{cov(X,Y)}{\sqrt{V(X)*V(Y)}}`
