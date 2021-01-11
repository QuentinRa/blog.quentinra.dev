=====================================
Organisation
=====================================

Pour faciliter l'utilisation d'un dépôt pour d'autres programmeurs,
vous pouvez définir des règles sur comment ils doivent agir.

.github/CODE_OF_CONDUCT.md
	Un fichier bidon sur comment utiliser le répertoire.

	Template : https://github.com/EmbarkStudios/opensource-template/blob/main/CODE_OF_CONDUCT.md

.github/CONTRIBUTING.md
	Un fichier rédigé comme vous voulez qui contient des indications sur comment contribuer au projet.

.github/SECURITY.md
	Votre politique en cas de problème/découverte de faille de sécurité et comment vous signaler une faille.

pom.xml
	Si projet Maven/Gradle, alors la liste des dépendances du projet : utile pour les alertes en cas
	de problème dans un dépôt dépendant.

requirements.txt
	Si projet python, les paquets pip requis pour pouvoir compiler (format : :code:`nom==version`, 1 par ligne
	mais généralement vous rédigez pas ça a la main).