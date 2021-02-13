==============
Jetbrains
==============

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 13/02/2021}`

Cette page contiendra des tutoriels sur les logiciels
jetbrains donc PHPStorm, IntelliJ Idea, CLion, WebStorm...

1. PHPStorm
============================

...

**Configuration remote**

Si vous voulez travailler sur un serveur distant, alors vous devez faire

	* Nouveau projet (from existing files)
	* Vous choisissez le serveur "Webserver is a remote host, ... ftp"
	* Vous donnez les informations (dossier/nom) du projet localement
	* Vous faites ajouter un remote serveur

		* Nom : juste un nom pour le retrouver
		* Type: FTP ou SFTP (si ssh)
		* Host: le host FTP PORT 21 (ou SFTP donc pour utiliser un compte ssh, PORT 22)
		* Username et Password : si FTP alors vos informations de connection
		* Root path: votre domicile (faites Autodetect)
		* WebServerUrl: l'URL http/https pour accéder au server par exemple `http://pgsql.pedago.ensiie.fr/~prenom.nom/`

	*

		Ensuite sélectionner (et/ou créer) le dossier dans lequel les fichiers seront mis sur
		le serveur (typiquement dans public_html vous ajouter un dossier)

	* Ensuite vous devez adapter l'URL du serveur pour qu'elle aille cherche le nouveau dossier créer
	* Attends dans Settings > Build ..., Deployment > Deployment (cliquez sur la flèche pour déplier) > Options
	*

		Changer la ligne "Upload changed files automatically ..." et mettre "on ... save action" pour que ce soit fait à chaque CTRL-S s'il y a
		eu des modifications.

Voici un code de test sur le serveur de l'ensiie, pour se connecter à la base de données (accessible
uniquement en intra)

.. code:: php

		<?php

		error_reporting(E_ALL);
		ini_set("display_errors", 1);

		$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");




-----

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* PHPSTORM
	* https://www.jetbrains.com/help/phpstorm/creating-a-remote-server-configuration.html
	* https://www.jetbrains.com/help/phpstorm/configuring-synchronization-with-a-remote-host.html#server-access-config
	* https://www.jetbrains.com/help/phpstorm/uploading-and-downloading-files.html#automaticUploadOnUpdate