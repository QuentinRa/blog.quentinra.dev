========================================
4. CyberSécurité - Les problèmes du web
========================================

Cookies
	En faisant :code:`F12` (généralement/inspecter l'élément), dans la partie
	application > cookies, vous avez des informations sur les cookies utilisés.

	Les cookies sont généralement encryptés, mais ils peuvent possiblement
	être décryptés, modifiés et ré-encryptés. Ainsi une personne peut modifier
	la valeur user d'un cookie et devenir quelqu'un d'autre.

	Outil : https://gchq.github.io/CyberChef/
		Permet de convertir hexadecimal, ... vers un autre langage.

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=BJF84oWHmok

FileUpload et ReverseScript
	L'idée est que lorsqu'on upload un fichier sur le net, il y a des filtres (ex: .png, .pdf, etc...)
	cependant certaines fois ils sont mal fait, et un fichier :code:`reverse_script.png.php` peut être upload
	car le serveur va croire que c'est bien un .png.

	Le soucis est que lorsque vous accédez à une page web (ex: index.php), alors le scripte est exécuté sur le serveur
	et une page est retournée. Si vous trouvez l'URL de votre script, alors vous pourrez aussi l'exécuter ! Par
	exemple vous pourrez ouvrir une porte dérobée (backdoor) sur le serveur et vous connecter dessus.

	Pour trouver le chemin d'upload, vous pouvez tester des répertoires connus : :code:`/upload`, :code:`/images`,
	:code:`/media`, :code:`/ressources`, :code:`/tmp`. Donc vous faites https://domaine.com/upload/reverse_script.png.php
	par exemple, :code:`/` désigne le "End Point" soit la racine du site.

	Sur votre machine, vous devez ouvrir une connection (ex: :code:`sudo nc -lvnp 443`) pour interagir avec le
	reverse_script qui va se connecter sur votre machine par exemple. Notez le port :code:`443` (https) : si vous
	utilisez un port autre que http/https alors vous risquez de vous faire détecter car vous n'utilisez pas un port connu.
	En tant que défenseur, vous pouvez retrouver la machine qui s'est/se connecte avec le script, car le script contient
	des informations sur la machine puisqu'il va essayer de se connecter dessus pour établir une connection.

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=F_nTIX-q32k