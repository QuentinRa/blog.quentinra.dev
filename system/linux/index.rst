.. _linux:

================================
Architecture Linux
================================

1. Introduction
================================

Ce cours vise à rassembler la théorie de notions telles que
	* entiers signés/non signés
	* chemins
	* appels systèmes
	* Permissions
	* etc...

La section :ref:`bash` est basé sur le même plan, sauf qu'il s'agit du cas pratique,
soit comment coder (a.k.a l'implémentation) des concepts vu ici.

1.1 Pourquoi linux ?
***********************

Linux est gratuit (la plupart des distributions), léger, généralement plus performant et open-source
(vous avez le code-source, et pouvez le modifier et vous savez ce qu'il y a dedans).

La plupart des serveurs tournent sous linux, et de nombreux ordinateurs sont également sous linux pour les raisons
plus hautes.

1.2 Installer linux
***********************

J'ai rédigé un guide pour installer linux ici : :download:`installer Linux <../../assets/linux-setup.pdf>`,
sinon il existe de nombreux guides.

Pour les versions de linux, mon avis est :

		* ubuntu : simple pour des nouveaux sur linux
		* debian : le plus équilibré entre novices et expert
		* archlinux : bien pour travailler
		* fedora : beau
		* centos : bien pour les serveurs

2. Terminaux et éditeurs de texte
====================================

Certaines fois, il se peut que vous n'ayez pas d'interface graphique, seulement un terminal affiché.

.. image:: /assets/linux/terminal.png

.. note::

	Notez que lorsque vous saisissez un mot de passe sous linux (stockés sous la forme de hash),
	votre saisie n'est pas affiché. Il se peut également que le clavier numérique (chiffres...)
	soit désactivé.

2.1 Le principe
***********************

L'idée est que le terminal (ou invite de commande ou shell) est une interface qui vous permet
d'interagir avec votre machine. Vous allez écrire des commandes, dans un certain langage, et le système
va effectuer des actions.

Le langage par défaut est généralement le bash, mais il existe d'autres : sh, csh, tesh, ksh, bash, ash, zsh...

.. note::

	:code:`sh> cd ~` : le :code:`sh>` ne fait pas partie de la commande, mais indique que la commande ici est
	exécutée en :code:`sh` (Bourne Shell).

	:code:`$ cd ~` : le :code:`$` indique qu'il s'agit d'une commande normale. (plus de détail plus loin)

	:code:`# cd ~` : le :code:`#` indique une commande nécessitant d'être administrateur.

2.2 Commandes
***********************

Une commande est toujours de la forme :code:`commande [[-option] [argument]]*`.

.. note::

	[argument] indique que argument est optionnel

	[valeur]* indique qu'il peut y avoir 0, 1, n fois valeur (ex: [1]* = 1 ou 111 ou 11...1 ou ...)

Plus d'explications :
	* commande est une commande par exemple `ls` ou `sphinx-build`.
		* Après le nom de la commande, il y a **toujours** un espace.
		* Une peut ne pas avoir d'arguments
		* il peut y avoir un tiret dans le nom de la commande
	* les options d'une commande sont précédées d'un tiret du 6: :code:`-`
		* il peut y avoir 0 options
		* une option n'est pas forcément suivie d'un argument
	* enfin il y a les arguments
		* il peut y avoir des arguments sans options
		* un argument se termine lorsqu'il y a un espace

		.. note::

			Si vous voulez un argument par exemple -> Mon Fichier.pdf soit considéré comme un seul
			argument, alors il faut mettre des doubles quotes : "Mon Fichier.pdf"
			(il existe d'autres solutions).

Voici un exemple: :code:`sphinx-build make -D="C:/Users/temp/" renard.txt index.rst -f build0006.sb -s`.
	* la commande est :code:`sphinx-build`
	* trois arguments sans option : :code:`make`, :code:`renard.txt`, :code:`index.rst`
	* il y a trois options

		* deux options avec argument : :code:`-D="C:/Users/temp/"` et :code:`-f build0006.sb"`
		* une option sans argument : :code:`-s`

.. note::

	Comment interpréter cette ligne ? (un peu compliqué)

		Dans cette exemple, on peut imaginer que la commande `sphinx-build` propose plusieurs commandes,
		dont :code:`make` (permet de créer quelquechose).

		L'option :code:`-D` peut servir à définir le répertoire dans lequel mettre ce qui a été créé et :code:`-f`
		peut servir à donner le nom du fichier créé. L'option :code:`-s` (silent) sert généralement à dire que vous ne
		voulez pas de messages sur ce qui se passe.

		Les arguments :code:`renard.txt` et :code:`index.rst` sont sûrement les fichiers qui vont servir a :code:`make`
		pour créer le fichier :code:`build0006.sb`.

.. note::

	Cette commande existe mais les options n'exitent pas forcément pour cette commande (ceci est un
	exemple).

3. Système de fichiers et Permissions
========================================

.. hint::

		Fun Fact -- "Tout est fichier sous Linux"

		Les utilisateurs de Linux ont tendance à dire que tout est fichier sous linux,
		c'est à dire que

					* un disque dur;
					* un terminal;
					* un connexion réseau;
					* un processus;
					* ...

		sont des fichiers.

3.1 Chemins
***********************

Linux et Windows ont une hiérarchie des fichiers assez similaire :

============== ===============   ========  ====================================================================
Windows        Linux             Nom       Sémantique (sens)
============== ===============   ========  ====================================================================
C:\\           /                 Racine    Le point de départ de l'arborescence des fichiers
C:\\users\user /usr/user/home/   Domicile  Le dossier utilisateur de :code:`user`, il contient vos Documents,
               ou ~ (tilde)                votre bureau etc... :code:`~` est un raccourcis pour
                                           :code:`/usr/user/home/`
Dossier actuel .                 Dossier   Il s'agit du dossier dans lequel vous vous trouvez
                                 Courant
============== ===============   ========  ====================================================================

.. note::

	Vous entendrez pour dossier les mots : répertoire, catalogue qui sont des synonymes.

	Vous entendrez pour fichier le mot: fichier régulier, qui veut juste dire fichier normal (donc pas un lien,
	ou les fichiers spéciaux (terminaux etc...)).

Chemin
	Il s'agit d'un chemin partant tel que :code:`/usr/user/home/`.

	Le chemin suivant, se lit comme suit
		* partant de la racine (:code:`/`)
		* on a un dossier :code:`usr`
		* dans ce dossier :code:`usr`, on a un dossier :code:`user`
		* dans ce dossier :code:`user`, on a un dossier :code:`home`

	.. note::

		Il existe deux types de chemins :

			* les chemins dit absolus : ils comment par :code:`/` donc par la racine.
			*
				les chemins relatif : :code:`~/Bureau` est l'équivalent du chemin absolu
				:code:`/usr/user/home/Bureau`. Un autre exemple serait un fichier dans votre
				dossier courant: :code:`./.bashrc`

.. hint::

	Un fichier qui commence par un . est un fichier caché.


3.2 Utilisateurs et Groupes
*****************************

3.3 Permissions
*****************************




















