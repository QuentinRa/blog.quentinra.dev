.. _rst:

================================
ReStructured Text (rst)
================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 11/01/2021}`

Le rst est le langage dans lequel est écrit ce site. Les fichiers ont :code:`.rst`
pour extension.

1. Idée générale
===================================

Vous allez avoir un "toctree" donc un tag permettant de créer un arbre entre toutes vos pages.

.. code:: rst

		.. toctree::
		 :maxdepth:

		  Nom à afficher     <fichier_rst>

Vous allez ensuite simplement écrire du texte, et comme le markdown certaines éléments seront
interprétés pour donner un style au document (gras, lien, etc.).

Notez que vous pouvez utiliser des modules comme écrire des maths en latex (tag math)
, faire de l'uml (tag uml), faire des graphes (graphviz) etc. Les modules python associés doivent être installés.

2. Titres
===============================

.. code:: rst

	=====================================
	Titre de la page
	=====================================

	1. Titre d'une partie
	=========================

	1.1 Titre d'une sous-partie
	******************************

	1.1.1 Titre d'une sous-sous-partie
	-------------------------------------

	....

Notez que vous ne pouvez pas faire plus (donc pas de 1.1.1.1.) mais vous pouvez changer les symboles
(selon la doc # (parties), * (chapitres), = (sections), - (sous sections), ^ (sous-sous sections), " (paragraphe)).

Attention cependant, le truc en dessous le titre doit être >= en longueur au texte juste du "titre".

3. Tous les symboles
=======================

Style du texte

.. code:: rst

	**gras**

	*italique*

Agencement

.. code:: rst

	Ceci est un phrase.
	Cette phrase est sur la même ligne

	Cette phrase est dans un nouveau paragraphe.

	| Cette phrase est sur une ligne
	| Cette phrase est sur une autre ligne

	``code``

Balises utiles

.. code:: rst

		.. ceci est un commentaire

		.. code:: langage

		 ici du code dans langage

		.. image:: lien de l'image

		.. math::

		 code latex

Balises utiles (inline)

.. code:: rst

	:code:`du code`

	:math:`code latex`

	.. un fichier téléchargeable

	:download:`nom_affiché <chemin/relatif/vers/fichier>`

Listes

.. code:: rst

	* liste non numérotée
	* liste non numérotée

	 * sous-liste non numérotée
	 * \
	  sous-liste non numérotée
	  avec un long contenu

	1. liste numérotée
	2. liste numérotée

	#. liste numérotée
	#. liste numérotée

Autres

.. code:: rst

		.. lien

		`texte_affiché <lien>`_

		.. lien (2)

		Vous pouvez écrire le lien a un seul endroit et faire `nom`_.

		.. _nom: lien

		.. tableau

		=====  =====  =======
		A      B      A and B
		=====  =====  =======
		False  False  False
		True   False  False
		False  True   False
		True   True   True
		=====  =====  =======

		.. référence

		.. _tag_referencable:

		:ref:`tag_referencable`

4. Les balises spéciales
==============================

.. code:: rst

	.. note::

		Une note

Il existe aussi warning, danger, important, hint.

.. code:: rst

	.. Si vous avez installé plantuml, alors vous pouvez écrire de l'uml.

	.. uml::

	 @startuml

	 ...

	 @enduml

5. Quelques balises moins utilisées
=========================================

.. code:: rst

		.. définition

		Cette ligne est en gras
		 Cette ligne explique la ligne en gras plus haute.

		.. inclure un fichier, plutôt que de le copier dans .. code

		.. literalinclude:: configuration.json
			:language: JSON

		Ceci est du texte ::

		 Ce texte est à la suite du paragraphe dans une balise de code.

		.. notes

		Ceci est un quantificateur [#quantificateur]_ et il sert ...

		.. [#quantificateur] Un quantificateur est ...

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://docs.anaconda.com/restructuredtext/detailed/
	* https://docutils.sourceforge.io/docs/user/rst/quickref.html
	* https://sublime-and-sphinx-guide.readthedocs.io/en/latest/code_blocks.html
	* https://pandoc.org/
	* https://rst2pdf.org/
	* Sphinx
		* https://matplotlibguide.readthedocs.io/en/latest/Matplotlib/basic.html
		* https://plantuml.com/
		* https://graphs.grevian.org/example
		* https://www.sphinx-doc.org/en/master/usage/extensions/graphviz.html
		* https://sphinx-tutorial.readthedocs.io/step-1/
		* http://docs.mathjax.org/en/latest/basic/a11y-extensions.html
		* https://sphinx-doc-zh.readthedocs.io/en/latest/ext/math.html
		* https://documentation.help/Sphinx/math.html
		* https://fr.wikipedia.org/wiki/ReStructuredText
		* https://docs.readthedocs.io/en/stable/intro/getting-started-with-sphinx.html