================================
Création de tables et vue
================================

Niveau débutant
***********************

1/1 Que le spectacle continue
--------------------------------

.. code:: rst

	Personne(#id_personne: varchar(10), nom: varchar(50), prénom: varchar(50))

	Guichetier(#id_guichetier=>Personne)

	Spectacle(#n_spectacle: INTEGER, nom: VARCHAR(100), durée: INTEGER,
	s_type: {danse, theatre, concert})

	Salle(#n salle: INTEGER, nb_places: INTEGER)

	Représentation(#n_salle=>Salle, #r_date: DATE, prix: INTEGER, n_spectacle=>Spectacle)

	-- n spectacle est un attribut dérivé récupéré de Représentation
	Billet(#n_billet: SERIAL, n_salle=>Représentation, b_date=>Représentation,
	nom_client:VARCHAR(50), n_spectacle)

Les contraintes sont

	* Sur Spectacle :
		* Le nom d’un spectacle doit être renseigné,
		* La durée d’un spectacle est comprise entre une et quatre heures.
	* Sur Salle :
		* La capacité des salles du centre culturel varie entre 100 et 500 places.
	* Sur Représentation :
		* Le numéro du spectacle doit être spécifié,
		* Le prix d’une representation varie entre 10 et 50 euros.
	* Contrainte sur Billet :
		* L’identifiant du client doit être spécifié.

Attention ! Il existe des contraintes à deviner du diagramme, par exemple
un billet ne peux plus exister si son spectacle associé est supprimé.

1. \
	créer les tables Personne, Guichet, Spectacle, Salle, Représentation et Billet,
	en ajoutant les contraintes demandées

2. \
	Créez la vue V_Guichetier définie par ``V Guichetier = join(Guichetier, Personne)``

3. \
	Définissez une vue Guichet qui récapitule les informations pertinentes pour les représentations des spectacles
	proposés ainsi que l’état courant des réservations sur chaque représentation.
	Cette vue contiendra les colonnes (n_spectacle, n_salle, b_date, nom, s_type, prix, nb_places_libres).

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			          <create/d1>
	Proposition de correction n°2 (simple)			<create/d1_2>

| :code:`[TAG] ENSIIE IBD TPM1 2018 S1`
| :code:`[TAG] ENSIIE IBD TPM1 2019 S1`
| :code:`[TAG] ENSIIE IBD TPM1 2020 S1`

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
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)