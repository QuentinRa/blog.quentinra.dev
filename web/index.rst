.. _web_g:

================================
Web
================================

| :math:`\color{grey}{Version \ 0.1.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 22/01/2021}`

1. Introduction
===================================

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
	* PHP : code qui modifie l'HTML avant de l'envoyer, côté serveur (fichier .php)

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

...

4. CSS
====================

...

5. JS
====================

...

6. PHP
====================

...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune