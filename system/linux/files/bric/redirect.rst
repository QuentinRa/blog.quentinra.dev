===========================================
Redirections et pipe : \|, >, <, >> et <<
===========================================

Pour les redirections et le pipe, il faut d'abord comprendre que chaque commande a une
entrée (0) et deux sorties 1 (sortie normale) et 2 (sortie pour les erreurs) malgré
le fait que les deux sorties sont affichées pareil dans le terminal.

Il existe donc des commandes comme :code:`wc` qui prends
du texte que vous saisissez et retourne le nombre de lignes/... Cette commande ne lit
pas un fichier, mais vous pouvez remplir son entrée avec un fichier : on parle de redirection.

Alternativement, vous pouvez vouloir comme commande écrive dans un fichier/... plutôt que dans
un terminal : c'est également une redirection.

On considère f0 et f1 des flux de données (donc par exemple :code:`cat fichier`)

	*	f0 > f1 : redirige la sortie de f0 vers f1
	*	f0 < f1 : redirige l'entrée de f0 par le contenu de f1
	*	f0 >> f1 : redirige la sortie de f0 à la suite du contenu de f1
	*	f0 2> f1 : redirige la sortie d'erreur vers f1
	*	f0 2>&1 f1 : redirige la sortie d'erreur à la suite de la sortie standard

Exemple : stocker le man de ls dans fi.txt :code:`man ls > fi.txt`.

Une redirection souvent utilisée est :code:`... commande ... 2> /dev/null`. Il s'agit
de rediriger toutes les erreurs dans un fichier poubelle donc on ne verra aucune erreur.

Un pipe est un tube qui fait que le résultat (sorties) d'une commande
deviennent automatiquement l'entrée d'une autre commande.

	* :code:`commande_1 | commande_2` (ex: :code:`cat fichier | wc`)