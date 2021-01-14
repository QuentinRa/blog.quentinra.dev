=============================================
Recherche : find, whereis, locate, which
=============================================

Vous pouvez faire de la recherche en jouant avec les motifs,
par exemple afficher tous les png ou jpg ou les gifs
avec ls :code:`ls *.{jpg,gif,png}`. Vous pouvez également afficher
tous les .h par exemple :code:`ls *.h` mais attention, cela n'offre
aucune garantie dans le sens que cela affiche les dossiers et les fichiers.

Commande :code:`find <répertoire>` : recherche de dossiers/fichiers
	| :code:`-type` : f=fichier, d=dossiers
	| :code:`-empty` : trucs vides
	| :code:`-name "pattern"` : trouvent que ceux qui matchent le motif
	| :code:`-exec ... {} \;` : exécute la commande ..., {} se remplacé par le fichier/dossier trouvé
	| :code:`-execdir ... {} \;` : voir exec, sauf que la commande est faite dans le répertoire du match trouvé
	| :code:`-quit` : stop au 1er trouvé
	| :code:`-printf` : affichage customisé
	| :code:`-mindepth <valeur>` : min profondeur
	| :code:`-maxdepth <valeur>` : max profondeur, utile car find est récursif de base

	Options rares
		| :code:`-mtime` : modifiée x*24heures
		| :code:`-amin` : accès x minutes
		| :code:`-cmin` : inchangé n minutes
		| :code:`-newer <file>` : modification après <file>
		| :code:`-size` : xb = x bytes, vous pouvez changer l'unité
		| :code:`-perm` : permissions ex: 0744 ou -u-gw = ug ou uw

Commande :code:`locate` : cherche un fichier dans un base de données locales
	Doit être mis à jour avec :code:`sudo updatedb`.

Commande :code:`which` : retourne la première commande trouvée

Commande :code:`whereis` : cherche une commande dans PATH