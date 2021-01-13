================================================
Les opérateurs : &&, \|\|, ;, `` et les calculs
================================================

Le bash admet plein d'opérateurs comme les autres langage

	* :code:`commande1 && commande2` : si la commande1 marche, alors on fait la commande2
	* :code:`commande1 || commande2` : si la commande1 échoue alors on fait la commande2
	* :code:`commande1 ; commande2` : fait commande1 puis commande 2

**Comment le bash détermine qu'une commande a marché**

Toutes les commandes ont un code de retour. Si ce code vaut 1 alors la commande a **échouée**
(inverse du C) et lorsqu'il vaut 0 alors la commande a réussie.

Le commande :code:`echo $?` permet de voir le code de retour de la toute dernière commande exécutée.

Vous pouvez faire un calcul avec

	* :code:`$[expression]` : donc par exemple :code:`echo $[0+1]`
	* :code:`$((expression))` (pas à la norme POSIX!) : donc par exemple :code:`echo $((0+1))`

Vous pouvez exécuter une commande dans une autre commande

	* :code:`commande `autre commande`` (ex: :code:`ls `echo ~``)
	* :code:`commande $(autre commande)` (ex: :code:`ls $(echo ~)`)