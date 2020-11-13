===========================================================================
5. Gestion de la mémoire secondaire - Organisation séquentielle
===========================================================================

Les enregistrement sont stockés les uns après les autres. On ajoute de nouveaux blocs au fur et à mesure.

Pour la suppression, on vide la ligne et on crée/ajoute dans un bloc des emplacements libres l'emplacement
libre. Ce bloc est vérifié avant tout placement, et donc les trous sont bouchés avec les nouveaux arrivants.

Le seul moyen de trouver un enregistrement et de balayer tous les blocs.