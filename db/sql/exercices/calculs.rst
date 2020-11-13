================================
Calculs
================================

Niveau débutant
***********************

aucun

Niveau supérieur
***********************

1/1 - Exercice Fonctions de calcul et agrégats
-------------------------------------------------

.. note::

	Fichier de la base à importer : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import.sql>`

Écrivez les requêtes correspondant aux cas suivants.

En particulier, vous devez vérifier que que votre requête retourne
la réponse attendue.

1. \
	| Nombre de crus différents.
	| :code:`Réponse attendue` : 13 lignes

2. \
	|
		Quantité totale des vins livrés en 2001. Utilisez l'opérateur BETWEEN dans une première requête
		et la fonction EXTRACT() dans une seconde requête.
	| :code:`Réponse attendue` : 24.

3. \
	| Nombre de vins différents de chaque région. Affichez le nombre de vins dans une colonne nommée "nombre de vins".
	| :code:`Réponse attendue` : LOIRE : 6, CHAMPAGNE : 2, BORDEAUX : 5, BOURGOGNE: 4.

4. \
	|
		Nombre de vins différents produits par chaque viticulteur. Affichez le numéro et le
		nom de chaque viticulteur puis nombre de vins produits dans une colonne nommée "nombre de vins"
		et ordonnez le résultat en fonction du nombre de vins produits.
	| :code:`Réponse attendue` : 8 viticulteurs produisent 1 vin, 3 viticulteurs produisent 2 vins et 1 viticulteur produit 3 vins.

5. \
	|
		Quantité de vin moyenne commandée pour chaque buveur habitant 'PARIS'. Affichez le numéro et le nom de chaque buveur
		puis la quantité de vin moyenne commandée dans une colonne "quantité moyenne commandée".
	| :code:`Réponse attendue` : MAURY: 12, DUPONT: 6, GAUTHIER: 12.

6. \
	|
		Quantité de vin totale commandée pour chaque buveur dont la quantité de vin moyenne commandée est supérieure
		ou égale à 12.
		Affichez le numéro et le nom de chaque buveur puis la quantité de vin totale commandée dans une colonne
		"quantité totale commandée".
	| :code:`Réponse attendue` : GAUTHIER: 12, MAURY: 24, FRADET: 30.

7. \
	|
		Numéros et noms des viticulteurs qui produisent au moins deux vins de crus différents.
		Affichez le numéro et le nom de chaque viticulteur puis le nombre total de vins produits dans une
		colonne "nombre de vins produits".
	| :code:`Réponse attendue` : VALLE: 3, COULIS DUTHEIL: 2, PARENT: 2, MEDEVILLE: 2.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<calculs/s1>

| :code:`[TAG] ENSIIE IBD TP1 2018`
| :code:`[TAG] ENSIIE IBD TP1 2019`
| :code:`[TAG] ENSIIE IBD TP1 2020`

Niveau avancé
***********************

1/1 Maitre des opérations
-----------------------------

.. note::

	Fichier de la base à importer : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import.sql>`

Écrivez les requêtes correspondant aux cas suivants.

1. \
	Nombre de villes différentes chez les personnes enregistrées dans la table buveur.

2. \
	Quantité totale des vins commandés en 2002.

3. \
	Nombre de viticulteurs différents de chaque région. Affichez le nombre de viticulteurs
	dans une colonne nommée "nombre de viticulteurs".

4. \
	Nombre de vins différents commandés par chaque buveur. Affichez le numéro et le nom de chaque buveur puis le nombre de vins
	commandés dans une colonne nommée "nombre de vins commandés". Faites la requête en intégrant dans un premier temps les buveurs
	qui n'ont rien commandé, puis en les éliminant dans un second temps.

5. \
	Quantité de vin moyenne vendue pour chaque viticulteur de la région 'BOURGOGNE'. Affichez le numéro et le nom de chaque viticulteur
	puis la quantité de vin moyenne vendue dans une colonne "quantité moyenne vendue".

6. \
	Quantité de vin totale vendue pour chaque viticulteur dont la quantité de vin moyenne vendue est supérieure ou égale à 12.
	Affichez le numéro et le nom de chaque viticulteur puis la quantité de vin totale vendue dans une colonne "quantité totale vendue".

7. \
	Numéros et noms des buveurs qui ont commandé au moins deux vins de crus différents. Affichez le numéro et le nom de chaque buveur
	puis le nombre total de vins commandés dans une colonne "nombre de vins commandés".

8. \
	Numéros et noms des buveurs qui ont commandé au moins deux vins de crus différents de la même région.
	Affichez le numéro et le nom de chaque buveur puis la région et le nombre total de vins commandés par région dans une colonne
	"nombre de vins commandés".

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<calculs/a1>

| :code:`[TAG] ENSIIE IBD TP1 2018`
| :code:`[TAG] ENSIIE IBD TP1 2019`
| :code:`[TAG] ENSIIE IBD TP1 2020`

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)