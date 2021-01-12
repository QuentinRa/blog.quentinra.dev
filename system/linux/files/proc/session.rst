============================
Session et terminaux
============================

Un processus appartient à une session (sid), qui elle même appartient généralement à un terminal (tty).

Une session est partitionnée en groupes de processus.

.. note::

	Comme tout est fichier sous linux, un terminal se trouve dans :code:`/dev/tty`.

.. note::

	Si la session meurt, alors tous les processus reçoivent le signal SIGHUP.