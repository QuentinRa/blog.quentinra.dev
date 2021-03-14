==============================
Algorithme de Floyd-Warshall
==============================

Soit un graphe pondéré G avec des poids ayant une valeur positives ou négatives,
alors Floyd-Warshall donne le plus court chemin partant de n'importe
quel sommet vers n'importe quel autre en complexité :math:`O(m^2)`.

.. code:: none

  Fait la matrice d'adjacence, on met comme valeur la pondération ou infini

  Pour tout k à n
   Pour tout i à n
    Pour tout j à n
     Si la distance entre i et j est plus grande que d(i,k) + d(k,j) = z alors
     d(i,j) = z.
