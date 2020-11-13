===========================================================================
5. Gestion de la mémoire secondaire - Organisation Indexée : dense
===========================================================================

On a un index qui contient des clefs (par forcément primaire), chaque clef pointant sur un bloc.

On fait un indexe avec toutes les valeurs possibles,
et chaque valeur pointe vers le bloc ou sont les enregistrement ayant cette valeur.

.. image:: /assets/db/sql/dense.png