=========================
.htaccess
=========================

Sur un site web, si vous tapez l'URL d'un dossier alors vous
voyez tout son contenu.

	* (anciennement) on mets un index.html vide pour qu'il soit ouvert (donc on ne verra pas le contenu)
	* (mieux) on utilise un .htaccess

Introduction
---------------------

Un .htaccess est un fichier :code:`.htaccess` à la racine de votre site
(vous pouvez en mettre dans des sous-répertoires, mais tous les .htaccess depuis la racine
jusqu'à votre répertoire seront pris en compte dans l'application des règles).

Attention, le serveur doit être configuré (voir cours associé) pour que
les .htaccess aient un effet.

Vous pouvez

	* y définir un comportement PHP
	* définir des règles de redirection
	* réécrire des URL

On considère / comme la racine du site. On parle du URI pour
dire le chemin du site depuis /.

Redirection
------------

Il suffit de mettre :code:`Redirect <code> <uri> <to>` donc
qui redirige les accès à l'uri par l'adresse en <to> avec le code <code>.

.. code:: bash

	Redirect 301 /api https://duckduckgo.com/

Si mon site est https://duckduckgo.com/ alors https://duckduckgo.com/api/
va ouvrir rediriger vers la page https://duckduckgo.com/. Le code 301 indique
que c'est permanent sinon on mets 302.

Pour empêcher l'accès à des ressources, on peut utiliser

.. code:: bash

	RedirectMatch 404 regex

Changer le fichier par défaut

.. code:: bash

	DirectoryIndex index.php index.htm index.html autre.html

Rediriger toutes les 404 vers un fichier

.. code:: bash

	ErrorDocument 404 /error404.php

Réécriture des URL
-----------------------

Votre serveur doit avoir autorisé la réécriture des URL sinon
votre htaccess ne fera rien.

.. code:: bash

		# active la réécriture depuis la racine
		RewriteEngine On
		RewriteBase "/"
		# la règle ne s'applique pas aux dossiers
		# (donc nom valide de dossier par exemple /api et api existe)
		RewriteCond %{REQUEST_FILENAME} !-d
		# la règle ne s'applique pas aux fichiers
		# (donc nom valide de fichier par exemple test.html et test.html existe)
		RewriteCond %{REQUEST_FILENAME} !-f
		# sinon alors on redirige (non visible par l'utilisateur) vers la page
		RewriteRule ^(.+)$ api/index.php [L]

