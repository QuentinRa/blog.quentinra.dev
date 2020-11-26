================================
Triggers
================================

Niveau débutant
***********************

1. Gestion de stock des vins
------------------------------------

.. note::

	Fichier de la base à importer : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import_p.sql>`

1. \
	Créez un déclencheur qui vérifie, avant qu’une commande ne soit validée,
	que la quantité de vin disponible est suffisante.
	Dans le cas contraire, une exception doit être levée.

2. \
	Reprenez le déclencheur précédent en diminuant également la quantité de vins
	disponible chaque fois qu’un vin peut être commandé.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<triggers/d1>

| :code:`[TAG] ENSIIE IBD TP3 2018 S1`
| :code:`[TAG] ENSIIE IBD TP3 2019 S1`
| :code:`[TAG] ENSIIE IBD TP3 2020 S1`


Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)
	* Didier DIAZ (enseignant à l'IUT de Sénart-Fontainebleau)