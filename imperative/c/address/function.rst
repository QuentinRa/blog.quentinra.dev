================================================================
7. Adresses et tableaux dynamiques - Pointeur de fonction
================================================================

Un pointeur de fonction est comme son nom l'indique
une variable qui contient l'adresse d'une fonction.

Le nom d'une fonction est comme une variable (c'est un pointeur)
donc vous pouvez la passer à une fonction qui attends un pointeur de fonction.

La signature d'une fonction qui attends un pointeur de fonction est de la forme

.. code:: c

	type_retour (type_passé nom)(type_argument, ...)

	// exemple on veut une adresse de fonction (*) qu'on appelle handler (pas important)
	// qui a pour type de retour void et un seul argument de type int
	void (*handler)(int)