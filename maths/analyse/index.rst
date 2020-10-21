.. _analyse:

================================
Analyse numérique
================================

.. warning::

	Ce cours suppose des bases en analyse et en algèbre matriciel

1. Introduction
=================================

1.1 Objectif
~~~~~~~~~~~~~~~~~~

L'objectif est de résoudre numériquement un système linéaire (sl)
et réussir à calculer les valeurs propres d'une matrice.

1.2 Comment résoudre ax=b
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- méthode directe : faire un nombre fini d'opérations
- méthode itérative : approcher x par récurrence

1.3 Problèmes
~~~~~~~~~~~~~~~~~~

Les calculs étant fait sur ordinateurs, il y aura des erreurs. Il faut pouvoir
estimer cette erreur.

	* erreurs arrondi

Les calculs peuvent êtres très longs si le système est très grand. Il faut
connaitre le cout/un ordre d'idée de chaque méthode.
