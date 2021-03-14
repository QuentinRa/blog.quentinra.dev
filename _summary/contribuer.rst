##########################################
Comment contribuer ?
##########################################

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 14/03/2021}`

.. _editor: https://livesphinx.herokuapp.com/
.. _memorize: https://github.com/lgs-games/memorize

Vous allez avoir besoin d'un compte `github <https://github.com/>`_ pour contribuer,
le dépôt est ici : `memorize`_.

1. Rédaction des cours
*************************

Les cours sont écris en :code:`ReStructured Text`, compilés en un site web html via
sphinx.

Le format usuel que j'utilise pour un cours est `assets/template.rst <_static/template.rst>`_.

Installer sphinx pour compiler peut être assez compliqué (il faut installer python
est plein de modules) mais vous pouvez écrire des fichiers rst
directement dans votre navigateur : `editor`_ et ensuite
les poster sur le github.

Un cours sur le :code:`ReStructured Text` est disponible ici :ref:`rst`.

1.1 Détails sur la structure
-------------------------------

Les cours sont regroupés par thème : Mathématiques, Système, Web, ... qui correspondent
aux dossiers à la racine du projet (sauf exceptions).

Un thème est généralement divisé en matières (Graphes, Probabilités, ... pour Mathématiques)
qui sont chacun dans un dossier. Le fichier :code:`index.rst` corresponds au cours principal,
mais il peut y avoir plusieurs cours dans un dossier.

N'oubliez pas de donner les crédits et de citer les références de vos cours.

	* crédits : personnes qui ont majoritairement contribué au cours
	*
		références : liens que vous avez utilisé pour enrichir votre cours, ou qui seraient intéressant de
		consulter

Sautez à la partie :ref:`push_github` pour mettre en ligne votre cours.

2. Rédaction des exercices et des corrections
************************************************

La rédactions des exercices et des corrections est séparée.

Chaque cours peut posséder un dossier :code:`exercice` qui contient les consignes.
On fait ensuite un dossier du même nom que la suite d'exercices qui contiendra les corrections.
Le template du fichier des consignes est dans `assets/exercices.rst <_static/exercices.rst>`_.

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

		# clone le dépôt
		git clone https://github.com/lgs-games/memorize
		# on suppose que tout ce qu'il faut est installé (voir ci-après)
		make html
		# ouvrir dans le navigateur
		open _build/html/index.html

Les pré-requis sont :
	* Installer python (et ajouter au PATH python et python/Scripts)
	* Installer pip :code:`python -m pip install -U pip`
	* Installer sphinx :code:`pip install -U sphinx`
	* Installer le thème :code:`pip install -U sphinx-rtd-theme`
	* Installer graphviz :code:`pip install -U graphviz`

		* sous windows, vous devez ajouter graphviz/dot.exe au PATH
		* sous windows, ouvrez un terminal et lancez :code:`dot -c` à la toute première utilisation
		* si vous avez des problèmes, mettez dot.exe dans :code:`C:/graphviz/bin/dot.exe`

Vous devez recompiler le site pour voir vos changements, ce n'est pas fait
automatiquement.

7. Corrections vérifiées
**************************

.. image:: https://img.shields.io/badge/correction-vérifiée-green.svg?style=flat&amp;colorA=E1523D&amp;colorB=007D8A
   :alt: correction vérifiée

.. image:: https://img.shields.io/badge/correction-non%20vérifiée-red.svg?style=flat&amp;colorA=E1523D&amp;colorB=007D8A
   :alt: correction non vérifiée

Le label "correction vérifiée" est présent sur les correction proposées qui ont été vérifiées
ou qui semblent être correcte.

Le label "correction non vérifiée" est pour toutes les autres corrections.

D'autres labels peuvent être présents pour les cas particuliers.

Si vous avez vérifié une correction, vous n'avez qu'à modifier le fichier et ajouter l'un des labels.
Leur code sera trouve dans `correction.rst <_static/correction.rst>`_ et `correction2.rst <_static/correction2.rst>`_ .

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)