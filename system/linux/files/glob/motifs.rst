=========================================
Motifs (glob pattern)
=========================================

Les chaines de caractères contenant \*, ?, [, ... sont des motifs,
donc le shell remplace notre texte par le motif correspondant seulement s’il en existe un sinon
il reste inchangé.

Les wildcards (\*, ?, [ ) sont :

	*	:code:`x` qui signifie exactement un fois le caractère x
	*	:code:`*` qui signifie un chaine de caractères possiblement vide
	*	:code:`?` qui signifie exactement un caractère
	*	:code:`[...]` qui signifie exactement un caractère parmi ceux entre crochet
	*	:code:`[^...]` ou :code:`[ !...]` signifie exactement un caractère qui ne soit pas parmi ceux entre crochet.

Il est également possible d'utiliser des intervals : 	:code:`[a-z]` ou :code:`[0-9]`

Il existe quelques expressions pour éviter de devoir tapper certains motifs

	* :code:`[[ :digit :]]` pour un nombre
	* :code:`[[ :upper :]]` pour une majuscule
	* :code:`[[ :lower :]]` pour une minuscule
	* :code:`[[ :space :]]` pour les caractères espace, tabulation, saut de ligne…
	* :code:`[[ :alnum :]]` pour tous les caractères alphanumériques.

.. note::

	On peut protéger un caractère avec \ ou encore avec [caractère] (donc seulement caractère dans l’intervalle).

	Ex : On peut faire \\$ ou [$] pour matcher le caractère \'$\' .
