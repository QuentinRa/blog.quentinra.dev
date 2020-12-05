========================================
4. CyberSécurité - Les problèmes du web
========================================

Exploration
	Il n'est pas impossible que vous ayez mal configuré les droits de lecture
	sur tous les fichiers de votre site. Des hackeurs peuvent alors chercher
	les endroits oubliés et tomber sur des informations qui peuvent être compromettantes
	(données secrètes etc...).

	La solution la plus facile pour remédier à cela est de configurer un .htaccess
	et de configurer la lecture uniquement des répertoires/fichiers dont vous avez
	conscience que des personnes pourront y accéder.

	CodeIgniter4 par exemple propose de ne pas exposer l'architecture de votre site :
	votre site (ex: https://example.com) va tentre vers un dossier /projet/public.
	Tous les autres dossiers seront dans /projet et comme il est impossible de revenir
	en arrière, alors les hackeurs ne veront que les fichiers dans /projet/public et non
	ceux de /projet.

	Comment découvrir les fichiers cachés ?
		Vous pouvez utiliser :code:`Gobuster` (https://github.com/OJ/gobuster).

		Cette commande prends une liste de mots, des extensions et teste toutes les possibilités
		de fichiers/dossiers. Vous pouvez filtrer pour n'afficher que les fichiers trouvés.

			:code:`gobuster dir -u domaine -w wordlist.txt -x extension, extension`

		Vous pouvez trouver des wordlist dans le dépôt SecLists, partie découverte/web :
		https://github.com/danielmiessler/SecLists/tree/master/Discovery/Web-Content

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=7GAFQdYCk5s

Exploration
	Dans la continuité, il se peut que vous ayez envie de tester une URL a paramètres avec pleins
	de valeurs possibles que ce soit une url  /user/5 ou une url /user?id=5. Sur le même principe qu'avec
	BurpSuite pour les formulaires, nous allons utiliser des listes et définir des arguments qui seront
	testés avec les valeurs de nos listes.

	On utilisera par exemple :code:`wfuzz`, au format suivant : :code:`wfuzz -c -z file, path/to/wordlist --h domaine:port/url/FUZZ`.
	FUZZ sera remplacé par toutes les valeurs de la wordlist.

		* --hw <word> : n'affiche que les requêtes retournant pas <word> mots
		* --hc <code> : n'affiche que les requêtes retournant pas le code <code> (ex: 200=ok, 404=pas trouvé, ...)
		* --hl <line> : pareil que hw mais avec des lignes
		* --hh <c> : pareil que hw mais avec des caractères
		* -d \"...\" : ... correspond a une éventuellement requête GET (donc var=...&var2=... etc...)

	Notez que port : 80 = http et 443 = https, généralement dans nos cas.

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=7GAFQdYCk5s

	Aide :

		* Documentation : https://wfuzz.readthedocs.io/en/latest/
		* pour installer :code:`wfuzz` sous windows, je recommande de passer par docker
		* téléchargez et installez dockerhub (https://hub.docker.com/editions/community/docker-ce-desktop-windows)
		* téléchargez et installez wsl (https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
		* redémarrez
		* dans un terminal, tappez : :code:`docker pull ghcr.io/xmendez/wfuzz`
		* terminé
		*
			pour utilisez la commande : :code:`docker run -it ghcr.io/xmendez/wfuzz wfuzz -h` revient
			a lancer :code:`wfuzz -h`
