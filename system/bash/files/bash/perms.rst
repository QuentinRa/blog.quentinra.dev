======================================
Permissions
======================================

:code:`Description` : Commande liées aux permissions.

Commande :code:`chmod` : Change les permissions d'un dossier/fichier.
	Vous pouvez utiliser chmod code fichier avec code 751 par exemple.

	:code:`<cible+>+<perm+>` : ajoute à la cible la/les permissions
	:code:`<cible+>-<perm+>` : retire à la cible la/les permissions
	:code:`<perm_code>` : définit les permissions depuis un code

	On considère

		* cible : u (user), g (groupe), o (others), a (tous)
		* perm : r, w, x
		* perm_code : 700 par exemple, ... (voir le cours).

	Vous pouvez mettre plusieurs perm/cibles à la suite.

	| Ex : :code:`chmod 700 fichier` (donne rwx à u (user))
	| Ex : :code:`chmod ug+rwx fichier` (donne (car +) rwx à u (user) et g (groupe).

Commande :code:`umask` : affiche les permissions manquantes par défaut à la création d'un fichier

	:code:`umask` retourne 0026, cela veut dire que les permissions 751 sont celles par défaut.

Commande :code:`chown <nouveau_prop> <fichier>` : Change le propriétaire d'un fichier

	:code:`-h` : aucune déférence (truc avec les liens symboliques)