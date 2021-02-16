.. _apache:

================================
Serveur apache (Linux/Windows)
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 16/02/2021}`

1. Introduction
===================================

Un serveur apache vous permet d'héberger un site web, en particulier vous
pourrez exécuter du php ou un framework côté serveur (node.js, ...).

Vous pouvez utilisez des logiciels qui font tout pour vous comme WampServer (Windows), XamppServer (Linux) ou
MampServer (MacOs).

Si vous souhaitez le faire manuellement (ce qui est très instructif), alors vous pouvez passer
directement à la partie 3.

2. WampServer
===================================

Allez sur le site https://www.wampserver.com/ et télécharger une version (vous serez redirigé
vers sourceforge par exemple https://sourceforge.net/projects/wampserver/files/WampServer%203/WampServer%203.0.0/).

Ensuite lancer l'installation, vous pouvez ou non faire suivant partout. Il vous demandera
probablement de choisir un navigateur, si vous ne trouver pas le chemin alors

	* tapez le nom de votre navigateur de la barre de recherche en bas à gauche
	* faites un clic droit dessus et ouvrir l'emplacement du fichier
	* vous tombez sur un raccourcis, faites encore ouvrir l'emplacement du fichier
	* vous avez trouvé le chemin de votre navigateur

Une fois l'installation terminé, il faut savoir que vous devrez lancer le logiciel à chaque
redémarrage (il sera dans le barre des icônes avec le son, la batterie, votre connexion internet, ...)
sauf si vous l'avez configuré pour qu'il se lance tout le temps.

Une fois le serveur lancé, l'URL http://localhost correspond à la racine de votre serveur
et les fichiers se trouvent réellement à l'emplacement

	* Windows : :code:`C:\wamp64\www\index.php`
	* Linux : :code:`/var/www/html/`

Les scripts PHP utilisent souvent une base de données. Ici vous
pouvez y accéder avec http://localhost/phpmyadmin/, root sans mot de passe.

Notez que pour éviter des bugs, vous devriez explicitement choisir votre base de données
(mysql, mariadb) ce qui se fait avec clic droit sur wamp > paramètre wamp et ne laissez
que mariadb (ou mysql) pour éviter des problèmes plus tard.

Vous pouvez changer la lange avec clic droit sur wamp > langue.

Enfin, vous pouvez changer la version PHP avec clic gauche sur wamp > php > version.

Si vous êtes du genre à vous faire du mal, vous pouvez aussi essayer d'installer postgre
(https://www.enterprisedb.com/downloads/postgres-postgresql-downloads). Il faudra faire attention
car les versions 12+ inclue demandent php 7.4.0 ou plus. Tapez dans la barre de recherche
:code:`pgadmin` pour lancer "phpmyadmin". Attention ! Vous devez d'abord peut être lancer le serveur
avec :code:`psql -U user` dans un powershell.

3. Introduction au serveur apache
====================================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune