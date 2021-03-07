==========
Adaptor
==========

Aussi appelé Wrapper.

On va simplement faire une classe disons Wrapper qui va faire
le lien entre une classe A et une classe B. Wrapper va implémenter la classe
A et extends la classe B en faisant en sorte que les méthodes de A utilisent les
méthodes de B.

More

	* :code:`➡️` : par exemple, interface entre votre code et l'API de paiement d'une banque (dit client)
	* :code:`✅` : faire une intégration propre (ou une intégration tout court)
	* :code:`🚫` : du code supplémentaire rajouté, pouvant être important (s'il y a un grand écart entre la forme de votre code/ce que le client veut)

Aucun exemple.

	* A : client (interface)
	* B : notre classe (concrete)
	* Wrapper extends B implements A : classe adaptatrice
	* Wrapper : chaque méthode de A appelle une/plusieurs méthode de B