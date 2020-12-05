========================================
4. CyberSécurité - Les problèmes du web
========================================

Une injection consiste a écrire du code
et faire en sorte que le site l'exécute.

Il existe des injections dans tous les langages mais ici
on considère Javascript et SQL.

Injections SQL
	Une injection SQL consiste a faire en sorte de pouvoir utiliser la base de données (BD) d'un site en écrivant
	du code, en l'envoyant au site, qui l'envoi à la BD et retourne un résultat au site et qui nous l'affiche.
	On va en l'occurrence injecter notre code dans la requête SQL pour que lorsque le site
	fasse sa requête, il fasse la notre en même temps.

	Un site web va généralement faire une requête par exemple pour récupérer tous les informations d'un utilisateur
	: :code:`Select * from users where user='$username'`. Une requête comme ça (PHP) permet à l'utilisateur
	de donner un username comme :code:`username';Delete from users;`. Ici le hackeur a mis dans sa saisie un
	' qui indique au sql que la requête SQL est finie. Donc il peut très bien ajouter une requête juste après.

	Pour éviter cela, vous devez utiliser des requêtes préparées (cherchez prepared request). Les arguments
	dans les requêtes préparés sont automatiquement échappés donc vous n'aurez pas de problèmes avec les ' ou
	autres caractères spéciaux qui seraient interprétés en SQL. Il est aussi intelligent de ne pas afficher les erreurs
	SQL (ou toutes) pour éviter d'aide le hackeur.

	Une injection SQL est de la forme :code:`valeur' CODE_SQL --`. le valeur\' est pour terminer la première requête,
	on met ensuite du CODE SQL et enfin -- pour un commentaire pour éviter une erreur avec le :code:`'` restant.

	Note: certaine sites utilisent user=('$username') donc vous devez ajouter une ) au \' après valeur.

	Dans le cas d'une base de données qui n'affichent pas d'erreur, vous allez devoir essayer avec une technique
	de booléen, si la base retourne une erreur alors la requête était fausse, sinon elle était bonne. On considère alors
	une erreur comme le fait qu'elle n'a pas fait l'action (donc par exemple un login AND votre_action et
	si le login ne s'est pas fait alors action est fausse).

		* vous pouvez alors vérifier par exemple si la x-ième lettre d'une table est ?
		* ex: :code:`valeur' AND (ascii(substr((select database()),1,1))) = 115 --` avec 115 = ascii pour 's'.
		* vous pouvez faire un :code:`order by <column_request_id>` pour tester le nombre de colonnes du select
			* test avec 1 (order by 1) : 1 colonne ?
			* test avec 2 (order by 2) : 2 colonne ?
			* ...
		*
			alternativement, vous pouvez utiliser un UNION Select NULL, ... et autant de NULL
			que vous testez le nombre (exploitation contrainte SQL du Union)

			* vous pouvez alors remplacer l'un des NULL par une valeur d'un type, si l'union marche alors la colonne est de ce type
			* ex: :code:`... UNION Select 5, NULL, NULL--` si marche alors la colonne 1 est un entier.

		* liste de quelques informations a récupérer :

			*	database()
			*	user()
			*	@@version
			*	username
			*	password
			*	table_name
			*	column_name

	Injections avec SQLMap
		SQLMap est une commande qui permet de faire facilement tout ce qui est expliqué plus haut
		(tuto supplémentaire : https://www.security-sleuth.com/sleuth-blog/2017/1/3/sqlmap-cheat-sheet).

		Installation :

			* :code:`git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev`
			* exécution : :code:`python sqlmap.py -h`

		Utilisation :

			* :code:`--url domaine` : le domaine que l'on veut mapper
			* :code:`-r request_file` : si vous avez récupéré une requête (ex: avec BurpSuite) et l'avez sauvegardé (save item).
			* :code:`--table` : affiche les tables
			* :code:`--column` : affiche les colonnes
			* :code:`--dbms=sgbd` : spécifier le SGBD
			* :code:`--dbms=sgbd` : spécifier le SGBD
			* :code:`-D nom_db` : spécifier le nom de la base
			* :code:`--time-sec temps` : scan en fonction du temps de réponse
			* :code:`--dump` : sauvegarde les données actuellement manipulées
			* :code:`--dump-all` : sauvegarde **toutes** les données
			* :code:`--batch` : fait toutes les requête d'un coup et n'attends pas votre saisie.

	Ressources : https://github.com/payloadbox/sql-injection-payload-list
	Vidéo : https://www.youtube.com/watch?v=Kitx7cSNsuE