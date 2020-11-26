.. _plsql_postgre:

=========================================
Particularités de Postgre pour le PL/SQL
=========================================

| :math:`\color{grey}{Version \ 1.1.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 26/11/2020}`

1. Général
======================

On utilise RAISE NOTICE pour afficher un message

.. code:: sql

	RAISE NOTICE 'texte';

4. Triggers
==========================

Sous POSTGRE, execute PROCEDURE prends une fonction qui retourne un TRIGGER
(vous pouvez retourner NULL).

-----

**Crédits**
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune