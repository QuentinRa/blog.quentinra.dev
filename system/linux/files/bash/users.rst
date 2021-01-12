==========================================================
Utilisateurs : adduser, deluser, id, su, ...
==========================================================

:code:`Description` : commande lié à la création, modification, récupération ... des utilisateurs et de leur informations.

Commande :code:`useradd <login>` : Créer un utilisateur
	| :code:`-g` : assigner groupe
	| :code:`-b` : définir le domicile
	| :code:`-m` : créer le domicile

Commande :code:`groupadd <name>` : Créer un groupe

Commande :code:`passwd <login>` : Changer de mot de passe

Commande :code:`deluser <user>` : Supprimer un utilisateur

Commande :code:`delgroup <name>` : Supprimer un groupe

Commande :code:`su <login>` : Changer d'utilisateur

Commande :code:`id {login}` : info sur un utilisateur
	Sans argument affiche celle de l'utilisateur actuel

Commande :code:`whoami` : nom utilisateur session courante