================================
Triggers
================================

Niveau débutant
***********************

1. Gestion de stock des vins
------------------------------------

.. note::

	Fichier de la base à importer (postgre) : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import_p.sql>`

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

2. Calcul d’attributs dérivés
--------------------------------

.. note::

	Fichier de la base à importer (postgre) : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import_p.sql>`

1. \
	Créez un "miroir" de la table vin, que l’on appellera par exemple vin_m, dont le schéma et les contraintes sont les
	mêmes que pour vin, à l’exception de l’attribut n_vin qui sera de type TEXT.

2. \
	Créez une fonction, qui pour chaque tuple présent dans la table vin, remplit la table vin_m avec les informations
	correspondantes en prenant soin d’intégrer à la clé primaire l’information concernant le millésime.

Pour construire la clé de vin_m, on part des hypothèses suivantes, actuellement vérifiées dans notre base de données :

	* le numéro du vin est un entier codé sur trois chiffres,
	* le millésime est un entier cod´e sur quatre chiffres.

On souhaite donc que l’attribut n_vin de vin m soit une chaîne de caractères qui contient le millésime puis le numéro
du vin. Par exemple, le tuple de la table vin : (170, 'BOUZY', 1994, 'CHAMPAGNE', 15) deviendra dans la table
vin_m : ('1994170', 'BOUZY', 1994, 'CHAMPAGNE', 15).

3. \
	Créez un déclencheur qui, avant chaque insertion dans vin_m, vérifie si la valeur de millésime correspond bien au
	code entré dans n_vin. Si c’est le cas ou si millésime est NULL, on insère le tuple. Dans le cas contraire, on n’insère
	pas le tuple.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<triggers/d2>

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