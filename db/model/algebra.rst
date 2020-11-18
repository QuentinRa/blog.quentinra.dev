.. _algebra_relation:

=================================================
Algèbre relationnelle et langage assertionnel
=================================================

| :math:`\color{grey}{Version \ 1.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 18/11/2020}`

1. Introduction
=========================

Projection :code:`project(relation, attribut, ...)`
	La projection est une sélection de toutes les valeurs d'une relation, et n'affiche
	les valeurs que des attributs sélectionnés.

	:math:`R2 = \pi_{(attribut1)} R1` donneras une relation R2 avec seulement Attribut1 de R1.

Restriction :code:`restrict(relation/condition)` ou :code:`restrict(relation, condition)`
	Une restriction limite le résultat d'un projection au lignes qui respectent la condition.

	:math:`R2 = \sigma_{(attribut1<10)} R1` donnera une R2 avec tous les Attribut1<10 de R1

Ensembles
	|	R1 ∪ R2 : (=union) tous les tuples de R1 et R2
	|	R1 ∩ R2 : (=intersection) tous les tuples en commun de R1 et R2
	|	R1 - R2 : tous les tuples de R1 sans ceux qui sont dans R2
	|	R1 x R2 : Chaque tuple de R1 multiplié par tous les tuples de R

2. langage assertionnel
==========================

Plus d'explications à venir, j'ai jamais vu d'utiliser à apprendre ça donc
si vous voyez ça, fuyez !

Une requête

.. code:: sql

	Select attribut,... FROM r1, r2, ... Where condition

devient

.. code:: none

		(relation1.attribut, ...) / relation1 Λ relation 2 Λ ... Λ condition
		-- Pour éviter d’écrire la relation, on peut la mettre dans une variable
		{ (R1.attribut, …) / relation1 (R1) Λ relation2 (R2) Λ  … Λ condition

Pour caractériser nos ensembles (union, intersection, …),
on utilisera ∃ (il existe) et sa négation ¬∃ ainsi que ∀ (pour tout) et sa négation ¬∀

.. code:: none

		-- Une condition pourrait être
		… Λ Relation.attribut = Relation.attribut Λ …

On utilise les lois mathématiques De Morgan pour casser les implication/équivalences
en expressions de et/ou.

3. Récapitulatif
====================

Voici un récapitulatif avec les symboles associés et les clauses SQL.

.. image:: /assets/db/model/algebra.png