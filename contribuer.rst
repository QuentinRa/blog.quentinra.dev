##########################################
Comment contribuer ?
##########################################

.. _editor: https://livesphinx.herokuapp.com/

Désolé, mais vous allez avoir besoin d'un compte `github <https://github.com/>`_ pour contribuer...

Le dépôt est ici : `https://github.com/QuentinRa/ramsamy.ws-res <https://github.com/QuentinRa/ramsamy.ws-res>`_.

1. Rédaction des cours
*************************

Vous pouvez rédiger des cours, le langage est :code:`ReStructured Text`, le format "basique" d'un cours
est dans `assets/template.rst <_static/template.rst>`_.

Vous pouvez écrire vos cours ici: `editor`_
et ensuite copier votre code dans un fichier index.rst, que vous nous envoyez.

.. note::

	Un tutoriel sur le :code:`Restructured text` sera fait prochainement, le fichier
	`save.rst <_static/save.rstt>`_ contient mes notes.

.. hint::

	Vous pouvez regarder comment d'autres cours sont fait !

1.1 Détails sur la structure
-------------------------------

Les cours sont répartis en parties (Mathématiques, Système, ...) qui correspondent aux dossiers
à la racine du projet.

Les sous-dossier correspondent aux cours, un par cours. Le nom du fichier :code:`rst` du cours est toujours
:code:`index.rst`.

1.2 Autres détails
-------------------------------

.. warning::

	N'oubliez pas de donner les crédits et de citer les références de vos cours.

		* crédits : personnes qui ont majoritairement contribué au cours
		*
			références : liens que vous avez utilisé pour enrichir votre cours, ou qui seraient intéressant de
			consulter

Sautez à la partie :ref:`push_github` pour mettre en ligne votre cours.

2. Rédaction des exercices et des corrections
************************************************

La rédactions des exercices et des corrections est séparée.

Chaque cours peut posséder un dossier exercice qui contient les consignes, un fichier par thème
d'exercices. Le template du fichier des consignes est dans `assets/exercices.rst <_static/exercices.rst>`_.

Ensuite pour chaque exercice, on crée un dossier avec le même nom que le fichier de consignes.
Le fichier de correction est nommée de la forme :`{d}{id}[_p]`.

	* d = difficulté, donc soit d (débutant), soit s (supérieur), soit a (avancé)
	* id = identifiant de l'exercice dans le fichier de consignes
	* _p est optionnel, avec p le n° de la proposition de correction, par exemple _2 si c'est la 2e proposition

.. _push_github:

4. Mettre en ligne
************************************************

Le moyen le plus simple pour l'instant de mettre un fichier en ligne,
est de faire :

.. image:: https://user-images.githubusercontent.com/54904135/97611296-44c07b80-1a16-11eb-8139-8d1eb84bc663.png

puis de déposer votre fichier et de faire,

.. image:: https://user-images.githubusercontent.com/54904135/97611375-64f03a80-1a16-11eb-8626-f54f4972d721.png

On s'occupera d'ajouter votre cours (donc ce ne sera pas fait automatiquement, contrairement à la méthode compliquée).

5. Corriger un cours/exercice/...
************************************************

Commencez par vous déplacer sur le cours que vous voulez éditer, puis cliquez sur le petit crayon
(encadré en jaune sur l'image).

.. image:: https://user-images.githubusercontent.com/54904135/97612016-2c9d2c00-1a17-11eb-8995-83a49383d445.png

Appuyez sur CTRL+A pour sélectionner tout le contenu du fichier, puis copiez le contenu
ici : `editor`_

... éditez le fichier ...

Remplacez le contenu de l'ancien fichier par le nouveau.

.. image:: https://user-images.githubusercontent.com/54904135/97612422-b51bcc80-1a17-11eb-94bc-c5c613eebae0.png

On s'occupera ensuite de valider vos changement (donc ce ne sera pas fait automatiquement, contrairement à la méthode compliquée).

6. Compiler la doc chez soi
****************************************************

.. code:: bash

		git clone https://github.com/QuentinRa/ramsamy.ws-res.git
		make html
		open _build/html/index.html

.. note::

	Ces commandes téléchargent lé dépôt git, compilent la doc et ouvre le site généré.

	Vous devez cependant installer, une et une seule fois, certaines composantes
	sinon la compilation va échouer.

Les pré-requis sont :
	* Installer python (et ajouter au PATH+ ajouter le dossier Scripts!)
	* Installer pip :code:`python -m pip install -U pip`
	* Installer sphinx :code:`pip install -U sphinx`
	* Installer le thème :code:`pip install -U sphinx-rtd-theme`
	* Installer graphviz :code:`pip install -U graphviz`

		* sous windows, vous devez ajouter graphviz/dot.exe au path
		* sous windows, ouvrez un terminal et lancez :code:`dot -c` à la toute première utilisation
		* si vous avez des problèmes, mettez dot.exe dans :code:`C:/graphviz/bin/dot.exe`

.. warning::

	Vous devez recompiler le site pour voir vos changements.

.. note::

	Créez une nouvelle branche, et travaillez dessus

7. Corrections vérifiées
****************************************************

.. image:: https://img.shields.io/badge/correction-vérifiée-green.svg?style=flat&amp;colorA=E1523D&amp;colorB=007D8A
   :alt: correction vérifiée

.. image:: https://img.shields.io/badge/correction-non%20vérifiée-red.svg?style=flat&amp;colorA=E1523D&amp;colorB=007D8A
   :alt: correction non vérifiée

Le label "correction vérifiée" est présent sur les correction proposées qui ont été vérifiées
par une autre personne que le rédacteur.

Le label "correction non vérifiée" est pour toutes les autres correction.

D'autres labels peuvent être présents pour les cas particuliers.

.. note::

	Si vous avez vérifié une correction, vous n'avez qu'à modifier le fichier et ajouter l'un des labels. Leur code
	sera trouve dans `correction.rst <_static/correction.rst>`_ et `correction2.rst <_static/correction2.rst>`_ .

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)