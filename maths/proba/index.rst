.. _proba:

Probabilités
================================

1. Espaces de probabilités
********************************

On note

* :math:`\omega` (petit-omega) un résultat possible
* :math:`\Omega` (omega) l'ensemble des résultats possibles
* A un événement tel que :math:`A \subset \Omega`. :math:`\overline{A}`
  est l'évènement contraire.
* :math:`\emptyset` un événement impossible
* :math:`\mathbb{P}(A)` la probabilité de l'évènement A, comprise entre 0 et 1
* :math:`\mathbb{P}(A) \cap \mathbb{P}(B) = \emptyset` deux événements incompatibles

2. Variables aléatoires discrètes
****************************************

Tribu
	:math:`\mathbb{F}` est une tribu sur :math:`\Omega`, soit un ensemble d'éléments de :math:`\Omega`,
	si

		* :math:`\Omega \in \mathbb{F}`
		* la tribu est stable par complémentaire
		* la tribu est stable par union dénombrable

Tribu Borélienne
	On appelle ouvert, un ensemble ouvert tel que ]0,255[ soit un ensemble qui ne contient aucun point de sa
	frontière.

	On note :math:`\mathbb{R}^d` le produit cartésien de d fois l'ensemble :math:`\mathbb{R}`.

	La tribu borélienne est une tribu engendré par l'ensemble des ouverts d'Omega.

		* Comme la tribu borélienne est engendrée par l'ensemble des ouverts de oméga, elle les contient tous.
		* C'est une tribu donc elle contient les complémentaires de tous les ouverts, donc tous les fermés.
		* C'est une tribu donc elle contient toute réunion d'ouverts et de fermés

.. http://www.les-mathematiques.net/phorum/read.php?3,779703,779703
	http://dictionnaire.sensagent.leparisien.fr/Tribu%20bor%C3%A9lienne/fr-fr/
	https://www.techno-science.net/definition/5291.html
	https://www.ilemaths.net/sujet-tribu-borelienne-402711.html
	https://fr.wikipedia.org/wiki/Tribu_bor%C3%A9lienne
	Yann J#2613 et FennecFeu#4212

Probabilité
	Il s'agit d'une fonction :math:`\mathbb{P}(\mathbb{F}) \to [0,1]`. Quelques propriétés :
		* :math:`\mathbb{P}(\overline{A}) = 1 - \mathbb{P}(A)`
		* :math:`\mathbb{P}(A \cup B) = \mathbb{P}(A) + \mathbb{P}(B) - \mathbb{P}(A \cap B)`
		* :math:`A \subset B \to \mathbb{P}(A) \le \mathbb{P}(B)`

2.1 Oméga non fini/dénombrable
---------------------------------------

Non traité

2.2 Oméga fini/dénombrable
---------------------------------------

Lorsque oméga est fini, on prends :math:`\mathbb{F}=P(\Omega)` soit l'ensemble des parties (donc tous les sous-ensembles
possibles) d'Omega.

Probabilité uniforme
	Soit :math:`\Omega` fini et dénombrable, :math:`\forall{w} \in \Omega \ alors \ \mathbb{P}(w) = \frac{1}{card(\Omega)}`.

	Dans ce cas, :math:`\mathbb{P}(A) = \frac{card(A)}{card(\Omega)}`

	.. note::

		Le cardinal = nombre d'éléments est aussi noté `|` ou `#`.

Probabilité conditionnelle
	Soit A et B deux évènements, il est possible de calculer la probabilités de A sachant celle de B

	.. math::

		\mathbb{P}(A|B) := \frac{\mathbb{P}(A \cap B)}{\mathbb{P}(B)}

	.. note::

		Par produit en croix, on obtient :math:`\mathbb{P}(A \cap B) = \mathbb{P}(B) * \mathbb{P}(A|B)`.

2.2.1 Loi discrètes
~~~~~~~~~~~~~~~~~~~~

2.2.1.1 Poisson
~~~~~~~~~~~~~~~~~~~~

Poisson

2.2.1.2 Exponentielle
~~~~~~~~~~~~~~~~~~~~~~~

Exponentielle

3. Variables aléatoires continues/à densité
*************************************************


4. Fonction caractéristiques
*************************************************

.. espérance exponentielle, caractériser une loi

5. Convergence
*************************************************

.. suites de v.a. et théorèmes limites (théorie des grands nombres)