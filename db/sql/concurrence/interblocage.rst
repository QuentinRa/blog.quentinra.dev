==============================
7. Concurrence - Interblocage
==============================

Il se peux qu'une transaction T1 attende un verrou bloqué par une transaction T2 et que la
transaction T2 attende également un verrou bloqué par la transaction T1 :
il y a interblocage ou deadlock=verrou mortel.

La base vérifie en permanence les situations de deadlock en dessinant le graphe d'attente.
Les transaction sont des nœuds, et les attentes des flèches. S'il y a une boucle, alors il y a
blocage/deadlock. Dans ce cas, la base choisi un verrou à faire sauter, qui est généralement le
premier verrou qui bloque.

.. image:: /assets/db/sql/concurrence1.png

Dans l'exemple suivant, on voit un cas de verrou mortel. LockW(A) par T1 est le premier verrou qui bloque,
c'est donc généralement lui qui devrait sauter.

.. image:: /assets/db/sql/concurrence2.png


.. code:: sql

		--obtenir les sid des session de cette utilisateur
		select distinct sid from v$mystat;

		--liste des verrou alors le sid de la session associée
		select * from v_waiting_lock [where username = 'user'; ]
		select * from dba_waiters;