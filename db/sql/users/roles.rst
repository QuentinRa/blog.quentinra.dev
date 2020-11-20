=========================================
6. Création d'utilisateurs - Rôles
=========================================

Il est possible de créer des rôles, c'est à dire que si vous êtes dans un cas
où les utilisateurs de votre base de données font partie de groupe (client, admins, ...)
alors vous pouvez créer un rôle, donner des permissions au rôle et enfin donner le rôle au utilisateurs.

Ce qui donne

	* Create ROLE pour créer un rôle.
	* GRANT ... ON ... TO role : utilise la syntaxe de grant mais sur un role
	* GRANT role TO user : donne le rôle à un utilisateur

La syntaxe de Create Role est :code:`CREATE Role nom`
ou :code:`CREATE Role nom with admin user` si le rôle est gérer par un administrateur.