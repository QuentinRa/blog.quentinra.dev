============================
Ordonnancement
============================

Les processus (programmes) s’exécutent en presque en "parallèle" (pseudo-parallélisme).

L'ordonnanceur (ou le gouverneur) va faire en sorte que chaque processus puisse s'exécuter un petit peu,
puis est mis en pause pendant qu'un autre s'exécute, et ce en boucle.

.. note::

	Un processus n'est donc pas exécuté d'un coup, ses données sont mise en mémoire jusqu'à ce qu'il soit
	réveillé.