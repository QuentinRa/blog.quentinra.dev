==========================
Chain of Responsibility
==========================

Imaginons le client veut faire quelque chose. En utilisant une chaine de responsabilité,
on va demander dans l'ordre de responsabilité défini, à chaque des responsables
s'il peut faire la demande. Sinon, alors il va demander à quelque d'autre, soit
le suivant dans la chaine.

More

	*

		:code:`➡️` : par exemple si vous avez une méthode qui doit faire un truc selon un argument mais
		vous n'avez aucune idée de l'argument. Vous allez tester l'argument pour voir qui peut réaliser
		la demande parmi vos responsable et lui refiler le boulot.

	* :code:`✅` : flexible, réduit la liaison (agrégation)
	* :code:`🚫` : ...

Aucun, mais cet exemple est bien et c'est l'exemple typique de toute façon :
`chain_of_responsibility_pattern.htm <https://www.tutorialspoint.com/design_pattern/chain_of_responsibility_pattern.htm>`_
.