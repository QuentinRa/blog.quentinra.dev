.. _bric_integral:

================================
Primitives  et intégrales
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/11/2020}`

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

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune