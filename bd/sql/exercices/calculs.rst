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

Écrivez les requêtes correspondant aux cas suivants.

En particulier, vous devez vérifier que que votre requête retourne
la réponse attendue.

1. \
	| Nombre de crus différents.
	| Réponse: 13 lignes

2. \
	|
		Quantité totale des vins livrés en 2001. Utilisez l'opérateur BETWEEN dans une première requête
		et la fonction EXTRACT() dans une seconde requête.
	| Réponse: 24.

3. \
	| Nombre de vins différents de chaque région. Affichez le nombre de vins dans une colonne nommée "nombre de vins".
	| Réponse: LOIRE : 6, CHAMPAGNE : 2, BORDEAUX : 5, BOURGOGNE: 4.

4. \
	|
		Nombre de vins différents produits par chaque viticulteur. Affichez le numéro et le
		nom de chaque viticulteur puis nombre de vins produits dans une colonne nommée "nombre de vins"
		et ordonnez le résultat en fonction du nombre de vins produits.
	| Réponse: 8 viticulteurs produisent 1 vin, 3 viticulteurs produisent 2 vins et 1 viticulteur produit 3 vins.

5. \
	|
		Quantité de vin moyenne commandée pour chaque buveur habitant 'PARIS'. Affichez le numéro et le nom de chaque buveur
		puis la quantité de vin moyenne commandée dans une colonne "quantité moyenne commandée".
	| Réponse: MAURY: 12, DUPONT: 6, GAUTHIER: 12.

6. \
	|
		Quantité de vin totale commandée pour chaque buveur dont la quantité de vin moyenne commandée est supérieure
		ou égale à 12.
		Affichez le numéro et le nom de chaque buveur puis la quantité de vin totale commandée dans une colonne
		"quantité totale commandée".
	| Réponse: GAUTHIER: 12, MAURY: 24, FRADET: 30.

7. \
	|
		Numéros et noms des viticulteurs qui produisent au moins deux vins de crus différents.
		Affichez le numéro et le nom de chaque viticulteur puis le nombre total de vins produits dans une
		colonne "nombre de vins produits".
	| Réponse: VALLE: 3, COULIS DUTHEIL: 2, PARENT: 2, MEDEVILLE: 2.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<calculs/s1>

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)