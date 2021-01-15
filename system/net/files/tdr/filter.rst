================================
Filtres de réseaux
================================

Le principe est que des morceaux de codes vont lire les entêtes de paquets et s’ils
reconnaissent un paquet qui satisfait un filtre, alors ils l’appliquent.

La commande utilisée (le plus souvent) est iptables (ligne de commande),
elle nécessite des droits super-administrateur (root/sudo).

La structure est la suivante :

	*	Il existe des tables (grand ensembles) tel que

			*	filter (filtre des paquets)
			*	NAT (translation d’adresse)

	* Chaque table contient des ensembles appelés chaines
	* Ces chaines contiennent des règles de la forme :

		* <expression> <action>
		* qui indique si quelque chose qui respecte « expression » passe par cette table, alors on effectue « action ».
		* action peux renvoyer à une autre chaine

La commande iptables avec l’option L permet d’afficher toutes les chaines d’une table.
On peut préciser avec -t la table, sinon c’est la table par défaut qui sera affichée (filter).

.. toctree::
	 :maxdepth: 1

			Filtre de paquets           <nf>
			Translation d’adresse       <nat>