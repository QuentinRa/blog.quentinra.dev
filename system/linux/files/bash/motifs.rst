===========================================
Motifs : grep, sed, awk
===========================================

Commande :code:`grep` : sélectionne la partie d'un fichier qui match avec la regex
	Rappel les regex sont .,  (a|b) : soit a soit b , ^ : début , $: fin
	et \+ : au moins un fois ce qui le précède, \*  : 0 ou plus ce qui le précède.

	| :code:`--color` : si grep affiche tout, alors le match sera mis en couleur
	| :code:`-E` : les regex sont automatiquement échappé sinon vous devez faire \( pour dire que ( n'est pas le caractère (.
	| :code:`-i` : pas sensible à la case (majuscule/minuscule)
	| :code:`-w` : mot exact
	| :code:`-c` : retourne le nombre de lignes qui matchent
	| :code:`-n` : affiche les numéros des lignes qui matchent
	| :code:`-r` : récursif
	| :code:`-L` : stop au 1er match par fichier, affiche les fichiers sans match
	| :code:`-l` : stop au 1er match par fichier, affiche ceux avec match
	| :code:`-v` : affiche tout ce qui ne matche pas
	| :code:`-o` : n'affiche que la partie qui matche.

Commande :code:`sed` : afficher une modification sur un fichier sans le modifier
	Il y a plusieurs formes de syntaxe de sed et c'est une commande assez compliqué.

	* :code:`sed '{nombre}<commande>{caractère}' <fichier>` : la forme basique
	* :code:`sed 's/{motif}/{remplacement}/{option}` : la forme de remplacement

	Forme basique
		| :code:`a<caractères>` : pour toute ligne du fichier, ajoute <caractères> avant chaque ligne
		| :code:`i<caractères>` : pour toute ligne du fichier, ajoute <caractères> après chaque ligne
		| :code:`c<caractères>` : pour toute ligne du fichier, remplace la ligne par <caractères>
		| :code:`e<commande>` : pour toute ligne du fichier, exécute et affiche le résultat de commande avant chaque ligne
		| :code:`d` : supprime toutes les lignes du fichier

	Si vous ne voulez pas toucher a tous les lignes, vous devez spécifier les lignes avant le caractères
	de commande (a,i,c,e,d) :

		* :code:`1<c>` fait la commande <c> à la ligne 1
		* :code:`1,3<c>` fait la commande <c> aux lignes 1 et 3
		* :code:`$<c>` fait la commande <c> sur la dernière ligne

	Ex : :code:`sed '1,3epwd' fichier` (affiche avant les lignes 1 et 3 le résultat de la commande pwd sur fichier).

	Forme de remplacement
		On va remplacement motif par remplacement. Option détermine si on doit le faire seulement pour le premier
		match de la ligne (défaut) ou quelque chose de particulier... On utilise un / comme séparateur mais des
		tarés utilisent des + par exemple (donc s+motif+remplacement+option).

		| :code:`motif` et :code:`remplacement` sont des motifs (si vous mettez un pattern entre parenthèse, vous pouvez y référez dans remplacement avec \1, \2, ...)
		| :code:`-e` : utilisé si votre motif contient des caractères bizarres
		| :code:`option` : g (tous les matchs), rien (pour le premier match de chaque ligne) <nombre> (remplace que le <nombre> ième de chaque ligne)

	Exemple : :code:`sed -e 's/^3\(.*\)/#\1/' fichier` (remplace les lignes qui commencent par 3 par une ligne commentée sans le 3).

Commande :code:`awk 'pattern {action}' fichier` : affiche un fichier, édité, sans le modifier
	L'action est facultative mais si elle est présente, alors vous devez mettre des {} autour.

	| :code:`action` : print pour afficher (défaut)

	Avec l'action print, vous pouvez choisir d'afficher
			| :code:`$x` : colonne x ($0=toutes)
			| :code:`NF` : nombre de colonnes
			| :code:`NR` : nombre de lignes

	Vous pouvez définir des conditions (par exemple NF > 2 etc.).