.. _vim:

================================
vim (Vi IMproved)
================================

vim est un éditeur de texte basé sur vi,
entièrement en ligne de commande.

Vous pouvez configurer vim avec un fichier de
configuration : :code:`~/.virmrc`.

1. Introduction
===================================

Vim repose principalement sur deux modes :

	* le mode édition (donc écrire dans le fichier)
	* le mode commande (recherche, déplacement dans le fichier...)

Le mode actuel (commande si rien) est affiché en bas à gauche (INSERTION=édition et rien=commande).

| Vous pouvez activer le mode édition en appuyant sur :code:`a` ou sur :code:`i`.
| Vous devez appuyer au moins une fois sur :code:`echap` pour quitter le mode édition.

.. note::

	:code:`a` positionne votre curseur pour écrire après votre position. :code:`i` positionne votre
	curseur avant.

1.1 .vimrc
***********************

Si le fichier de configuration : :code:`~/.vimrc` n'existe pas, alors vous devez le créer.

Voici un exemple de .vimrc

.. code:: bash

		set fileencodings=UTF-8,utf-8,default,latin1 # changer l'encodage des fichiers
		syntax enable # active la coloration syntaxique
		highlight Cursor guifg=white guibg=black # couleur du curseur
		filetype plugin indent on # indentations
		set cursorline # affiche le curseur

2. Commandes basiques
===================================

...

3. Commandes basiques
===================================

...



