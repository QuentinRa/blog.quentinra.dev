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

Commande :code:`tail <fichier>` : affiche les 10 dernières lignes d'un fichier
	| :code:`-n <valeur>` : le nombre de lignes a afficher depuis la fin (pareil si vous mettez -<valeur>)
	| :code:`-n +<valeur>` : affiche tous le fichier sauf les <valeur> premières lignes
	| :code:`-bt` : sans les lignes vides