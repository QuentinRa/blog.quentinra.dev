========================================
4. CyberSécurité - Les problèmes du web
========================================

Connexion
	Dans ce cas les pages de la forme :code:`/modifier/profil/5`, alors il est déjà arrivé que modifier
	le 5 par l'identifiant d'un autre utilisateur permettent d'usurper son identité. Il est donc important
	de détecter et protéger de tel usages.

Formulaires/Connexion
	Le problème avec l'authentification sont les combinaisons user/password qui sont trop facile à devenir.

	Cela peut venir du fait que l'utilisateur a créé une combinaison trop simple ou d'identifiants par défaut
	qui n'ont pas étés modifiés (le admin admin par exemple) !

	Vous pouvez tester une telle attaque avec le logiciel :code:`BurpSuite`. Vous aurez besoin
	de capturer le \"formulaire\", puis trouver les champs (ex: user, password) qui contiennent les données
	et ré-générer le formulaire en modifiants les valeurs des champs avec une liste de valeurs.

	Le dépôt https://github.com/danielmiessler/SecLists/ contient un dossier Password et un dossier Usernames
	qui contiennent des fichiers de listes de mots de passes/usernames souvent utilisés.

	Notez que pour vous protéger de ces attaques, vous pouvez ajouter un captcha par exemple.

	Vidéo de présentation et d'un exemple : https://www.youtube.com/watch?v=cQq6xPCZFjg

	BurpSuite
		Installer le logiciel BurpSuite. Vous devez configurer un proxy dans le navigateur qui
		redirige sur localhost (127.0.0.1) le formulaire
		(voir `tuto ici <https://portswigger.net/burp/documentation/desktop/getting-started/proxy-setup/browser>`).

		Une fois fait, dans BurpSuite créez un projet puis allez dans Proxy puis cliquez sur :code:`intercept`
		et activez :code:`intercept is on`. Remplissez le formulaire et envoyez le (activez l'interception après
		être arrivé sur la page !).

		Allez dans :code:`target` puis trouver la requête dans la liste et cliquez dessus et faites
		:code:`send to intruder`.

		Allez dans :code:`intruder` et mettez :code:`cluster bomb` dans le type d'attaque. Les mots remplacés
		sont ceux entre $$. Le 1er sera appelé 1, le 2e 2... Allez dans :code:`Intruder > payloads`.

			* pour payload set 1 par exemple user

				* allez dans payload options en bas et ajouter les mots a tester comme user (x valeurs)

			*  pour payload set 1 par exemple password

				* allez dans payload options en bas et ajouter les mots a tester comme password (y valeurs)

			* lancez l'attaque, Burp va tester x * y combinaisons.
			* Dans les résultats, regardez ceux qui sont différents (tous ceux d'erreur sont généralement pareil)

				* testez à la main les résultats particuliers
				* l'un d'eux pourrait être le bon