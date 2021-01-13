====================================================
Traitement de texte : wc, nl, tail
====================================================

:code:`Description` : Traitement de texte

Commande :code:`wc` : prends en entrée du texte et donne le nombre de lignes/...
	| :code:`-l` : nombre de lignes uniquement
	| :code:`-w` : nombre de mots uniquement
	| :code:`-m` : nombre de caractères uniquement

Commande :code:`nl <fichier>` : affiche un fichier après avoir numéroté ses lignes
	| :code:`-ba` : toutes
	| :code:`-bt` : sans les lignes vides

Commande :code:`tr` : remplace le caractère, ou supprime un caractère
	Le caractère pour un saut de ligne est '\n'.

	| :code:`'c' 'n'` : remplace le caractère 'c' par le caractère 'n'
	| :code:`-d 'c'` : supprime le caractère c

Commande :code:`tail <fichier>` : affiche les 10 dernières lignes d'un fichier
	| :code:`-n <valeur>` : le nombre de lignes a afficher depuis la fin (pareil si vous mettez -<valeur>)
	| :code:`-n +<valeur>` : affiche tous le fichier sauf les <valeur> premières lignes
	| :code:`-bt` : sans les lignes vides

	Alternativement, il y a la commande :code:`head` qui fait l'inverse.

Commande :code:`sort` : trie les lignes d'un fichier (sans le modifier, il faudra rediriger la sortie)
	Ex : :code:`sort -t -k1.0,1.4` (trie du char 0 à 3 de la colonne 1)

	| :code:`-n` : nombre
	| :code:`-k` : colonne/caractère (k1.0 = caractère 0 de la colonne 1). On peut faire des intervalles avec ,
	| :code:`-h` : colonne
	| :code:`-b` : ignore les blancs
	| :code:`-r` : décroissant (reverse)
	| :code:`-d` : tri selon l'ordre du dictionnaire
	| :code:`-t:` : utilise : comme séparateur des colonnes

Commande :code:`cut` : supprime un champ
	On considère un champ avec un délimiteur par exemple ':'. La partie avant le ':' est le champ1
	est la partie après est le champ 2.

	Ex : :code:`cut -d: -f6` (supprime le 6e champ)

	| :code:`-d:` : définit : comme le délimiteur des champs
	| :code:`-f` : le champs (vous pouvez faire -f1-3 pour les champs 1 à 3 ou -f1,3 pour le champ 1 et le 3)

Commande :code:`expr` : permet de faire des manipulations de chaines de caractères
	| :code:`substr chaine x pos` : extrait une sous-chaine depuis x jusqu'à pos
	| :code:`index chaine char` : retourne la position dans une chaine d'un char