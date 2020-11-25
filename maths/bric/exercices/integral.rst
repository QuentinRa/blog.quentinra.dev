================================
Calculs d'intégrales
================================

Niveau débutant
***********************

1. Primitives
-------------------------

Pour chacune des fonctions suivantes, donner une primitive.

.. math::

		1. \ \ \ \ \ f_1(x) =  \frac{\ln{x}}{x}
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		2. \ \ \ \ \ f_2(x) =  \frac{1}{x\ln{x}}
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		3. \ \ \ \ \ f_3(x) =  \frac{1}{2\sqrt{x}(\sqrt{x}-1)} \\
		4. \ \ \ \ \ f_4(x) =  tan(x)
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		5. \ \ \ \ \ f_5(x) =  sin^2(x) cos (x)
		\ \ \ \ \ \ \ \ \ \ \ \ \ \ \ \
		6. \ \ \ \ \ f_6(x) =  xexp(-x^2) \\

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/d1>

| :code:`[TAG] ENSIIE MOM TD4 2020 S1`

2. Intégration par parties
-------------------------------

Calculer les valeurs des intégrales suivantes en utilisant la technique d’intégration par parties.

.. math::

		1.\int_{1}^{e} x\ln{x}\ dx \ \ \ \ \ \ \ \ \ \ 2.\int_{0}^{1} x^2e^{1-x}\ dx \\
		3.\int_{0}^{\frac{\pi}{3}} x^2cos(3{x})\ dx \ \ \ \ \ \ \ \ \ \ 4.\int_{0}^{\frac{1}{2}} arcsin(x)\ dx \\

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/d2>

| :code:`[TAG] ENSIIE MOM TD4 2020 S1`

3. Changement de variable
-------------------------------

.. math::

		1. \ En\ posant\ y = x^3 + 1, calculer \int_{0}^{1} \frac{x^2dx}{\sqrt{x^3+1}}. \\
		2. \ En\ posant\ y = \sqrt{1+x}, calculer \int_{0}^{1} \frac{xdx}{1+\sqrt{1+x}}. \\
		3. \ En\ posant\ x = sh(t), calculer \int_{0}^{1} \frac{dx}{\sqrt{1+x^2}}. \\
		4. \ En\ posant\ y = exp(x)\ puis\ y=2tan(t), calculer \int_{\ln{2}}^{\ln{(2\sqrt{3})}} \frac{dx}{exp(x)+4exp(-x)}. \\
		5. \ En\ posant\ y = \frac{2x-1}{\sqrt{5}}, calculer \int_{\frac{1-\sqrt{5}}{2}}^{\frac{1+\sqrt{5}}{2}} \frac{dx}{\sqrt{1+x-x^2}}. \\
		6. \ En\ posant\ y = \sqrt{1+x}, calculer \int_{0}^{3} \frac{1+\sqrt{1+x}dx}{1+x+\sqrt{1+x}}. \\

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/d3>

| :code:`[TAG] ENSIIE MOM TD4 2020 S1`

Niveau supérieur
***********************

1. Calculs d'intégrales
-------------------------------

Calculez les intégrales suivantes

	1.
		.. math::

			\int_{\mathbb{R}}^{} 3x^2sin(x^3+1) \ dx

	2.
		.. math::

			\int_{\mathbb{0}}^{3} \frac{x^2}{\sqrt{1+x}}

	3.
		.. math::

			\int_{\mathbb{R}}^{} \frac{e^{\sqrt{x}}}{\sqrt{x}}  \ dx

	4.
		.. math::

			\int_{\mathbb{R}}^{} x^2sin(x)  \ dx

	5.
		.. math::

			\int_{\mathbb{R}}^{} \frac{cos(x)}{(2+sin(x)^2} \ dx

	6.
		.. math::

			\int_{\mathbb{1}}^{2} \frac{x^3-x}{x^2} \ dx


.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/s1>

2. Un calcul par intégrales simples
-----------------------------------------

On considère la fonction f(x, y) = :math:`\frac{x^2-y^2}{(x^2+y^2)^2}`

1. Calculer la dérivée de g(x, y) = :math:`\frac{y}{x^2+y^2}` par rapport à y.

2. En déduire la valeur de :math:`\int_{x=0}^1 ( \int_{y=0}^1 f(x,y) dy) dx`.

3. Calculer maintenant la valeur de :math:`\int_{y=0}^1 ( \int_{y=0}^1 f(x,y) dx) dy`.

4. Que pouvez-vous dire sur la fonction f ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/s2>

| :code:`[TAG] ENSIIE MOM TD7 2020 S1`

3. Intégrales multiples
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

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<integral/s3>

| :code:`[TAG] ENSIIE MOM TD7 2020 S1`

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Christophe MOUILLERON (enseignant à l'ENSIIE)