============================
Hiérarchie
============================

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