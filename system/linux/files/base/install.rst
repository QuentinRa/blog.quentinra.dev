=======================================
Choix de la version et installation
=======================================

Pour les versions de Linux, mon avis est :

		* ubuntu : simple pour des nouveaux sur Linux
		* debian : le plus équilibré entre novices et expert
		* archlinux : bien pour travailler
		* fedora : beau
		* centos : bien pour les serveurs

Pour installer linux, téléchargez l'ISO, gravez le sur une clef et utilisez le menu d'installation.
Vous pouvez vous aider de la documentation officielle, j'ai fait un petit guide ici
:download:`installer Linux <../../../../assets/system/linux/linux-setup.pdf>` (mais je ne le recommande pas sauf
pour les explications).

DualBoot
--------------------

Vous pouvez avez deux OS (Système d'exploitation) sur une même machine.
Le bootloader (menu au démarrage) va vous permettre de choisir vos système d'exploitation.

J'ai pas de guide a vous proposez donc recherchez sur duckduckgo.

Machine virtuelle
--------------------

Vous pouvez installer linux sur une machine virtuelle (VirtualBox), c'est assez pratique
mais je trouve ça relou.

Linux sous Windows
--------------------

Vous pouvez faire tourner une machine linux sur votre machine, par exemple avec WSL
ou avec une machine dockerisée (docker).

docker
	Sous Windows, tapez "debian" ou autre dans le WindowsStore et installez l'application. Lancer
	le programme ouvre un terminal sous linux.

	Mon bureau linux se trouve ici (faut remplacer windows_username et linux_username): :code:`C:\Users\windows_username\AppData\Local\Packages\TheDebianProject.DebianGNULinux_76v4gfsz19hv4\LocalState\rootfs\home\linux_username`

WSL
	Vous installez WSL ( https://docs.microsoft.com/fr-fr/windows/wsl/install-win10 ) et ensuite vous lancez l'application
	qui ouvre un terminal sous linux.

	Bureau linux : tapez :code:`\\wsl$` dans la barre de recherche (bas gauche) est cela ouvre le dossier mais seulement
	si la WSL est lancée.
