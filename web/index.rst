.. _web_g:

================================
Web
================================

| :math:`\color{grey}{Version \ 0.2.3}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/01/2021}`

1. Introduction
===================

On définit le Web par les pages web que vous consultez
en tapant une URL (ex : https://duckduckgo.com/).

Les pages web sont écries en HTML, le style est définit en CSS. Lorsque vous tapez
une url, alors elle est envoyée à un serveur qui retourne une page HTML qui est affichée dans votre navigateur.
Vous pouvez exécuter du code sur le serveur (ex: mettre la date du jour, ...) avec PHP. Enfin, vous pouvez
exécuter du code dans la navigateur du client (ex: animations, ...) avec la JavaScript.

Il existe de nombreuses personnes qui n'aiment pas le web, donc il existe de nombreux moyens
de coder des sites sans faire de HTML/CSS/...

Résumé

	* HTML5 : contenu d'une page affichée (fichier .html)
	* CSS : style d'une page (fichier .css)
	* JavaScript : animations dans le navigateur (fichier .js)
	* PHP (+SQL) : code qui modifie l'HTML avant de l'envoyer, côté serveur (fichier .php)

Note sur les frameworks
---------------------------

Alternativement, pour simplifier le développement car beaucoup de sites se ressemblent,
il existe des framework. Des frameworks CSS connus sont : Bootstrap, MDBoostrap, w3css
et des frameworks PHP connus sont : Zend, Symphony, Laravel et CodeIgniter (pas trop vrai mais :p).

Note sur les protocoles
------------------------

Il est intéressant de savoir qu'une page est soit en :code:`http` (port 80)
ou soit :code:`https` (port 443, sécurisé).

N'importe quel serveur peut devenir https gratuitement et facilement
avec :code:`let's encrypt`.

Vous pouvez préciser le port avec :code:`url:port` si votre site web (ou le site web)
utilise un autre port que 80/443.

Note sur la console
-----------------------

En appuyant sur F12 ou sur CTRL+i ou [clic droit puis inspecter] vous pouvez ouvrir
une console.

	* Elements : voir le code de la page (HTML/CSS), modifiable
	* Console : tapez du javascript
	* Source : voir les fichiers du site
	* Application : voir les cookies/sauvegardes locales/autres crées par le site

Note sur FTP
-------------------------

Vous allez généralement devoir mettre vos fichiers sur le serveur web. On utilise généralement
FileZilla sous Windows ou :code:`ftp`. Il suffit de se connecter et déplacer les fichiers
sur le serveur.

2. Organisation
==================

Généralement, la structure d'un site web (simple) est de la forme

.. code:: none

	/
	-----
	----- assets/
	---------- css/
	--------------- style.css
	---------- js/
	--------------- [...].js
	---------- img/
	--------------- [...].png
	----- pages/
	---------- [...].html
	----- index.html

Cette disposition permet de voir clairement les éléments du site (donc
pas tout dans le même dossier).

Lorsque vous tapez une url

	* :code:`https://mangadex.org/title/46592/kill-the-hero`
	* :code:`https://mangadex.org/` : correspond à la racine
	* :code:`title/46592/kill-the-hero` : depuis la racine dossier title/.../kill-the-hero/
	* lorsqu'il n'y a pas affiché [...].html ou [...].php alors c'est que le fichier index est utilisé (php ou html)

Attention, vous voyez que n'importe qui peut visiter votre site et trouver
tout ce que vous auriez pu cacher. Généralement, un fichier .htaccess sera utilisé
pour bloquer l'accès extérieur (donc depuis un navigateur). On verra cela plus tard.

3. HTML
====================

Pour faire tourner de l'HTML, il suffit de déposer un .html dans votre navigateur.

Alternativement si vous êtes sous linux et avez un :code:`public_html`
alors vous pouvez y accéder via une url (généralement
de la forme :code:`https://domaine/~nom_utilisateur/fichier.html` si fichier.html
est dans public_html). Si ce dossier n'est pas configurer, alors regarder
le cours pour "setup" un serveur apache.

Sinon vous pouvez utiliser le moyen vu en PHP (wamp) qui est un logiciel
qui "setup" un serveur apache lorsqu'il est lancé (donc pas permanent).

4. CSS
====================

Un fichier généralement appelé style.css. Voir le cours pour l'appliquer
au HTML. Aucune configuration requise.

5. JS
====================

Un fichier .js. Permet d'exécuter des scripts dans le navigateur. Aucune configuration requise.

Vous noterez que dans la partie console de la console F12 alors vous pouvez directement
taper du javascript sur n'importe quel site.

6. PHP
====================

Vous pouvez faire de l'HTML dans un PHP mais pas l'inverse. Vous devez
avoir une machine qui fait office de serveur (cela peut être la votre dans
ce cas l'URL sera http://localhost).

Pour ce faire, vous pouvez configurer un serveur apache.

Ou vous pouvez installer WampServer (Windows), XamppServer (Linux) ou
MampServer (MacOs).

Petite note, sous wamp, l'URL http://localhost correspond à la "racine"

	* Windows : C:\wamp64\www\index.php
	* Linux : /var/www/html/
	* Mac : ???

Les scripts PHP utilisent souvent une base de données. Ici vous
pouvez y accéder avec http://localhost/phpmyadmin/, root sans mot de passe.

-----

**Crédits**
	* Tous les contributeurs des autres cours de web, indirectement
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://filezilla-project.org/
	* https://www.w3schools.com/
	* https://validator.w3.org/
	* https://codeigniter.com/
	* https://www.w3schools.com/howto/default.asp