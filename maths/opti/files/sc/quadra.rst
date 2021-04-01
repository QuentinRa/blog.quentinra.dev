=======================
Forme quadratique
=======================

Il s'agit d'une fonction de la forme :math:`f(x) = \frac{1}{2} x^{*} Qx + g^{*}x + c`
avec Q une matrice symétrique, ce qui donne :math:`\nabla f(x) = Qx + g` et
:math:`\nabla^2 f(x) = Q`.

Si Q est définie positive, :math:`x^* = -Q^{-1} g` est l'unique solution, sinon pas
de solutions.

On définit les notions

	* :code:`Semi-définie positive` (resp. négative) : toutes les valeurs sont positives (resp. négatives)
	* :code:`Définie positive` (resp. négative) : toutes les valeurs sont strictement supérieures à 0 (resp. inférieures)
	* :code:`Indéfinie` : les autres cas

En maths, si on considère l'écriture :math:`Q_{A}(y)=y \cdot Ay`, alors A est dite

	* :code:`Semi-définie positive` : Ssi :math:`Q_{A}(y) \geq 0` (resp. :math:`Q_{A}(y) \leq 0 `) pour tout :math:`y \in \mathbb{R}^n`)
	* :code:`Définie positive` : Ssi :math:`Q_{A}(y) > 0` (resp. :math:`Q_{A}(y) < 0`) pour tout :math:`y \in \mathbb{R}^n`
	* :code:`Indéfinie` : Ssi il :math:`y,z \in \mathbb{R}^n` tel que :math:`Q_{A}(y)>0` et :math:`Q_{A}(z)<0`

Je n'ai pas vraiment compris cette écriture de la forme quadratique mais soit. Dans tous les
cas, on ne va pas vérifier toutes les valeurs, mais caractériser le signe
d'une matrice avec son déterminant.

Ce signe, lié à d'autres hypothèses (convexité, ...), fournira plusieurs théorèmes
utiles (cf points particuliers) pour trouver un minimum dans le cas sans contraintes.

Voici deux techniques pour caractériser le signe d'une matrice A

.. toctree::
   :maxdepth: 1

		Signe d'une matrice (1)      <signe1>
		Signe d'une matrice (2)      <signe2>