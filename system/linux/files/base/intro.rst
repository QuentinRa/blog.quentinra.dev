===========================================
Explication rapide du fonctionnement
===========================================

Vous avez pas mal de choses comme sous Windows en terme d'affichage,
mais qui fonctionnent différemment.

Vous avez un terminal/console (invite de commande sous windows) qui est
généralement utilisé pour

	* installer des programmes : paquet (sudo apt-get install nom_package sous ubuntu)
	* installer des programmes : Makefile (sudo make s'il y a un MakeFile)
	* lancer des programmes : nom_programme ou ./mon_programme
	* etc.

.. image:: /assets/system/linux/terminal.png

Vous pouvez tout faire sans utiliser la souris, juste avec un terminal. Les commandes "basiques" sont

	* :code:`cd` : se déplacer dans un dossier
	* :code:`ls` : voir le contenu d'un dossier
	* :code:`cat` : voir le contenu d'un fichier
	* :code:`find` : trouver un fichier/dossier
	* :code:`rm` : supprimer un fichier/dossier
	* :code:`echo` : afficher un message
	* :code:`gcc` : compiler du c/c++

Pour passer en mode console (juste un terminal) tapez n'importe quel combinaisons de 	Ctrl-alt-F1, ..., Ctrl-Alt-F9
et Alt-f7 pour revenir au mode graphique (s'il est installé).

Fonctionnement d'un terminal
-----------------------------

Le terminal est dans un langage : bash, sh, csh, tesh, ksh, ... et généralement c'est en bash. Tapez :code:`bash`
pour passez votre terminal actuel en bash (sh pour sh, ...).

Vous verrez généralement des commandes écrites de la forme

	* :code:`sh> ls` : ceci veut dire qu'on fait :code:`ls` dans un terminal en sh (donc on pourrait avoir bash>)
	* :code:`$ cd ~` : ceci veut dire qu'on fait :code:`cd ~` dans n'importe quel langage
	* :code:`# cd ~` : ceci veut dire qu'on fait :code:`cd ~` dans n'importe quel langage en étant administrateur

Vous ne tapez pas :code:`sh> ls`, c'est juste comment sur papier c'est parfois écrit, vous tapez juste la commande.

Astuces

	* on tape entrée pour valider une commande
	* on utilise CTRL-C pour tuer une commande (équivalent du ALT-F4)
	* on évite d'utiliser des espaces dans le noms de dossiers/fichiers car c'est + compliqué a manipuler

Fonctionnement d'une commande
-------------------------------

Une commande est toujours de la forme :code:`commande -option argument`.

Note

	* option -h ou -help ou --help existe généralement et donne de l'aide sur une commande
	* man nom_commande : donne des infos sur une commande

Exemple : :code:`ls -la`

	* ls = liste les répertoires
	* -la pareil que -l -a : deux options pour afficher les fichiers cachés + pleins d'infos sur les dossiers/fichiers

Exemple : :code:`cat fichier.txt`

	* cat = affiche le contenu d'un fichier
	* fichier.txt : argument correspondant au fichier a afficher

Éditeurs de texte
-------------------------------

Un éditeur de texte vous permet d'éditer du texte (donc un fichier). Par
exemple il existe NotePad++ sous Windows. Donc vous allez les utiliser a chaque fois
que vous voulez modifier un fichier.

Il en existe
	* des graphiques : `Sublime text <https://www.sublimetext.com/>`_ (logiciel), emacs, pluma
	* en ligne de commande : vim, emacs, nano

Il suffit de faire :code:`vim fichier.rst` pour lancer vim et ouvrir fichier.rst dedans.

Autres
-------------------------------

Lorsque vous tapez un mot de passe sous linux, il n'est pas affiché à l'écran.