========================================================
2. Particularités de python - Opérateurs de conditions
========================================================

Les conditions sont des expressions qui retournent
:code:`True` ou :code:`False`, appelés des booléens.

Vous allez les utiliser dans des structures (branchements, boucles, ...)
pour déterminer si vous devez ou non exécuter du code par exemple.

Les opérateurs de comparaisons sont

	* test égalité : :code:`==`
	* test différence : :code:`!=`
	* inverse : :code:`!`
	* strictement inférieur : :code:`<=`
	* inférieur : :code:`<`
	* supérieur : :code:`>`
	* strictement supérieur : :code:`>=`

Exemples

.. code:: python

	5 > 3 # retourne True
	10 == 1 # retourne False

Vous pouvez utiliser les opérateurs logiques et, ou, ... pour tester
plusieurs conditions.

.. code:: python

	cond and cond # TOUTES les conditions sont vraies
	cond or cond # AU MOINS UNE conditions est vraie
	not cond # la réciproque est vrai (si cond=True, alors False)

:code:`a is b` retourne True si les variables a et b ont la même valeur
et la même référence (=il s'agit du même objet au même endroit dans la mémoire)
donc avoir la même valeur ne suffit pas.