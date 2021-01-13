===========================================
Utilitaire de survie I : man, ls, cd, cat
===========================================

:code:`man <commande>` donne des informations sur commande
	Il y a des pages de documentation par exemple :code:`man 3 <commande>` pour certaines commandes (si on
	vous dit de regarder à la page ... par exemple).

:code:`ls <dossier>*` : Permet de voir le contenu d'un répertoire
	| :code:`-l` : affichage de toutes les informations (long)
	| :code:`-a` : affiche les fichiers cachés
	| :code:`-A` : sans . et ..
	| :code:`-s` : affiche la taille
	| :code:`-S` : tri selon taille
	| :code:`-R` : Récursif

:code:`cd {dossier}` : Permet de se déplacer
	Sans dossier, vous déplace dans votre HOME.

:code:`echo "..."` : Affiche ce qui suit le echo dans le terminal
	Par exemple :code:`echo "Hello World"` affiche "Hello World". Vous pouvez l'utiliser pour
	vérifier qu'un script marche bien, ou n'importe quoi d'autre.

	Les "" sont facultatifs mais recommandés et obligatoires dans certains cas.

	| :code:`-n` : pas de saut de ligne après le echo
	| :code:`-e` : -caractère hexadécimal, ...

:code:`cat <fichier>` ou :code:`less <fichier>` : vous permet de lire un fichier
	Pour fermer un fichier ouvert avec less, appuyez sur q.