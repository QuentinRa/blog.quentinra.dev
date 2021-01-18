=========================
Base de données (externe)
=========================

Il est possible d'utiliser une base de données externe donc sur un serveur (local ou non).
Ceci nécessite une connexion contrairement aux bases internes.

Pour vous connecter à une base de données, vous avez besoin de son driver java. Vous pouvez les
trouver sur leurs sites ou ici https://mvnrepository.com/ (si vous n'utilisez ni maven ni gradle,
ce n'est pas grave, faites les télécharger le .jar puis copiez le dans votre projet).

Une fois le .jar téléchargé, alors copiez le dans votre projet. Il faudra le charger à chaque appel
de java (pas javac) pour qu'il soit chargé par le DriverManager, la classe qui sera utilisée pour se
connecter.

.. code:: bash

		# lancer Main.class
		# on modifie le classPath pour ajouter en plus de . (dossier courant) le driver.
		# utiliser gradle ou maven pour éviter tout ça
		# sur Intellij IDEA, le .jar s'ajoute via Projet Structure > Librairies (pas besoin de cette commande)
		java -cp ".:chemin/vers/le driver" ... Main

Méthodes
-------------------

Attention, toutes les méthodes lève une SQLException qui doit être capturées.
Ceci n'est pas optionnel.

**Connexion**

.. code:: java

	// vérifier que le driver a bien été chargé
	// exemple avec le driver mariadb
	// lève class not found exception si le driver n'a pas été trouvé
	Class.forName("org.mariadb.jdbc.Driver");

	// -------- Connexion --------
	// une adresse est de la forme jbdc:driver:host par exemple jdbc:mariadb:host
	Connection c = DriverManager.getConnection(adresse, username, password);

	// fermer la connexion après utilisation
	// (si vous ne la fermez pas, la connexion reste ouverte même après fermeture du
	// programme côté serveur)
	c.close();

**Requêtes**

.. code:: java

	Statement stmt = c.createStatement();
	stmt.executeUpdate(sql); // requête qui ne retourne rien
	stmt.close();

	// ou

	//une requêtes préparée permet de créer une requête avec des ? auquel vous pourrez donner
	// une valeur plus tard. L'avantage est que les arguments sont échappés donc pas d'injection de code.
	// ex: Select * from table1 where `id`=?
	PreparedStatement stmt = c.prepareStatement(sql);
	//fermer le statement après les/la requête(s) faite(s)
	stmt.close();

	//pour remplacer des ?, on donne l'index du ? (commence à 1) et la valeur
	stmt.setInt(index, valeur)
	stmt.setString(index, valeur)
	...

	// requête qui ne retourne rien
	stmt.executeUpdate();

	//-------- retourne un résultat --------
	ResultSet results = stmt.executeQuery();//preparedStatement
	ResultSet results = stmt.executeQuery(sql);//statement
	//fermeture
	results.close();

**Exploiter un set de résultats**

Les résultat sont lus à la volée pour éviter de tout récupérer donc encore des exceptions
un curseur permet de savoir ou on est en train de lire, il est juste avant le 1er élément au début
donc il faut l'avancer de 1, s'il existe un premier élément, pour pouvoir le lire.

.. code:: java

		// avance le curseur de 1, retourne false si aucun next
		boolean results.next();
		// recule le curseur de 1, attention, n'est pas toujours disponible
		boolean results.previous();
		// avance le curseur au premier, retourne false si aucun premier
		boolean results.first();
		// pour récupérer la valeur lue
		// retourne la valeur correspond à cette colonne/attribut
		int results.getInt(positionColonne);
		String results.getString(positionColonne);
		// pour obtenir la position d'une colonne, vous pouvez utiliser
		int findColumn(String nomColonne);

Vous pouvez obtenir tous les noms de colonnes avec les méta-data du ResultSet.

Obtenir ID d'insertion sur un Statement stmt

.. code:: java

		try(ResultSet generatedKeys = stmt.getGeneratedKeys()) {
		 if(!generatedKeys.next()) return -1;
		 return (int) generatedKeys.getLong(1);
		}

**Closable**

Pour éviter de devoir faire des closes, on peut utiliser le
try with ressource.

.. code:: java

		// try with ressource ferme automatiquement un ressource Closable (appel de .close())
		try (Connection c = DriverManager.getConnection(...)) {
		 try (Statement s: c.createStatement()) {
			try (ResultSet rs = stmt.executeQuery(...)) {
			 while(rs.next()){
				...
			 }
			}
		 }
		} catch(SQLException e) {
		 System.err.println(e);
		}