.. _dl:

================================
Développements limités
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 17/11/2020}`

Développement limité
	Un développement limité d'une fonction consiste à réécrire cette fonction
	sous la forme d'un polynôme de degré n (=ordre) plus une approximation qui regroupe
	tous les termes de degré supérieur notée
	avec la notation de landau O(x^{n+1}) ou tos pour termes d'ordre supérieur.

	.. math::

		f(x) = polynôme\ de\ degré\ n + O(x^{n+1})

1. Notations de Landau
=========================

:math:`f = O_{x \rightarrow a}(g)` = petit o : f est dominée en a par rapport à g
	On vérifie cette égalité en trouvant une constante C tel que :math:`|f(x)| \le C|g(x)|`.

	écritures alternatives : :math:`f = O(g)`, :math:`f \in O(g)`, :math:`g = \Omega(f)`

:math:`f = o_{x \rightarrow a}(g)` = grand o : f est négligeable en a par rapport à g
	On vérifie cette égalité en trouvant une constante C tel que :math:`|f(x)| \le C|g(x)|`.

	écritures alternatives : :math:`f = o(g)`, :math:`f \in o(g)`, :math:`g = \omega(f)`

:math:`f = \Theta_{x \rightarrow a}(g)` (Theta) : f est du même ordre en a que g
	On vérifie cette égalité en trouvant deux constantes A,B tel que :math:`A |f(x)| \le |g(x)| \le B|f(x)|`.

	écritures alternatives : :math:`f = \Theta(g)`, :math:`f \in \Theta(g)`, :math:`g = \Theta(f)`

:math:`f = ~_{x \rightarrow a}\ g` : f est équivalente en a à g
	On vérifie en vérifiant que :math:`\lim_{x \rightarrow a} \frac{f(x)}{g(x)} = 1`.

	écritures alternatives : :math:`g = ~_{x \rightarrow a}\ f`

Pour comparer f et g, on calcule :math:`limit = \lim_{x \rightarrow a} \frac{f(x)}{g(x)}` alors

	* :code:`limit=0`, f petit et g grand donc :math:`f = o_{x \rightarrow a}\ (g)`
	* :code:`limit=1`, équivalence donc :math:`f ~_{x \rightarrow a}\ g`
	* :code:`limit=R\{0,1}`, :math:`f \approx l * g` donc :math:`f = \Theta_{x \rightarrow a}\ (g)`
	* :code:`limit=+inf ou -inf`, f grand g petit donc :math:`g = o_{x \rightarrow a}\ (f)`
	* :code:`limit=none`, f et g pas comparables

Propriété
	* :math:`O(x) - O(x) = O(x)`
	* :math:`O(x) + O(x) = O(x)`
	* :math:`constante * O(x) = O(x)`
	* :math:`constante * O(x) = O(x)`
	* :math:`x * O(x) = O(x^2)`

2. Formule de Taylor-Lagrange
==============================

Si f peut être dérivée autant de fois que voulu sur [a,b], alors

.. math::

	f(b) = \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!} (b-a)^k + \int_{a}^{b} \frac{f^{(n+1)}(t)(b-t)^n}{n!} dt

3. Formule de Taylor-Young
==============================

Si f est **définie autour de 0** et on peut la dérivée autant de fois que voulu, alors

.. math::

	f(x) = \sum_{k=0}^{n} \frac{f^{(k)}(0)}{k!} x^k + O(x^{n+1})

Il s'agit de la somme des dérivées k1e, k2e, ... en 0 divisée par le k!
plus une approximation pour les termes d'ordre supérieur.

4. Développements limités connus
==================================

Ordre = 5

:math:`\frac{1}{1+Y} = 1 + Y^2 + Y^3 + Y^4 + Y^5 + O(Y^6)`

:math:`\cos{\left(x \right)}= 1 - \frac{x^{2}}{2} + \frac{x^{4}}{24} + O\left(x^{6}\right)`

:math:`\sin{\left(x \right)}= x - \frac{x^{3}}{6} + \frac{x^{5}}{120} + O\left(x^{6}\right)`

:math:`\tan{\left(x \right)}= x + \frac{x^{3}}{3} + \frac{2 x^{5}}{15} + O\left(x^{6}\right)`

:math:`e^{x}= 1 + x + \frac{x^{2}}{2} + \frac{x^{3}}{6} + \frac{x^{4}}{24} + \frac{x^{5}}{120} + O\left(x^{6}\right)`

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.codabrainy.com/taylor/