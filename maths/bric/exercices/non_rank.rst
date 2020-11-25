================================
Non triés
================================

Dérivées de fonctions réciproques usuelles
---------------------------------------------------------

On rappelle que si :math:`f : I  \rightarrow  J` est dérivable et bijective, alors la bijection réciproque
:math:`f^{-1}` est dérivable et sa dérivée satisfait :math:`f^{-1}=\frac{1}{f'(f(x))}`
pour tout :math:`x in J` où cela a du sens.

1. Dériver chaque coté de l’équation :math:`f'(f(x)) = x`, puis démontrer la formule du rappel

2. Retrouver la formule pour la dérivée de la fonction arccos (réciproque de cos).

3. Même question pour arcsin et arctan.

| :code:`[TAG] ENSIIE MOM TD3 2020 S1`

Étude asymptotique grâce à un DL
---------------------------------------------------------

En utilisant un développement limité, déterminer pour chacune des fonctions suivantes son
asymptote en :math:`+\infty` ainsi que la position de la courbe par rapport à cette asymptote.

.. math::

		f(x) = \sqrt{\frac{x^3}{1 + x}}
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		f_2(x) = \frac{(2x + 1)^2}{x^2 + x + 1}
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		f_3(x) = x^2 \ln \frac{x + 1}{x - 1}

| :code:`[TAG] ENSIIE MOM TD5 2020 S1`

Fonction :math:`\Gamma`
-----------------------------

On considère maintenant la fonction :math:`\Gamma : \mathbb{R}^*_+ \rightarrow \mathbb{R}`,
 :math:`x \rightarrow \int_{0}^{+\infty} t^{x-1}e^{-t}dt`.

1. Calculer :math:`\Gamma(1)` et :math:`\Gamma(2)`.

2. Montrer que :math:`\Gamma(x+1) = x \Gamma(x)`

3. En déduire une formule pour :math:`\Gamma(n),\ \forall{n \in \mathbb{N}^*}` [#2]_

4. Que pouvez-vous en déduire sur la courbe de la fonction :math:`\Gamma` ? Tracer cette courbe

.. [#2] On admet que la dérivée :math:`k^n` de :math:`\Gamma` est :math:`\Gamma^{(k)}(x) = \int_{0}^{+\infty} (\ln t)^kt^{x-1}e^{-t}dt`


Intégrales multiples
--------------------------------

Calculer la valeur des intégrales multiples suivantes.

.. math::

	1. \int \int_{D} \frac{dx dy}{1 + x^2 + y^2} \ \ \ \ \ \ \text{où D = {(x, y) $\in \mathbb{R}^2$
	| $x^2+y^2 \le 1$}.} \\

	2.
	\int \int_{D} xy dx dy \ \ \ \ \ \ \text{ sur D =
	$\big\{$ (x, y) $\mathbb{R}^2$ | x > 0, y > 0 et $(\frac{x}{a})^2+(\frac{y}{b})^2 \le 1$$\big\}$ .} \\

	3. \int\int_D \frac{dxdy}{(x+y)^3}\ \ \ \ \text{où  D = \{{(x, y) $\in R^2$ | 1 < x, 1 < y et x + y < 3}\}.} \\

	4. \int\int_D x\ dxdy\ \ \ \text{où  D = \{{(x, y) $\in R^2$ | 0 < x < y et $x^2+y^2 \le 1$}\}.}

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)