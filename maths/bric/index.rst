.. _bric:

================================
Bric à Brac
================================

.. note::

	Le bric à brac est comme son nom l'indique une réserve de trucs utiles, pas assez
	approfondis pour en faire un cours.

	Les grandes thèmes sont (pas forcément dans cette ordre) :

		1. Connaissances

			* Coefficient binomial
			* Factorielle

		2. Études de fonctions
		3. Limites
		4. Dérivées
		5. Primitives
		6. Intégrales

Coefficient binomial
***********************

:math:`\begin{pmatrix}n \\k\end{pmatrix}` = k parmi n = :math:`C^k_n` = :math:`\frac{n!}{k! (n-k)!}`

.. hint::

	| :math:`C^1_n = n`
	| :math:`C^2_n = \frac{n(n-1)}{2}`

Factorielle
***********************

La factorielle de n notée n! est une fonction définie par :
:math:`\prod_{1 \le i \le n}^{} i = n * (n-1) * ... * 2 * 1` (c'est le produit
de n termes, chaque terme est plus petit de 1 que le précédent).

	* 0! = 1
	* 1! = 1

Exemple : 5! = 5*4*3*2*1 = 120

**Simplifications**

	* :math:`\frac{n!}{(n+m)!} = \frac{1}{(n+1) * (n+2) * ... * (n+m)}`
	* si n > m, :math:`\frac{n!}{(n-m)!} = n * (n-1) * ... * (n-m+1)`

Étude de fonctions d'une variable réelle
******************************************

Voici comment étudier une fonction dans :math:`\mathbb{R}`.

============================== ==========================
Propriété				               Outils
============================== ==========================
continue											 Ensemble de définition

limites, asymptotes						 symétrie, périodicité, ensemble de dérivation [#3]_

tangente                       dérivée, monotonie

extrema                        extrema (min/max) et convexité (monte vite ?)
============================== ==========================

.. [#3] souvent on dérive et on regarde après

* :code:`symétrie` : :math:`f(x_0 - h) = f(x_0 + h)`
* :code:`symétrie centrale` : :math:`y_0 - f(x_0 - h) = f(x_0 + h) - y_0`
* :code:`asymptote verticale` : :math:`\lim_{x \rightarrow a}f(x) = \pm \infty`
* :code:`asymptote horizontale` : :math:`\lim_{x \rightarrow +\infty}f(x) = a \infty`
* :code:`Asymptotes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} = a \in \mathbb{R}^* \infty`
* :code:`Asymptotes obliques` : :math:`\lim_{x \rightarrow \pm\infty}\frac{f(x)}{x} - ax = b \in \mathbb{R}\infty`
* :code:`convexe` : croissance de plus en plus rapide, dérivée croissante et dérivée seconde positive
* :code:`concave` : croissance de plus en plus lente, dérivée décroissante et dérivée seconde négative

*
	:code:`point d'inflexion` : si une fonction passe de convexe à concave ou inversement, alors c'est le point x du changement.
	On calcule les dérivés secondes et troisièmes. On résouds :math:`f''(x) = 0` et on calcule pour certains x trouvés
	:math:`f'''(x)`. Si :math:`f'''(x)` est égale à 0, alors x n'est pas un point d'inflexion. Sinon, si le résultat
	est négatif alors on passe de convexe à concave et si le résultat est positif, alors on passe de concave à connexe.

*
	:code:`tangente` : pente de la courbe, f(a)<f(x) alors :math:`pente\ =\frac{f(x)-f(a)}{x-a}`.
	Si a=x alors :math:`pente\ =\lim_{x \rightarrow a} \frac{f(x)-f(a)}{x-a} = f'(a)`.
	La tangente peut aussi être approchée par :math:`pente\ = f(a) + f'(a) (x-a)`, avec a le point pour lequel vous voulez
	la tangente.

Une suite possible d'étapes pour étudier une fonction serait

	1. Domaine de définition
	2. Dérivée

		| 2.1. Domaine de la dérivée
		| 2.2. Résoudre f'(x)=0
		| 2.3. Tableau de variations

	3. Calculs optionnels

		| 3.1. Calcul des asymptotes
		| 3.2. Calcul des tangentes
		| 3.3. Calcul de symétries
		| 3.4. Calcul de convexités/concavités
		| 3.5. Calcul de points d'inflexions

	4. Dessiner la courbe

Quelques domaines de définitions

	* cos(x), sin(x) : R
	* exp(x) : R
	* ln(x) : R+, x > 0

Dérivées
**************

La dérivée d'une fonction consiste à réécrire la fonction
avec avoir appliquer des calculs (dériver) pour observer les variations
qu'elle a après avoir changé son paramètre d'entré.

Elle est généralement notée f' (f prime) ou encode :math:`\frac{d}{dx}f`. Elle correspond
à un Développement limité d'ordre 0.

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
a (constante)                                    0
x (variable)                                     1
:math:`x^n`                                  :math:`nx^{n-1}`
:math:`\frac{1}{x}`                          :math:`\frac{-1}{x^2}`
:math:`\frac{1}{x^n}`                        :math:`\frac{-n}{x^{n+1}}`
:math:`\sqrt{x}`                             :math:`\frac{1}{2\sqrt{x}}` ou :math:`(\sqrt{x})' = (x^{\frac{1}{2}})' = \frac{1}{2} x^{-\frac{1}{2}} = \frac{\sqrt{x}^-1}{2} =  \frac{1}{2\sqrt{x}}`
:math:`\ln{x}` (logarithme népérien)         :math:`\frac{1}{x}`
:math:`\log_a{x}` (logarithme)               :math:`\frac{1}{xln(a)}`
:math:`e^{x}` (exponentielle)                :math:`e^x`
:math:`a^{x}`                                :math:`a^x\ln{(a)}`
============================================ ============================================

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
:math:`cos(x)`                               :math:`-sin(x)`
:math:`sin(x)`                               :math:`cos(x)`
:math:`tan(x)`                               :math:`1+tan^2(x)` ou :math:`\frac{1}{cos^2(x)}`
============================================ ============================================

============================================ ============================================
Fonction                                     Dérivée
============================================ ============================================
:math:`e^u`                                  :math:`u'e^u`
:math:`\ln{(u)}`                             :math:`\frac{u'}{u}`
:math:`a*u`                                  :math:`a*u'`
:math:`(u+v)'`                               :math:`u'+v'`
:math:`(u*v)'`                               :math:`u'v+uv'`
:math:`(\frac{u}{v})'`                       :math:`\frac{u'v-uv'}{v^2}`
:math:`(u^{a})'`                                 :math:`a*u'*u^{a-1}`
:math:`u(v(x))'`                             :math:`v'(x) u'(v(x))`
============================================ ============================================

Limites
**************

Les limites permettent de savoir si pour une fonction f(x), on prend un x
qui "tends" à se rapprocher d'une certaine valeur, alors les valeurs de f(x) tendent-elles aussi
à ce rapprocher d'une valeur ? Si oui, alors on a déterminer une limite.

.. math::

	\lim_{x \rightarrow 2} f(x) = limite\ quand\ x\ tends\ vers\ 2\ de\ f(x)
	\\\lim_{x \rightarrow 2^-} f(x) = limite\ quand\ x\ tends\ vers\ une\ valeur\ légèrement\ inférieure\ à\ 2\ de\ f(x)
	\\\lim_{x \rightarrow 2^+} f(x) = limite\ quand\ x\ tends\ vers\ une\ valeur\ légèrement\ supérieure\ à\ 2\ de\ f(x)
	\\\lim_{x \rightarrow +\infty} f(x) = limite\ quand\ x\ tends\ vers\ plus\ l'infini\ de\ f(x)
	\\\lim_{x \rightarrow -\infty} f(x) = limite\ quand\ x\ tends\ vers\ moins\ l'infini\ de\ f(x)

La limite revient bêtement à remplacer x par la valeur vers laquelle x tends : 0, ... par +l'infini, - l'infini...
et de calculer la limite en utilisant les limites connues.

.. warning::

	Il est possible de calculer la limite de x en 0 ce qui donne 0/0, parce que
	on remplace par 0 mais il faut garder en mémoire que ce n'est pas 0 mais une valeur
	extrêmement petite qui se rapproche de zéro mais n'est pas forcément zéro.

Limites connues : addition
----------------------------

=============== =============== =============== ===============
\+              :math:`-\infty` :math:`l`       :math:`+\infty`
=============== =============== =============== ===============
:math:`-\infty` :math:`-\infty` :math:`-\infty` :math:`FI`
:math:`l'`      :math:`-\infty` :math:`l+l'`    :math:`+\infty`
:math:`+\infty` :math:`FI`      :math:`+\infty` :math:`+\infty`
=============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Limites connues : produit
----------------------------

=============== =============== =============== =============== =============== ===============
:math:`*`       :math:`-\infty` :math:`l \lt 0` :math:`0`       :math:`l \gt 0` :math:`+\infty`
=============== =============== =============== =============== =============== ===============
:math:`-\infty` :math:`+\infty` :math:`+\infty` :math:`FI`      :math:`-\infty` :math:`-\infty`
:math:`l' < 0`  :math:`+\infty` :math:`ll'`     :math:`0`       :math:`ll'`     :math:`-\infty`
:math:`0`       :math:`FI`      :math:`0`       :math:`0`       :math:`0`       :math:`FI`
:math:`l' > 0`  :math:`-\infty` :math:`ll'`     :math:`0`       :math:`ll'`     :math:`+\infty`
:math:`+\infty` :math:`-\infty` :math:`-\infty` :math:`FI`      :math:`+\infty` :math:`+\infty`
=============== =============== =============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Limites connues : division
----------------------------

================ =============== =============== =============== =============== ===============
:math:`haut/bas` :math:`-\infty` :math:`l \lt 0` :math:`0`       :math:`l \gt 0` :math:`+\infty`
================ =============== =============== =============== =============== ===============
:math:`-\infty`  :math:`FI`      :math:`+\infty` :math:`-\infty` :math:`-\infty` :math:`FI`
:math:`l' < 0`   :math:`0^+`     :math:`l'/l`    :math:`-\infty` :math:`l'/l`    :math:`0^-`
:math:`0`        :math:`0`       :math:`0`       :math:`FI`      :math:`0`       :math:`0`
:math:`l' > 0`   :math:`0^-`     :math:`l'/l`    :math:`+\infty` :math:`l'/l`    :math:`0^+`
:math:`+\infty`  :math:`FI`      :math:`-\infty` :math:`+\infty` :math:`+\infty` :math:`FI`
================ =============== =============== =============== =============== ===============

FI signifie Forme Indéterminée, voir la partie correspondante.

Limites utiles
--------------------------

* si :math:`\alpha < \beta,\ \lim_{x \rightarrow +\infty} \frac{x^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow +\infty} \frac{(lnx)^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow +\infty} \frac{(exp x)^\alpha}{x^\beta} = +\infty`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow -\infty} x^\alpha * (exp x)^\beta = 0`
* si :math:`\alpha > \beta,\ \lim_{x \rightarrow 0^+} \frac{x^\alpha}{x^\beta} = 0`
* si :math:`0 < \alpha\ et\ 0 < \beta,\ \lim_{x \rightarrow 0^+} x^\alpha * (lnx)^\beta = 0`

Formes indéterminées (FI)
--------------------------

Les outils pour simplifier une forme indéterminée et obtenir une forme connues sont :

	* les encadrements : si :math:`f(x) \le g(x)` alors :math:`\lim_{x \rightarrow a}f(x) \le \lim_{x \rightarrow a} g(x)`
	* les identités remarquables
	* par croissance comparée
	* via le calcul de développement limités (règle de l'hôpital = :math:`{DL}_1`)
	* factorisation (par la fonction la plus croissante)

.. warning::

	Attention, en 0, x > x^2 donc pour factoriser, la fonction de plus haut
	n'est pas forcément la fonction la plus croissante.

Primitives
***************************

La primitive d'une fonction continue f(x) notée F(x) est une fonction qui une fois
dérivée donne la fonction f(x).

Les primitives sont à une constantes (c) près, car les constantes font 0 une fois dérivées.

============================================ ============================================
Fonction                                     Primitive
============================================ ============================================
:math:`a`                                    :math:`ax + c`
:math:`x`                                    :math:`\frac{x^2}{2} + c`
:math:`x^n`                                  :math:`\frac{x^{n+1}}{n+1} + c`
:math:`\frac{1}{x}\ ou\ x^{-1}`              :math:`\ln{x} + c`
:math:`\frac{1}{x-a}`                        :math:`\ln{x-a} + c`
:math:`\ln{x}`                               :math:`x\ln{x}-x + c`
:math:`e^x`                                  :math:`e^x`
:math:`a^x`                                  :math:`\frac{a^x}{\ln{a}} + c`
============================================ ============================================

============================================ ============================================
Fonction                                     Primitive
============================================ ============================================
:math:`u'u^n`                                :math:`\frac{u^{n+1}}{n+1}`
============================================ ============================================

============================================ ============================================
Fonction                                     Primitive
============================================ ============================================
:math:`cos(x)`                               :math:`sin(x) + c`
:math:`sin(x)`                               :math:`-cos(x) + c`
:math:`tan(x)`                               :math:`-\ln{|cos(x)|} + c`
:math:`\frac{1}{1+x^2}`                      :math:`arctan(x) + c`
:math:`\frac{1}{\sqrt{1-x^2}}`               :math:`arccos(x) + c`
:math:`\frac{-1}{\sqrt{1-x^2}}`              :math:`arcsin(x) + c`
============================================ ============================================

Intégrales
***************************

Une intégrable sur [a,b] est l'aire sous la courbe d'une fonction f entre a et b.

.. math::

	F(x) = \int_{a}^{b} f(x)dx = [F(x)]_{a}^{b} = F(b) - F(a)

Propriétés
	* transitivité : :math:`\int_{a}^{c} f(x)dx = \int_{a}^{b} f(x)dx + \int_{b}^{c} f(x)dx`
	* composée : :math:`\int_{a}^{b} (f(x)+g(x))dx = \int_{a}^{b} f(x)dx + \int_{a}^{b} g(x)dx`
	* sortir une constante : :math:`\int_{a}^{b} \alpha f(x) dx = \alpha * \int_{a}^{b} f(x)dx`

Intégration par parties (IPP)
--------------------------------

L'intégration par partie permet de découper une intégrales en deux intégrales plus faciles
à calculer.

On pose u : fonction dont on connait la dérivée et v\' la dérivée d'une fonction
dont on connait la primitive

.. math::

		\int_{a}^{b} u(x)v(x)' \ dx =  [u(x)v(x)]_{a}^{b} - \int_{a}^{b} u(x)'v(x) \ dx

Exemples d'usages

	* u=polynôme et v=fonction trigonométrique
	* u=fonction à dérivée simple et v=1
	* xln(x), on pose u=ln(x) et v'=x donc :math:`u=\frac{1}{x}` et :math:`v'=\frac{x^2}{2}`

Changement de variable
--------------------------------

Le changement de variable permet de résoudre des intégrales complexes
en la réécrivant après avoir remplacé les bornes et des termes par de nouveaux.

	* On pose une variable par exemple y = ... x
	* On calcule les nouvelles bornes de notre intégrable

		* b = x, donc trouver c=y ?
		* a = x, donc trouver d=y ?

	* on doit aussi réécrire dx en fonction de y donc dy.

Exercices
*************

.. toctree::
    :name: exercices
    :maxdepth: 1

		Limites                   <exercices/limit>
		Dérivées                  <exercices/derive>
		Études de fonctions       <exercices/etude>
		Primitives  et intégrales <exercices/integral>
		Non triés                 <exercices/non_rank>

|

----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Coefficient_binomial
	* https://www.dcode.fr/limite
	* https://www.dcode.fr/derivee
	* https://www.dcode.fr/domaine-definition-fonction
	* https://www.wolframalpha.com/
	* https://fr.wikipedia.org/wiki/Th%C3%A9or%C3%A8me_des_croissances_compar%C3%A9es
	* https://www.solumaths.com/fr/calculatrice-en-ligne/calculer/equation_tangente
	* https://www.symbolab.com/solver/simplify-calculator/
	* https://mathpapa.com/simplify-calculator/
	* matplotlib
			* https://stackoverflow.com/questions/31556446/how-to-draw-axis-in-the-middle-of-the-figure
			* https://matplotlib.org/3.2.1/gallery/lines_bars_and_markers/simple_plot.html#sphx-glr-gallery-lines-bars-and-markers-simple-plot-py
			* https://pythonforundergradengineers.com/plotting-sin-cos-with-matplotlib.html
			* https://www.tutorialspoint.com/matplotlib/matplotlib_simple_plot.htm
			* https://www.online-python.com/

.. https://www.codabrainy.com/resolution-equation-une-inconnue/
.. https://www.wolframalpha.com/input/?i=sin%28x%29%2Bcos%28x%29
.. https://stackoverflow.com/questions/30397384/embedding-matplotlib-plots-in-sphinx-how-to-show-documentation
.. https://physique-chimie-python.readthedocs.io/fr/latest/3_SciPy/2_matplotlib.html
.. https://matplotlib.org/sampledoc/extensions.html
.. https://www.symbolab.com/solver?origin=ddg&query=-sin%28x%29%2Bcos%28x%29+%3D+0