================================
Tables de routage
================================

C’est dans les tables de routages que l’on va définir quel machine peux voir quel machine
et inversement. On va ajouter des règles pour une adresse ou une plage d’adresses et indiquer
une adresse sur laquelle on doit se rediriger si on cherche cette adresse ou cette plage d’adresses.

.. image:: /assets/system/net/cours/table.png

destination indique le format de l’adresse mais pour vérifier une adresse, on doit
vérifier avec le genmask (masque de réseau) si le nombre de bits fixes de l’adresse sur cette
ligne est respectée par l’adresse testée.

Si la colonne de destination contient 0.0.0.0 ou défault, c’est qu’il s’agît de l’ultime chemin
si tous les autres n’étaient pas compatibles (on la test en dernier, il peut ne pas avoir de route par défaut).

gateway indique l’endroit où on doit se rediriger pour trouver l’adresse où la plage d’adresse de
la colonne destination. Si l’adresse de la gateway est 0.0.0.0 alors c’est qu’on est directement
lié à la machine.

Iface contient le nom de l’interface par laquelle on va passer.