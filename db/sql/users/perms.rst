=========================================
6. Création d'utilisateurs - Permissions
=========================================

Grant permet de donner des permissions sur UNE seule table par requête
à des utilisateurs. Si vous ajoutez "WITH GRANT OPTION", alors les permissions pourront
être transmises, mais elle seront retirées vous n'avez plus de \"parent\" qui possède ces permissions.

Revoke permet de manuellement supprimer des permissions.

.. code:: sql

		-- Les permissions sont
		select, insert, delete, update, update(attribut)
		references, execute, connect, ressource  ALL PRIVILEGES

		-- donner des permissions
		-- WITH GRANT/ADMIN OPTION : permet à cet utilisateur de transférer ses privilèges
		-- PUBLIC : tout le monde
		Grant permissions on table to PUBLIC|user [WITH GRANT OPTION];

		-- retirer des permissions
		Revoke permissions on table to user;




.. note::

	si votre utilisateur est \"le best\"@\"192.168.0.1\" donc vous avez spécifié une range
	d'adresses IP, alors vous devez écrire @\"192.168.0.1\" à chaque fois qu'on demande \"user\".