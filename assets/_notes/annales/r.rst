https://www.ilemaths.net/sujet-loi-normale-determiner-mu-et-sigma-638624.html
https://www.symbolab.com/solver/matrix-eigenvectors-calculator/eigenvectors%20%5Cbegin%7Bpmatrix%7D1%262%261%5C%5C6%26-1%260%5C%5C-1%26-2%26-1%5Cend%7Bpmatrix%7D?or=ex

======================
1. PARTIEL MPR 2021
======================

Quentin RAMSAMY--AGEORGES

Exercice 1
=================

1.

La fonction exponentielle est croissante, sachant x positif :math:`e^{-\frac{x^2}{2}}`
tends vers 0 donc la fonction tends vers x, si x est croissante alors la fonction est bien croissante.

Les valeurs x sont positives.

.. math::

	densité := \sum_{k=0}^{+\infty} f(k) = 1
	\Leftrightarrow
	\sum_{k=0}^{+\infty} k e^{-\frac{k^2}{2}} = 1

Donc c'est bien une densité de probabilité.

2.

Soit :math:`Y = X^2`. Determiner et reconnaître la loi de Y.

Soit g une application mesurable, bornée, positive alors on a

.. math::

		E[g(Y)] = E[g(X^2)] = \frac{1}{\sqrt{2\pi}} \int_{\mathbb{R}} g(x^2)\ e^{-\frac{k^2}{2}} dx
		\\ \Leftrightarrow^{parité}
		E[g(Y)] = E[g(X^2)] = \frac{2}{\sqrt{2\pi}} \int_{\mathbb{R}} g(x^2)\ e^{-\frac{k^2}{2}} dx
		\\ \Leftrightarrow^{y=x^2}
		E[g(Y)] = \frac{2}{\sqrt{2\pi}} \int_{0}^{+\infty} g(y)\ e^{-\frac{k^2}{2}} \frac{dy}{2\sqrt{y}}
		\\ \Leftrightarrow
		\int_{0}^{+\infty} g(y)\ \frac{e^{-\frac{k^2}{2}}}{2\sqrt{y}} dy

Je reconnais une Loi gaussienne.

3.

| E(Y) = 3 * 1 = 3
| V(Y) = 3 - 1 = 2


Exercice 2
===================

Partie 1

rien

Loi marginale

.. math::

	fX(x) = \int_{\mathbb{R}} f_(x,y) (x,y) dy

Partie 2

.. math::

		Z\:=\:\frac{X-\mu }{\sigma }
		\Leftrightarrow  X\:=\:\mu \:+\:\sigma \:Z

		\\

		P\left(X\:\le 3\right)\:=\:0.1587
		\Leftrightarrow
		P\left(X\:\le \frac{3-\mu }{\sigma }\right)\:=\:0.1587
		\\
		\frac{3-\mu }{\sigma } = -0,999815094

		\\

		P\left(X\:\le 9\right)\:=\:0.9772
		\Leftrightarrow
		P\left(X\:\le \frac{9-\mu }{\sigma }\right)\:=\:0.9772

		\\
		\frac{9-\mu }{\sigma } = 1,999077215

On a donc

	* :math:`3-\mu  = -0,999815094 * \sigma`
	* :math:`9-\mu  = 1,999077215 * \sigma`

Donc :math:`\mu = 5.00037` and :math:`\sigma = 2.00074`.

.. math::

		P(X \gt 1 ) = 1 - P(X \le 1)
		\Leftrightarrow
		1 - P( \widetilde{X}  \le \frac{1-5}{2})
		\Leftrightarrow
		1 - P( \widetilde{X}  \le -2)
		\\ \Leftrightarrow
		1 - P( \widetilde{X}  \le 2)
		\Leftrightarrow
		1 - 0.02275013195
		\Leftrightarrow
		P(X \gt 1 ) = 0.97724986805

Exercice 3
===================

...

Exercice 4
===================

1.

X est un vecteur qui suit une loi gaussienne  donc chaque
X_i suit une loi gaussienne et chaque combinaison suit une loi gaussienne (définition de la démonstration
qu'un vecteur est gaussien).

2.

...

3.

Probabilité conditionnelle

.. math::

	\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}