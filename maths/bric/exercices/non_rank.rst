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

On considère d'abord la fonction :math:`\Gamma : \mathbb{R}^*_+ \rightarrow \mathbb{R}`,
 :math:`t \rightarrow t^{x-1}e^{-t}`.

1. Donner un équivalent simple de :math:`f_x` quand t tend vers :math:`0^+`.

2. Montrer que :math:`f_x(t) = o_{t \rightarrow +\infty} (t^{-2})`

3. À quelle(s) condition(s) la fonction :math:`f_x` est-elle intégrable à la fois en :math:`0` et en :math:`+\infty`?

On considère maintenant la fonction :math:`\Gamma : \mathbb{R}^*_+ \rightarrow \mathbb{R}`,
 :math:`x \rightarrow \int_{0}^{+\infty} t^{x-1}e^{-t}dt`.

4. Calculer :math:`\Gamma(1)` et :math:`\Gamma(2)`.

5. Montrer que :math:`\Gamma(x+1) = x \Gamma(x)`

6. En déduire une formule pour :math:`\Gamma(n),\ \forall{n \in \mathbb{N}^*}` [#2]_

7. Que pouvez-vous en déduire sur la courbe de la fonction :math:`\Gamma` ? Tracer cette courbe

.. [#2] On admet que la dérivée :math:`k^n` de :math:`\Gamma` est :math:`\Gamma^{(k)}(x) = \int_{0}^{+\infty} (\ln t)^kt^{x-1}e^{-t}dt`

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)