==========================
Base de données (interne)
==========================

Une base de données interne à l'application fonctionne comme une base de
données externe mais ne nécessite pas de serveur. La base de donnée
se trouve en mémoire ou dans un fichier.

SQLite propose une solution, son driver java peut être téléchargé comme
les autres drivers (Base de données (externe)).

**SQLite**

.. code:: java

		// Connexion
		// host peut être un chemin vers un fichier, par exemple jdbc:sqlite:test.db ou :memory:
		// pour en mémoire
		Connection c = DriverManager.getConnection("jdbc:sqlite:host", username, password);

		//L'exécution de requête sans résultats n'est possible que pour les requêtes non préparées
		try (Statement stmt = conn.createStatement()) {
		 stmt.executeUpdate(sql);
		}

		//La lecture des résultats ne se fait qu'avec next
		while(rs.next()){
		 ...
		}

Notes

	* SQLite autorise uniquement l'auto-increment : :code:`nom` integer primary key autoincrement`.