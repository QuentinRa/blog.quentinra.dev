===========
NullObject
===========

Le NullObject est un objet dont les méthodes sont "vide". On leur a donné
un comportement par défaut

		* lever une exception "non codé"
		* retourner true/false,
		* retourner 0, ...
		* retourner un autre NullObject

L'utilité est que vous allez éviter de forcer le programmeur à vérifier
que l'objet est null ou non et le traiter, mais faire une méthode
isNullObjet() qui retourne true si c'est l'objet null sinon false, donc vous
rendez ça plus flexible/plus simple (s'il devait check à plusieurs endroits par exemple).

Il peut également choisir d'ignorer les éléments nulls (donc les NullObjets)
vu qu'ils ont un comportement par défaut donc son code devrait quand même marcher.

More

	* :code:`➡️` : à vous de voir où l'utiliser
	* :code:`✅` : code plus simple, flexibilité
	* :code:`🚫` : vous devez coder une classe en plus et la maintenir