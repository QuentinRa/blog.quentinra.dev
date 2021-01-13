====================================================
Utilitaire de survie spécial : tar, wget
====================================================

:code:`Description` : Commandes utilisées de temps en temps mais très pratiques.

Commande :code:`tar` : archiver/dé-archiver
	Typiquement, on extrait avec :code:`tar xvf archive.tar.gz` et on compresse avec
	:code:`tar cvzf nom.tar.gz <fichiers>+`

	| :code:`x` : extraire
	| :code:`v` : log
	| :code:`f <fichier.tar.gz>` : spécifier le nom de l'archive (a extraire ou qui sera créée)
	| :code:`c` : créer
	| :code:`z` : compression

Commande :code:`wget <url>` : permet de télécharger une ressource depuis une url
	| :code:`-d` : dossier

Commande :code:`ssh login@host` : permet de se connecter à une autre machine
	login corresponds à votre nom d'utilisateur et host à l'adresse ip de la machine ou du réseau
	sur lequel vous vous connectez. Vous pouvez utiliser un nom de domaine.

	| :code:`-u` : port, optionnel si 22

Commande :code:`diff <fichier> <fichier>` : montre la différence entre deux fichiers