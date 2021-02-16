======================
Configuration remote
======================

Si vous voulez travailler sur un serveur distant (remote server), alors vous devez faire

	* Nouveau projet (from existing files)
	* Vous choisissez le serveur "Webserver is a remote host, ... ftp"
	* Vous donnez les informations (dossier/nom) du projet localement
	* Vous faites ajouter un remote serveur

		* Nom : juste un nom pour le retrouver
		* Type: FTP ou SFTP (si ssh)
		* Host: le host FTP PORT 21 (ou SFTP donc pour utiliser un compte ssh, PORT 22)
		* Username et Password : si FTP alors vos informations de connexion
		* Root path: votre domicile (faites autodetect)
		* WebServerUrl: l'URL http/https pour accéder au server par exemple `http://pgsql.pedago.ensiie.fr/~prenom.nom/`

	*

		Ensuite sélectionnez (et/ou créez) le dossier dans lequel les fichiers seront mis sur
		le serveur (typiquement un dossier dans public_html ou directement public_html)

	* Ensuite vous devez adapter l'URL du serveur pour qu'elle aille cherche le nouveau dossier créé
	* Allez dans Settings > Build ..., Deployment > Deployment (cliquez sur la flèche pour déplier) > Options
	*

		Changer la ligne "Upload changed files automatically ..." et mettre "on ... save action" par exemple

Voici un code de test sur le serveur de l'ensiie, pour se connecter à la base de données (accessible
uniquement en intra)

.. code:: php

		<?php

		error_reporting(E_ALL);
		ini_set("display_errors", 1);

		$c = new PDO("pgsql:dbname=tpphp;host=pgsql2;port=5432", "tpphp", "tpphp");