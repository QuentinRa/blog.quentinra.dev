================================================================
2. Présentation de Cypher - Requêtes avancées - listes
================================================================

Vous pouvez utiliser des listes par exemple dans le where
avec :code:`attribut in liste`. Ces listes peuvent
être générées programmatiquement.

On utilise [...] pour déclarer la liste, ... est le code pour générer ses éléments

	* :code:`[x in range(0,5)|x]` donne la liste [0,1,2,3,4,5]. Le \|x est optionnel
	* :code:`[x in range(0,5) WHERE x+2<5 |x^2]` donne la liste [0^2,1^2,2^2]

Range
	Comme en python, range(min, max) donne une liste correspondant à l'ensemble : [min,max].

Les listes fonctionnement sont des tableaux donc on peut accéder a un élément
avec liste[index], sachant que les indexes peuvent être négatif ou plus grand que la liste (dans
ce cas on retourne au début/à la fin pour rester dans la liste).

	* :code:`range(min, max)[0]` : indice 0
	*	:code:`range(début, fin)[-1]` : dernier
	*	:code:`range(début, fin)[1..3]` : prends 1 et 2
	*	:code:`range(début, fin)[..3]` : prends 0,1,2
	*	:code:`range(début, fin)[3..]` : prends 3,4,...

Vous pouvez également utiliser une arête

.. code:: cypher

	MATCH (p: person)
	; dans le where possible aussi
	RETURN [(p)-->(m:maison) WHERE m.ville="Paris"|m.nom]