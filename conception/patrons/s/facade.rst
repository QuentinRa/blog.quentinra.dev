==========================
Façade
==========================

Une façade est une API simplifiée c'est à dire que c'est une interface, qui
contient des méthodes simples.

Par exemple les utilisateurs ont l'habitude d'appeler certaines méthodes
pour la connexion : login, register, logout, ... mais dans le code il faut vérifier que l'utilisateur
existe (ou non)... Vous pouvez faire une interface avec des méthodes login, ...
et dans chaque méthode il y aura le code complexe. Le client fera login(...) sans avoir
a faire tout les appels de méthodes, d'éventuelles conversions (s'il a un nom d'utilisateur donc
une string, mais nous on travaille avec des id (int))...

More

	* :code:`➡️` : voir l'exemple plus haut de login/connection.
	* :code:`✅` : moins complexe, simple
	* :code:`🚫` : aucune nouvelle fonctionnalité, c'est juste un proxy et faut l'adapter si changement

Aucun exemple.