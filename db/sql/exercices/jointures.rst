================================
Jointures
================================

Niveau débutant
***********************

1/1 Quelques jointures
----------------------------------

1. \
	Sur quels les attributs portent la jointure ? Quel est le schéma du résultat de la requête ?

	.. code:: sql

		SELECT * FROM vin NATURAL JOIN viticulteur;

2. \
	Pourquoi les attributs n_viticulteur sont ils préfixés ? Quel est le schéma du résultat de la requête ?
	À partir de quelle opération est-il obtenu ?

	.. code:: sql

			SELECT *
			FROM vin, viticulteur vit
			WHERE vin.n_viticulteur = vit.n_viticulteur;

3. \
	Pourquoi le résultat est-il vide ?

	.. code:: sql

		SELECT * FROM buveur NATURAL JOIN viticulteur;

4. \
	Expliquez le résultat

	.. code::

		SELECT * FROM buveur JOIN viticulteur USING (nom, prenom);

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<jointures/d1>

| :code:`[TAG] ENSIIE IBD TP1 2018 S1`
| :code:`[TAG] ENSIIE IBD TP1 2019 S1`
| :code:`[TAG] ENSIIE IBD TP1 2020 S1`

Niveau supérieur
***********************

1/1 Jointures
-------------------------------------

.. note::

	Fichier de la base à importer : :download:`setup.sql <../../../assets/db/bases/vins_ensiie_1a_import.sql>`

Écrivez les requêtes suivantes en SQL89 et en SQL92.

En particulier, vous devez vérifier que que votre requête retourne
la réponse attendue.

1. \
	Numéros et noms des différents viticulteurs qui proposent des vins de 'LOIRE' de millesime 1993.
	:code:`Réponse attendue` :  1 tuple.

2. \
	Numéros et noms des buveurs ayant commandé un vin de cru 'POMMARD'.
	:code:`Réponse attendue` : 4 tuples.

3. \
	Noms des viticulteurs à qui le buveur 'DUPOND' a commandé du vin.
	:code:`Réponse attendue` : 2 tuples.

4. \
	Numéros et noms des viticulteurs qui habitent la même ville qu'un de leurs clients.
	:code:`Réponse attendue` : 1 tuple.

5. \
	Numéros et noms des buveurs qui n'ont rien commandé. Vous exprimerez cette requête de 3 façons.
	:code:`Réponse attendue` : 7 tuples.

		a) \
			en testant l'appartenance (ou pas) à un ensemble, (NOT) IN ou EXCEPT

		b) \
			en testant les propriétés que certains attributs doivent vérifier, (NOT) EXISTS ou ALL (ANY)

		c) \
			en testant le résultat d'une jointure externe. [LEFT/RIGHT/FULL] OUTER JOIN

6. \
	Liste des crus qui ont été commandés mais pas en quantité supérieure ou égale à 12, en utilisant les mêmes approches que précédemment.
	:code:`Réponse attendue` : 3 tuples.

7. \
	Numéros et noms des buveurs qui n'ont commandé que des vins de la région de 'BOURGOGNE', en utilisant les approches a) et b) présentées précédemment.
	:code:`Réponse attendue` : 3 tuples.

8. \
	Numéros et noms des buveurs qui n'ont commandé que des vins des régions de 'BOURGOGNE' et de 'BORDEAUX',
	en utilisant les approches a) et b) présentées précédemment.
	:code:`Réponse attendue` : 1 tuple.

9. \
	Liste des villes dans lesquelles se trouvent soit un viticulteur soit un buveur.
	:code:`Réponse attendue` : 17 tuples.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<jointures/s1>

| :code:`[TAG] ENSIIE IBD TP1 2018 S1`
| :code:`[TAG] ENSIIE IBD TP1 2019 S1`
| :code:`[TAG] ENSIIE IBD TP1 2020 S1`

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Marie SZAFRANSKI (enseignant à l'ENSIIE)