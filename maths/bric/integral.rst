.. _bric_integral:

================================
Primitives  et intégrales
================================

| :math:`\color{grey}{Version \ 1.2.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 24/11/2020}`

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
:math:`\sqrt{x}`                             :math:`\frac{2\sqrt{x}^{3/2}}{3} + c`
:math:`\frac{1}{\sqrt{x}}`                   :math:`2 \sqrt{x} + c`
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
	* On calcule les nouvelles bornes de notre intégrale [a,b]

		* on remplace x par b dans y et on calcule
		* on remplace x par a dans y et on calcule

	* on doit aussi réécrire dx en fonction de y donc dy.

		* avec dy/dx
			* on pose dy/dx = y\'
			* puis on résous pour pour avoir ... dy = dx.
			* Et enfin on remplace dx dans l'intégrale
		* avec dx/dy
			* on exprime x en fonction de y
			* on pose dx/dy = x\'
			* puis on résous pour pour avoir ... dy = dx.
			* Et enfin on remplace dx dans l'intégrale

Intégrabilité sur un interval
----------------------------------------

On a des fonctions, lorsqu'on calcule l'intégrale ça peut donner
quelque chose qui tends vers l'infini ou une valeur finie.

	* lorsqu'on tends vers +infini, on regarde de notre point vers +infini
	* lorsqu'on tends vers 0+, on regarde de notre 0+ vers +notre point

On définit alors l'intégrabilité sur ]a,b[ d'une fonction **continue** f tel que la plus grande
valeur prise par une intégrale syr un sous ensemble [c,d] de ]a,b[ soit inférieur (strict) à + l'infini.

.. math::

	\int_{a}^{b} |f(x)| dx = \sup_{[c,d] \subset ]a,b[} \int_{c}^{d} |f(x)| dx < +\infty

Propriétés
	1. f est continue sur [a,b] alors f est intégrable
	2. f doit être positive sinon il y a des problèmes
	3. soit g intégrable sur ]a,+inf[ alors si :math:`\forall{x}\ge a,\ |f(x)| \le g(x)` : f est intégrable.
	4. soit g intégrable et positive sur ]a,+inf[ alors si :math:`f = o_{x \rightarrow(g)}\ ou\ f = O_{x \rightarrow(g)}` : f est intégrable.
	5. soit g intégrable et :math:`f \sim_{x \rightarrow +\infty} c * g(x)` : f est intégrable.
	6. Les propriétés 3,4,5 sont également valables en 0+.

En pratique
	* Déterminer le domaine de définition de f : Df
	* si l'un des bornes a,b n'est pas dans Df, alors on démontre l'intégrabilité
		* en -infini, on fait comme en +infini
		* en :math:`a^+`, on fait comme en +infini
		* en :math:`b^-`, on fait comme en +infini
	* calcule (IPP, changement de variable, primitive). L'IPP peut échouer.

Intégrales doubles
-----------------------------------

Une intégrale double c'est une intégrale à deux variables, voici la notation
et la réécriture via le théorème de Fubini-Tonelli :

.. math::

	\int \int_{D_x*D_y} f(x,y) d(x,y)
	= \int_{D_x} \begin{pmatrix}\int_{D_y} f(x,y) dy\end{pmatrix} dx
	= \int_{D_y} \begin{pmatrix}\int_{D_x} f(x,y) dx\end{pmatrix} dy

x et y sont séparables
	* si y est dans l'expression de f, alors elle est constantes dans l'intégrale en x donc	on peut sortir y
	* on peut sortir l'intégrale en x de celle de y comme si c'était une constante car elle est constante dans y.

domaine simple
	*
		soit f(x,y) si, x a pour domaine l'interval [a,b] et y à pour domaine [c,x] inclus dans [a,b]
		alors on peut primitiver l'intégrale sur [c,x] puis calculer celle sur [a,b]
	*
		**(pas sûr)** soit f(x,y) si, x a pour domaine l'interval [a,b] et y à pour domaine [x,d] inclus dans [a,b]
		alors on peut primitiver l'intégrale : on obtient :math:`\frac{d-primitive}{2}` puis calculer celle sur [a,b]

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune