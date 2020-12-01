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
	* etc.

La section :ref:`bash` est basé sur le même plan, sauf qu'il s'agit du cas pratique,
soit comment coder (a.k.a l'implémentation) des concepts vu ici.

1.1 Pourquoi Linux ?
***********************

Linux est gratuit (la plupart des distributions), léger, généralement plus performant et open-source
(vous avez le code-source, et pouvez le modifier et vous savez ce qu'il y a dedans).

La plupart des serveurs tournent sous Linux, et de nombreux ordinateurs sont également sous Linux pour les raisons
plus hautes.

1.2 Installer Linux
***********************

J'ai rédigé un guide pour installer Linux ici : :download:`installer Linux <../../assets/system/linux/linux-setup.pdf>`,
sinon il existe de nombreux guides.

Pour les versions de Linux, mon avis est :

		* ubuntu : simple pour des nouveaux sur Linux
		* debian : le plus équilibré entre novices et expert
		* archlinux : bien pour travailler
		* fedora : beau
		* centos : bien pour les serveurs

2. Terminaux et éditeurs de texte
====================================

Certaines fois, il se peut que vous n'ayez pas d'interface graphique, seulement un terminal affiché.

L'écran noir suivant est ce qu'on appelle un terminal, une console, un invite de commande et qui
est le principal (ou le seul) moyen de saisir des instructions à exécuter sur votre machine.

.. image:: /assets/system/linux/terminal.png

.. note::

	Notez que lorsque vous saisissez un mot de passe sous Linux (stockés sous la forme de hash),
	votre saisie n'est pas affichée. Il se peut également que le clavier numérique (chiffres...)
	soit désactivés.

2.1 Le principe
***********************

Le terminal est une interface qui vous permet d'interagir avec votre machine.
Vous allez écrire des commandes, dans un certain langage (bash, sh, ...), et le système
va effectuer des actions (afficher un fichier, ...).

Le langage par défaut est généralement le bash, mais il existe d'autres : sh, csh, tesh, ksh, bash, ash, zsh...

.. note::

	:code:`sh> cd ~` : le :code:`sh>` ne fait pas partie de la commande, mais indique que la commande ici est
	exécutée en :code:`sh` (Bourne Shell).

	:code:`$ cd ~` : le :code:`$` indique qu'il s'agit d'une commande normale (voir bash), donc vous le verrez souvent
	devant des commandes.

	:code:`# cd ~` : le :code:`#` indique une commande nécessitant d'être administrateur (voir utilisateurs et permissions).

.. note::

	Vous pouvez à tous moment, passer d'une version graphique à une version console (et inversement si un gestionnaire
	graphique est installé).

	* Entrer en mode console : Ctrl-alt-F1, ..., Ctrl-Alt-F9
	* Quitter le mode console : Alt-f7

2.2 Commandes
***********************

Une commande est toujours de la forme :code:`commande [[-option] [argument]]*`.

.. note::

	[argument] indique qu':code:`argument` est optionnel

	[valeur]* indique qu'il peut y avoir 0, 1, n fois valeur (ex : [1]* = 1 ou 111 ou 11...1 ou ...)

Plus d'explications :
	* commande est une commande par exemple `ls` ou `sphinx-build`.
		* Après le nom de la commande, il y a **toujours** un espace.
		* Une commande peut ne pas avoir d'arguments
		* il peut y avoir un tiret dans le nom de la commande
	* les options d'une commande sont précédées d'un tiret du 6 : :code:`-`
		* il peut y avoir 0 option
		* une option n'est pas forcément suivie d'un argument
	* enfin il y a les arguments
		* il peut y avoir des arguments sans options
		* un argument se termine lorsqu'il y a un espace

		.. note::

			Si vous voulez un argument par exemple -> Mon Fichier.pdf soit considéré comme un seul
			argument, alors il faut mettre des doubles cotes : "Mon Fichier.pdf"
			(il existe d'autres solutions).

Voici un exemple: :code:`sphinx-build make -D="C:/Users/temp/" renard.txt index.rst -f build0006.sb -s`.
	* la commande est :code:`sphinx-build`
	* trois arguments sans option : :code:`make`, :code:`renard.txt`, :code:`index.rst`
	* il y a trois options

		* deux options avec argument : :code:`-D="C:/Users/temp/"` et :code:`-f build0006.sb"`
		* une option sans argument : :code:`-s`

.. note::

	Comment interpréter cette ligne ? (un peu compliqué)

		Dans cet exemple, on peut imaginer que la commande :code:`sphinx-build` propose plusieurs sous commandes,
		dont :code:`make` (permet de créer quelque chose).

		L'option :code:`-D` peut servir à définir le répertoire dans lequel mettre ce qui a été créé et :code:`-f`
		peut servir à donner le nom du fichier créé. L'option :code:`-s` (silent) sert généralement à dire que vous ne
		voulez pas de messages sur ce qui se passe.

		Les arguments :code:`renard.txt` et :code:`index.rst` sont sûrement les fichiers qui vont servir a :code:`make`
		pour créer le fichier :code:`build0006.sb`.

.. note::

	Cette commande existe mais les options n'existent pas forcément pour cette commande (ceci est un
	exemple).

2.3 éditeurs de texte
************************

Un éditeur de texte vous permet, comme le nom l'indique, d'éditer du texte (donc un fichier). Par
exemple il existe NotePad++ sous Windows.

Il en existe
	* des graphiques : `Sublime text <https://www.sublimetext.com/>`_ (logiciel), emacs, pluma
	* en ligne de commande : vim, emacs, nano

Vous pouvez aussi utiliser (non recommandé pour les débutants), des IDE (Integrated Development Environment)
tels que :

	* vscode (tous langages mais moins d'intégration)
	* `logiciels Jetbrains <https://www.jetbrains.com/>` : Intellij IDEA (java), PHPStorm, CLion, ...
	* ...

3. Système de fichiers et Permissions
========================================

.. hint::

		Fun Fact -- "Tout est fichier sous Linux"

		Les utilisateurs de Linux ont tendance à dire que tout est fichier sous linux,
		c'est-à-dire que

					* un disque dur ;
					* un terminal ;
					* un connexion réseau ;
					* un processus ;
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
               ou ~ (tilde)                votre bureau etc... :code:`~` est un raccourci pour
                                           :code:`/usr/user/home/`

\              .                 Dossier   Il s'agit du dossier dans lequel vous vous trouvez
                                 Courant

\              \.\.              Dossier   Il s'agit du dossier contenant votre dossier actuel. La racine
                                 Parent    est son propre parent.
============== ===============   ========  ====================================================================

.. note::

	Vous entendrez pour dossier les mots : répertoire, catalogue, qui sont des synonymes.

	Vous entendrez pour fichier le mot : fichier régulier, qui veut juste dire fichier normal (donc pas un lien,
	ou les fichiers spéciaux (terminaux etc.)).

Chemin
	Il s'agit d'un chemin partant tel que :code:`/usr/user/home/`.

	Le chemin suivant, se lit comme suit
		* partant de la racine (:code:`/`)
		* on a un dossier :code:`usr`
		* dans ce dossier :code:`usr`, on a un dossier :code:`user`
		* dans ce dossier :code:`user`, on a un dossier :code:`home`

	.. note::

		Il existe deux types de chemins :

			* les chemins dit absolus : ils commencent par :code:`/` donc par la racine.
			*
				les chemins relatif : :code:`~/Bureau` est l'équivalent du chemin absolu
				:code:`/usr/user/home/Bureau`. Un autre exemple serait un fichier dans votre
				dossier courant: :code:`./.bashrc`

.. hint::

	Un fichier qui commence par un . est un fichier caché.

.. note::

	Si vous mettez /.../ avec un nombre pair de slashes, alors les slashes sont fusionnés.

3.2 Utilisateurs et Groupes
*****************************

Les utilisateurs sous Linux sont répartis en 3 groupes :
	* :code:`u` : utilisateur, vous êtes le seul dans ce groupe
	* :code:`g` : groupe, il s'agit de votre "groupe principal"
	* :code:`o` : tous les autres utilisateurs

.. note::

		Pour :code:`g`, vous pouvez par exemple créer un groupe "Famille" ou "Promo-année"
		et parce que vous pourrez définir des permissions particulières pour les membres de ce
		groupe (ex: ils peuvent tous lire les dossiers de /pub/cours/ ...).

3.3 Permissions
*****************************

Les permissions sont
	* `r` : read, sa valeur est `4`
	* `w` : write, sa valeur est `2`
	* `x` : execute, sa valeur est `1`

Assigner des permissions, c'est donner une valeur à chacun des groupes
d'utilisateurs :code:`u`, :code:`g`, :code:`o`.

Si vous assignez u=7 alors vous aurez les droits 4 (read) + write (2) + x (exécuter).

.. note::

	Vous pouvez retrouver la notation 751 par exemple donc chiffre1chiffre2chiffre3 qui signifie
	u=chiffre1, g=chiffre2, o=chiffre3

.. hint::

	Read permet de lire un fichier, Write permet de créer et modifier un dossier/fichier.

	Enfin exécuter, permet de traverser un répertoire (par exemple vous pouvez bloquer
	à un répertoire mais pas aux enfants) et d'exécuter un script.

.. note::

	Il existe un groupe d'utilisateur spéciaux : les `super administrateurs`. Certaines actions
	nécessitent des permissions ultra élevées (a.k.a :code:`root`).

4. Motifs (glob pattern) et Manipulations de textes
====================================================

4.1 Motifs
*************

En Shell, les chaines de caractères contenant \*, ?, [, ... sont des motifs,
donc le shell remplace notre texte par le motif correspondant seulement s’il en existe un sinon
il reste inchangé.

Les wildcards (\*, ?, [ ) sont :

	*	:code:`x` qui signifie exactement un fois le caractère x
	*	:code:`*` qui signifie un chaine de caractères possiblement vide
	*	:code:`?` qui signifie exactement un caractère
	*	:code:`[...]` qui signifie exactement un caractère parmi ceux entre crochet
	*	:code:`[^...]` ou :code:`[ !...]` signifie exactement un caractère qui ne soit pas parmi ceux entre crochet.

.. note::

	Il est également possible d'utiliser des intervals : 	:code:`[a-z]` ou :code:`[0-9]`

Il existe quelques expressions pour éviter de devoir tapper certains motifs

	* :code:`[[ :digit :]]` pour un nombre
	* :code:`[[ :upper :]]` pour une majuscule
	* :code:`[[ :lower :]]` pour une minuscule
	* :code:`[[ :space :]]` pour les caractères espace, tabulation, saut de ligne…
	* :code:`[[ :alnum :]]` pour tous les caractères alphanumériques.

.. note::

	On peut protéger un caractère avec \ ou encore avec [caractère] (donc seulement caractère dans l’intervalle).

	Ex : \$ ou [$] pour faire ‘$‘ .

4.2 Regex ou expression régulières
***************************************

Alternativement aux motifs, il est possible d'utiliser des expressions régulières.

La plupart des motifs existent en regex, sauf

	* :code:`?` (exactement un caractère) a été remplacé par :code:`.`

De nouveaux symbols ont été introduits :

	* :code:`x?` signifie que x est optionnel
	* :code:`x+` signifie au moins une fois x
	* :code:`$x` signifie une ligne qui commence par x
	* :code:`x^` signifie une ligne qui finit par x
	* :code:`x{n, m}` signifie au moins n fois x et au maximum m fois. Notez que n et m sont facultatifs.

.. warning::

	Souvent (pour ne pas dire tout le temps), seulement la partie qui matche (=correspond)
	à votre expression régulière est ~retournée/affichée.

	Pär exemple si vous avez un fichier que que vous exécutez la regex suivant dessus, en affichant
	les matches :code:`x^` : pour chaque ligne qui finit par x, alors  :code:`x` sera affiché (et non
	la vraie ligne qui finie par x).

.. note::

	Vous pouvez grouper des caractères pour leur appliquer une expression régulière en les mettant
	entre parenthèses: :code:`(ab)+` signifie au moins une fois :code:`ab`.

4.3 Utilisation
***********************

Les motifs/regex sont utilisés partout :
	* vous recherchez un fichier dont vous ne connaissez que l'extension par exemple
	* vous voulez obtenir tous les fichiers (*)
	* vous voulez modifier les lignes d'un fichiers qui sont d'un certain format.

5. Encodage des entiers et des réels (flottants)
=================================================

5.1 Entiers signés
***********************

On utilisera des base principalement les base 2 (binaire), 8 (octal) et 16 (hexadécimal) pour représenter des
nombres.

Les valeurs prises sont de 0 à n-1 avec n le nombre de la base.

On représentera les entiers jusqu’à 9 puis les lettres de l’alphabet de A à Z (base max 35 -> 0-Z).

5.1.1 BASE 2
--------------

Soit un nombre, je recherche une combinaison pour l’obtenir, je mets 1 si j’ai utilisé un chiffre sinon 0.

Inversement, si j’ai un chiffre binaire, je fais la somme des 1 multipliés par la puissance de 2 correspondante
pour obtenir mon nombre.

=========== =========== =========== =========== =========== =========== =========== =========== ===========
:math:`2^8` :math:`2^7` :math:`2^6` :math:`2^5` :math:`2^4` :math:`2^3` :math:`2^2` :math:`2^1` :math:`2^0`
=========== =========== =========== =========== =========== =========== =========== =========== ===========
256         128         64          32          16          8           4           2           1
=========== =========== =========== =========== =========== =========== =========== =========== ===========

.. code:: bash

		#Ex avec 12
		12
		# décompose avec des valeurs du tableau
		= 8 + 4
		#on réécris le tableau avec des 1 dans les 2^ utilisés pour écrire 12
		= 0*256+0*128+0*64+0*32+0*16+1*8+1*4+0*2+0*1
		# ce qui donne
		000001100
		# puis pour revenir à 12, on multiple par 2^ position du 1 dans le tableau
		# ce qui donne (de droite vers le dernier 1 à gauche)
		0*2^0+0*2^1+1*2^2+1*2^3 = 2^2+2^3 = 4 + 8 = 12

5.1.2 BASE 8
--------------

Pour la base 8, on part du principe que un nombre en base 8 ⇔ 3 en base 2,
on rajoute des zéros devant notre nombre binaire pour convertir s’il en manque.

5.1.3 BASE 16
--------------

Sur le même principe, un nombre en base 16 ⇔ 4 en base 2.

5.2 Entiers non signés
***********************

Dans la machine, les entiers sont signé : ceux commençant par (bit de poids fort) 0 sont positif tandis que
ceux commençant par un 1 sont négatifs.
Sur n bits signés valeurs vont de : :math:`]-2^{n-1}, 0] \cup ]0,2^{n-1}-1[`.

5.3 Entiers flottants
**********************

`non traité pour l'instant`

5.2.1 Pour écrire un chiffre négatif (complément à 2)
----------------------------------------------------------

* on fait l’inverse dit complément à 1 (1 devient 0 et 0 devient 1)
* on ajoute 1 au résultat.

5.2.2 Pour lire un chiffre
----------------------------------------------------------

* Si le bit de poids fort est 1, on fait le complément à 2 et on met un 1 devant le résultat.
* Si le bit de poids fort est 0, on fait comme pour les entiers non signés.

5.2.3 Faire des calculs
----------------------------------------------------------

* On fait le complément si un nombre est négatif puis on fait la somme.
* Pour faire une soustraction, je fais le complément du 2e membre (peu importe son signe).
* Il peut y avoir des débordement (on ne peut pas obtenir le bon résultat car il n’est pas dans notre intervalle) :
* Si le bit de signe et le dernier bit de retenu (vaut 0 si pas de retenue) sont identiques alors il n’y a pas de débordement.
* S’ils sont différent alors il y a un débordement (=overflow)

6. Environnement
========================================

6.1 Variables d'environnement
********************************

Les variables d'environnement sont des variables telles qui contiennent des informations
clés sur l'environnement tel que

	* PATH : contient une liste de dossier dans lesquels chercher les commandes
	* HOME : contient le chemin de votre domicile
	* PWD : votre dossier actuel
	* LANG : langue de l'utilisateur
	* ...

.. note::

	Rappelez vous du tout est fichier sous linux, donc la commande :code:`ls` qui liste les fichiers/dossier
	d'un répertoire, est un script donc un fichier dans un certain repertoire (:code:`/bin/ls`).

	Pour éviter de devoir donner le chemin absolu ou relatif à chaque fois qu'on voudrais utiliser la commande,
	on l'ajoute à PATH, parce que dès qu'on tape une commande dans un terminal, alors on va regarder dans tous les
	dossier du path s'il y a un fichier avec ce nom, et si oui on va l'exécuter.

6.2 Paquets
********************************

... rien pour l'instant ...

7. Scripts
========================================

Les scripts sont des fichiers qui contiennent des commandes, on peut voir ça comme un programme
qui une fois lancé va exécuter des instructions.

Un script peut contenir des fonctions (des bouts de code répétitif qui ont été factorisés
pour éviter de recopier du code). On appelle ces fonctions des :code:`buildin`.

.. note::

	On appelle une :code:`buildin` de la même façon que l'on appelle une commande, soit
	:code:`buildin [[-option] [argument]]`.

Les scripts demande la permission :code:`x` pour être exécutés, ou vous pouvez appeler
un langage en lui donnant un entrée le script : :code:`$ bash < script.sh` avec :code:`bash` ici
le langage dans lequel exécuter le script.

.. warning::

	La première ligne d'un script défini le langage du script, pour un script bash, la première ligne
	serait

	.. code::

		#!/bin/bash
		#
		# usage: utilisation du script
		#
		# détails
		#
		# ...

		# ici votre code

8. Processus et signaux
========================================

Un processus est une sorte de boite crée lorsque vous exécutez une commande.

Il contient entre autres

	* code (à exécuter)
	* l'environnement d'exécution : nom du programme, fichiers ouverts, droits, ...
	* des données (pile, tas, variables)

Chaque processus a un identifiant unique, appelé PID.

8.1 Hiérarchie
********************

Le processus 1, systemd est le parent de tous les processus. Un processus peut être
dupliqué, ce qui permet de créer de nouveaux processus (le processus 0 est celui qui init qui initie systemd).
Le PPGID est l'Id du processus parent.

.. note::

	Un processus qui finit par :code:`d` est généralement un daemon (linux) ou un
	un service (windows voir linux).

	Un daemon est un processus qui ne s'arrête jamais.

.. note::

	Comme tout est fichier sous linux, chaque processus est une sorte de fichier (nom=pid) dans :code:`/proc/`.

A sa mort, un processus retourne à son père un code de retour. Vous pouvez le consultez
avec la commande :code:`$ echo $?`.

.. note::

	Si le processus parent meurt, alors le parent du processus fils devient -1.

8.2 Ordonnancement
********************

Les processus (programmes) s’exécutent en presque en "parallèle" (pseudo-parallélisme).

L'ordonnanceur (ou le gouverneur) va faire en sorte que chaque processus puisse s'exécuter un petit peu,
puis est mis en pause pendant qu'un autre s'exécute, et ce en boucle.

.. note::

	Un processus n'est donc pas exécuté d'un coup, ses données sont mise en mémoire jusqu'à ce qu'il soit
	réveillé.

8.3 Signaux
*************

Les signaux sont des suites de touches qui sont réceptionnées par la session au premier plan (voir
ci-après pour session et arrière plan) et provoquent l'exécution d'une fonction par le processus.

Il y en a 34.

	* :code:`CTRL-C` (signal SIGINT) : exit donc met fin au processus
	* :code:`CTRL-Z` (signal SIGTSTP) : suspend donc met fin à une action (saisie, ...)

.. hint::

	:code:`CTRL-D` n'est pas un signal, il s'agit de EOF (End Of File) donc l'arrêt donc provoque
	l'arrêt d'une saisie.

8.4 Session et terminaux
*******************************

Un processus appartient à une session (sid), qui elle même appartient généralement à un terminal (tty).

Une session est partitionnée en groupes de processus.

.. note::

	Comme tout est fichier sous linux, un terminal se trouve dans :code:`/dev/tty`.

.. note::

	Si la session meurt, alors tous les processus reçoivent le signal SIGHUP.

8.5 Session et premier/arrière plan
************************************

Un seul groupe de processus d'une session est au 1er plan

	* peut bénéficier/droit aux entrées/sorties
	* peut lire/écrire
	* reçoit signaux (CTRL-C)

Les autres groupes sont à l’arrière-plan

	* ne peuvent pas lire/écrire sur le terminal
	* ne reçoivent pas les signaux (sauf CTRL-Z)

.. warning::

	Par défaut dans certains cas, les processus en arrière plan peuvent écrire sur le terminal.
	Il est possible de changer ce comportement en modifiant une variable d'environnement.

9. Appels systèmes
========================================

...

-----

**Crédits**
	* enseignants à l'IUT de Sénart-Fontainebleau
		* Denis MONNERAT
		* Luc HERNANDEZ
		* Selma NABOULSI
		* Frédéric GERVAIS
		* Pierre PETRIK
		* Luc DARTOIS
		* Pierre VALARCHER
	* enseignants à l'ENSIIE
			* Renaud RIOBOO
			* Christophe MOUILLERON
			* Julien FOREST
			* Ivan AUGÉ
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://en.wikipedia.org/wiki/Daemon_(computing)
	* https://systemd.io/
	* https://www.computerhope.com/unix/signals.htm
	* https://www.linuxtricks.fr/wiki/signaux-unix-unix-signals