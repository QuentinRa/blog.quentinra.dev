====================================================
Utilitaire de survie II : mkdir, touch, mv, cp, rm
====================================================

:code:`Description` : création/renommage et suppression de fichiers/dossiers.

Commande :code:`mkdir <chemin>` : Crée un répertoire
	| :code:`-p` : tous les dossier non-existants du chemin son crées

Commande :code:`touch <fichier>` : Permet de créer un fichier
	Cette commande met à jour sa date de modification s'il existe donc ne le vide pas.
	Les pros font un :code:`echo -n "" > <fichier>` plutôt que touch.

Commande :code:`mv <source>+ <destination>` : Permet de déplacer [et renommer] un fichier/dossier
	Je recommande cette commande pour renommer, il suffit de faire :code:`mv ./nom ./nouveau_nom`.

Commande :code:`cp <source> <destination>` : Permet de copier [et renommer] un fichier/dossier
	| :code:`-r` : copier un dossier
	| :code:`-f` : sans confirmation (si destination existe)
	| :code:`-i` : demander confirmation si destination existe

Commande :code:`rm <chemin>*` : Permet de supprimer un fichier/dossier
	| :code:`-r` : supprimer un dossier et ses sous-dossier (existe aussi :code:`rmdir`
	| :code:`-f` : sans confirmation (si destination existe)
	| :code:`-i` : demander confirmation si destination existe

Commande :code:`ln` : Permet de créer un lien symbolique
	Forme est : :code:`ln -s chemin_i chemin_o`.

	| :code:`-s` : lien symbolique vers chemin_lien
	| :code:`chemin_i` : cible du lien
	| :code:`chemin_o` : destination du fichier créé