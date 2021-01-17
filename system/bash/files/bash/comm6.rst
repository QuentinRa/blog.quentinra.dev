====================================================
Connaitre son environnement : id, uname, stat, file
====================================================

:code:`Description` : Commande pour avoir des infos sur la machine, un fichier, un utilisateur etc.

Commande :code:`id {user}` : information sur l'utilisateur
	Affiche les informations de l'utilisateur actuel si aucune option.

Commande :code:`uname` : permet de voir des informations sur sa machien
	| :code:`-rv` : informations sur le kernel
	| :code:`-a` : toutes les informations
	| :code:`-s` : OS
	| :code:`-m` : type d'architecture (x64, x86_64, x32)

Commande :code:`date` : affiche la date

Commande :code:`stat <fichiers>*` : #affiche pleins d'infos sur un fichier/plusieurs
	Sans options, affiche toutes les informations.

	| :code:`-c "format"` : format d'affichage (%s = taille, %n = nom, %A = permissions, %w = date de création, %F = Type, ...)

Commande :code:`file <fichier>` : affiche des informations sur un fichier
	Pratique sur les images, pour obtenir la résolution etc.

	| :code:`-c -m "f_magik"` : définit le fichier magique de l'analyse (un fichier magique décrit comment sont les données d'un .png par exemple)
