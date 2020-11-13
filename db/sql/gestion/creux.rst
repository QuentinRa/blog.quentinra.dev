===========================================================================================
5. Gestion de la mémoire secondaire - Organisation Indexée : non dense ou creux
===========================================================================================

On a un index qui contient des clefs (par forcément primaire), chaque clef pointant sur un bloc.

On fait un indexe avec seulement certaines valeurs possibles, et chaque valeur pointe vers le
bloc ou sont les enregistrement ayant cette valeur. Un bloc contient les valeur => a son
index et < aux valeurs de l'index suivant.

.. image:: /assets/db/sql/creux.png