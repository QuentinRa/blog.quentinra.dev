===========================
Signe d'une matrice (1)
===========================

On calcule les mineurs principaux. Soit une matrice A

.. math::

		A= \begin{pmatrix}
			a_{11} & a_{12} & \cdots & a_{1n} \\
			a_{21} & a_{22} & \cdots & a_{2n} \\
			\vdots & \vdots & \ddots & \vdots \\
			a_{n1} & a_{n2} & \cdots & a_{nn}
		 \end{pmatrix}

Alors les mineurs principaux sont les :math:`\Delta_{i}=det(A_{i})`
ie :math:`\Delta_{1}=a_{11}`, et
:math:`\Delta_{2}=det A_{2}= \begin{pmatrix}a_{11} & a_{12} \\ a_{21} & a_{22}\end{pmatrix}`
... et :math:`\Delta_{n}=det(A)`

* :math:`A` est définie positive si et seulement si (ssi) pour tout :math:`k, \Delta_{k}>0`
* :math:`A` est définie négative ssi pour tout :math:`k, (-1)^k\Delta_{k}>0`
* Si pour tout :math:`k < n`, :math:`\Delta_{k}>0` ET :math:`\Delta_{n}=0`, alors :math:`A` est semi-définie positive
* Si pour tout :math:`k < n`, :math:`(-1)^k\Delta_{k}>0` ET :math:`\Delta_{n}=0`, alors :math:`A` est semi-définie négative
* Si :math:`\Delta_{n} < 0` ET si :math:`n` est par, alors :math:`A` est indéfinie

Cette technique est la plus utilisée (car dans les exercices, n=2 en général),
mais en cas de problème, se rabattre sur la seconde technique,
qui est certes plus longue mais plus sûr.