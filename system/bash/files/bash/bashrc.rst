============================
.bashrc
============================


Le fichier :code:`~/.bashrc` est exécuté à chaque création d'un terminal.

Il contient des commandes que vous voulez éviter de faire à chaque fois que vous ouvrez un terminal,
par exemple définir des variables d'environnement, ou encore des raccourcis pour des commandes.

La commande :code:`alias` permet de créer une commande depuis une instruction.

.. note::

	:code:`alias la=`ls -la`` crée une commande :code:`la` qui fait l'instruction :code:`ls -la`.

Vous pouvez écrire des fonctions (builtin) comme dans un script (voir la partie associée).

.. important::

	Les changements de votre .bashrc ne sont pas appliqués aux anciens terminaux, sauf
	si le "sourcez" : :code:`$ source ~/.bashrc`.
