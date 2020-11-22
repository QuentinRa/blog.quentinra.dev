================================================================
2. Spécificité du C - Notions d'adresse
================================================================

En C, on distingue les notions de valeurs et d'adresse.

Adresse
	Une variable a une valeur, et cette valeur est stockée à un endroit dans
	la mémoire appelé adresse.

Lorsque l'on passe une variable en paramètre à une fonction, c'est la valeur
qui est transmise (donc une nouvelle adresse est créé). Si on veut modifier
la valeur d'une variable, alors on doit passer par une adresse.

Ce raisonnement s'applique en boucle si on veut modifier la valeur
d'une variable (même si cette variable contient elle même une adresse).

Pointeur
	Une variable qui contient l'adresse d'une case dans laquelle
	est stockée une valeur est appelé un pointeur.