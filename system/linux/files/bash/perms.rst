======================================
Permissions
======================================

:code:`Description` : Commande liées aux permissions.

Commande :code:`chmod`
	Change les permissions d'un dossier/fichier.

	Vous pouvez utiliser chmod code fichier avec code 751 par exemple.

	Vous pouvez également faire :code:`e[+ ou -]p` avec :code:`e` : u (user), g (groupe), o (others), a (tous) ;
	:code:`+` : donner permissions, :code:`-` : retirer permissions et :code:`p` des permissions : r, w, x

	Exemples: :code:`chmod 700 fichier` (donne rwx à u (user))
	ou :code:`chmod ug+rwx fichier` (donne (car +) rwx à u (user) et g (groupe).

Commande :code:`umask`
	affiche les permissions manquantes par défaut à la création d'un fichier

	:code:`umask` retourne 0026, cela veut dire que les permissions 751 sont celles par défaut.