.. _vim:

================================
vim (Vi IMproved)
================================

| :math:`\color{grey}{Version \ 1.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/10/2020}`

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

* Vous pouvez activer le mode édition en appuyant sur :code:`a` ou sur :code:`i`.
* Vous devez appuyer au moins une fois sur :code:`échap` pour quitter le mode édition.
* vous devez quitter le mode édition pour déplacer votre curseur (voir :ref:`move_vim_cursor`)

.. note::

	:code:`a` positionne votre curseur pour écrire après votre position. :code:`i` positionne votre
	curseur avant.

1.1 .vimrc
***********************

Si le fichier de configuration : :code:`~/.vimrc` n'existe pas, alors vous devez le créer.

Voici un exemple de .vimrc

.. code:: bash

		set fileencodings=UTF-8,utf-8,default,latin1 "changer l'encodage des fichiers
		syntax enable "active la coloration syntaxique
		highlight Cursor guifg=white guibg=black "couleur du curseur
		filetype plugin indent on "indentations
		set cursorline "affiche le curseur
		set tabstop=4 "taille tabulation

2. Commandes basiques
===================================

.. warning::

	Notez la présence de :code:`:` devant certaines commandes. Ils font partie de la commande, et ne peuvent être utilisés
	que si vous avez quitté le mode insertion.

.. hint::

	Un résumé des commandes pour une utilisation minimale de vim :

		* :code:`i` : activation de la saisie (mode édition)
		* :code:`échap` : quitter le mode édition et revenir au mode commande
		* :code:`:wq` : en mode commande, permet de sauvegarder (w) et quitter (q)
		* :code:`:q!` : en mode commande, permet de quitter sans sauvegarder
		* :code:`u` : permet de revenir en arrière
		* :code:`CTRL+R` : permet d'annuler un retour en arrière

2.1 Insertion
*****************

* :code:`i` avant la position du curseur
* :code:`a` après la position du curseur
* :code:`I` permet d'insérer du texte au début de la ligne.
* :code:`A` permet d'insérer du texte à la fin de la ligne.

* :code:`o` permet d'insérer une ligne en dessous du curseur.
* :code:`O` permet d'insérer une ligne au dessus du curseur.

.. _move_vim_cursor:

2.2 Déplacement
*****************

Déplacer le curseur
		* :code:`0` déplace au début ligne
		* :code:`$` déplace au fin ligne
		* :code:`xG` ou :x déplace à la ligne x
		* :code:`gg` déplace au début du fichier
		* :code:`G` déplace à la fin du fichier
		* :code:`j` permet de descendre d'une ligne.
		* :code:`k` permet de monter d'une ligne.
		* :code:`h` permet de déplacer vers la gauche.
		* :code:`l` permet de déplacer vers la droite.

Déplacer l'écran courant
		* :code:`CTRL-F` descend le texte affiché d'un écran
		* :code:`CTRL-B` monte le texte affiché d'un écran


2.3 Suppression
*****************

Supprimer (caractères)
		* :code:`x` supprime le caractère sous le curseur.
		* :code:`X` supprime le caractère avant le curseur.
		* :code:`nx` ou :code:`nX` pour plusieurs caractères
		* :code:`d^` supprime tout du début de la ligne au curseur.
		* :code:`D` ou :code:`d$` supprime tout du curseur à la fin de la ligne.

Supprimer (lignes)
		* :code:`dd` supprime la ligne du curseur.
		* :code:`ndd` supprime n lignes depuis la ligne du curseur.
		* :code:`:n,md` supprime les lignes n à m.
		* :code:`:x,.d` supprime de la ligne x jusqu'à la ligne du curseur.
		* :code:`:.,$d` supprime de la ligne du curseur jusqu'à la fin fichier.

2.4 Copie
*****************

Copier
		* :code:`yy` permet de copier la ligne du curseur.
		* :code:`:yx` permet de copier x lignes depuis la ligne du curseur.
		* :code:`:n,my` permet de copier ligne n à m.

Coller
		* :code:`p` permet de coller la/les ligne(s) après le curseur.
		* :code:`P` permet de coller la/les ligne(s) avant le curseur.

2.5 Sauvegarder et quitter
****************************

Enregistrer
		* :code:`:wq` permet de sauvegarder et quitter.
		* :code:`:w` permet de sauvegarder.

Quitter
		* :code:`:q` permet de quitter.
		* :code:`:q!` permet de quitter sans enregistrer.

2.6 Undo et Redo (retour arrière et annulation)
**************************************************

* :code:`u` permet d'annuler la dernière action.
* :code:`U` permet d'annuler les actions de la ligne.
* :code:`CTRL-R` permet d'annuler une annulation.

3. Commandes avancées
===================================

3.1 vim modify pattern (nommé par moi)
***************************************

vim permet de réaliser des commandes ultra rapidement sur des ensembles plus ou moins complexes.

La forme générale est :code:`cqi` avec

	* :code:`c` : une commande
	* :code:`q` : une quantité de :code:`i` sur laquelle faire :code:`c`.
	* :code:`i` : un indicateur sur la quantité (~une unité)

Les commandes sont par exemple d (delete:supprimer), ...

Les quantités sont des entiers par exemple 0, 1, ... ou des valeurs particulières : $ (jusqu'à la fin de la ligne)

Les indicateurs sont :

	* $ (jusqu'à la fin de la ligne)
	* e (???)
	* . (curseur)
	* c (ligne)
	* ^ (jusqu'au début de la ligne)

3.2 Recherche
****************************

* :code:`/mot` permet rechercher mot (descendant)
* :code:`?mot` permet rechercher mot (ascendant)
* :code:`n` permet de passer au suivant sens normal.
* :code:`N` permet de passer au suivant sens inverse.
* :code:`%symbole` renvoi au symbole correspondant.

3.3 Remplacement (regex)
****************************

* :code:`:s/ancien/nouveau` substitue :code:`ancien` mot par :code:`nouveau` mot
* :code:`:s/ancien mot/nouveau mot/g` sur toutes les lignes
* :code:`:s/ancien mot/nouveau mot/gc` avec confirmation.
* :code:`:n,ms/ancien mot/nouveau mot/g` tout sur lignes n à m.

3.4 Remplacement (manuel)
****************************

Remplacement (ESC)
		* :code:`r` remplace le caractère sous le curseur.
		* :code:`R` remplace caractères tant que ESC non pressée.

Remplacement (suppression puis insertion)
		* :code:`s` supprime le caractère sous le curseur puis insertion.
		* :code:`cc` supprime la ligne puis met en mode insertion.
		* :code:`cw` supprime du curseur à la fin du mot puis insertion.

3.5 Autres
****************************

* :code:`:!` permet d'exécuter une commande.
* :code:`:f nom` renommer le fichier.
* :code:`:e fichier` ouvre un autre fichier.
* :code:`:r fichier` affiche et insert fichier.
* :code:`:!gcc` permet de compiler dans vim.
* :code:`CTRL-G` affiche la position dans le fichier.

-----

**Crédits**
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://en.wikipedia.org/wiki/Vim_(text_editor)
	* https://neovim.io/doc/