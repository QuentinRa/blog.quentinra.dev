================================
Utilisateurs
================================

Niveau débutant
***********************

1/1 Contrôle des données : gestion des utilisateurs
------------------------------------------------------

On suppose que trois classes d’utilisateurs ont accès à tout ou partie de cette base de données :

	*
		L’administrateur de la base qui initialise et alimente la base en debut de saison avec tous les spectacles et toutes les ´
		representations associées,
	*
		Les guichetiers qui gèrent les réservations de ces représentations et émettent les billets,
	*
		Les clients potentiels qui peuvent consulter la base pour connaître les spectacles joués (éventuellement par type) et
		connaître les representations pour lesquelles il reste des places disponibles.

Proposez un schema externe sous forme de vue pour chaque classe d’utilisateurs. En vous aidant de la documentation
en ligne de votre SGBD (idéalement postgre) :

	(a) \
		Donnez les commandes permettant de créer les rôles Guichetier et Client et associez au moins un utilisateur à
		chaque rôle. On suppose qu’on dispose d’une liste d’utilisateurs qui ont pour login gui (un guichetier) et cli
		(un client).
	(b) \
		Donnez les droits appropriés a chaque classe d’utilisateurs sur les relations et les vues.

| :code:`[TAG] ENSIIE IBD TDM1 2018 S1`
| :code:`[TAG] ENSIIE IBD TDM1 2019 S1`
| :code:`[TAG] ENSIIE IBD TDM1 2020 S1`

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