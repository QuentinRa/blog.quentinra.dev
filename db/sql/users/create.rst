======================================================
6. Création d'utilisateurs - Création et suppression
======================================================

CREATE USER crée un utilisateur.

.. note::

		En particulier, le nom d'utilisateur
		peut être particulier : \"nom d'utilisateur\"[@\"host\"]. Comme vous pouvez le voir,
		vous pouvez optionnellement définir un "host", c'est à dire les adresses IP qui peuvent utiliser
		cette utilisateur pour se connecter (% = tout le monde = risqué, 127.0.0.1 = local par défaut).

DROP USER supprime un utilisateur.

.. code:: sql

		-- créer un utilisateur
		CREATE USER nom
			identified by mdp | externally
			[default tablespace nom]
			[temporary tablespace nom]
			[quota nb|unlimited]
			[password expire] ; -- changer le mot de passe à la première connexion

		-- supprimer un utilisateur
		-- cascade supprime également le schéma de l'utilisateur
		DROP USER user [CASCADE]

