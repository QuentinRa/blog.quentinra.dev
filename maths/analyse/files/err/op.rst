==============================
Opérations sur les normes
==============================

:math:`|||A|||| = \sup_{x \neq 0} \frac{||Ax||}{||x||}`

:math:`||Ax|| \le |||A||| * ||x||`

:math:`\rho(A) \le ||A||`

.. note::

	On peut toujours trouver une norme d'une matrice pour approcher le rayon spectral.

:math:`||v||^2_2 = v^t * v`

:math:`||Qx||^2_2 = (Qx)^* Qx = x^* Q^* Qx = x^* x = ||x||^2_2` car :math:`Q^**Q=Id`
donc :math:`\color{red}{||Qx||^2_2 =||x||^2_2}`

:math:`||AQ||_2 = ||QA||_2 = ||A||_2`

.. note::

	Démonstration

	.. math::

		||AQ||_2 := \max_{  x \neq 0 } \frac{||AQx||_2}{||x||_2}
		\\
		on \ pose \ y = Qx \\
		= \max_{  x \neq 0 } \frac{||Ay||_2}{||y||_2} := |||A|||
