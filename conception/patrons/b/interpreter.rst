============
Interpreter
============

Il semblerait que le patron Interpreter ne soit qu'un Parser
de code d'un langage vers le notre.

Je crois que c'est principalement pour insister sur le fait
qu'un langage c'est un grammaire donc par exemple faire des classes/méthodes pour chaque
éléments de la grammaire (méthode et, ou, imp, equi, ... en logique par exemple) et en fait dès qu'on va
parser notre fichier/expression, on va essayer de découper notre truc pour obtenir
les arguments d'une de nos opérations (par exemple a et b pour un +), sauf que a
et b ne sont pas forcément des valeurs, donc faut aussi les parser.

Chacun des classes (généralement, EtExpression, OuExpression, ...) contiennent
une méthode interpret qui prends une expression (string par exemple) et retourne son évaluation
par le langage.

More

	* :code:`➡️` : Par exemple un parseur qui lit un XML et retourne un objet JAVA correspondant.
	* :code:`✅` : si le langage est simple
	* :code:`🚫` : si le langage est compliqué (trop difficile de gérer tous les cas)

Les fonctions JAVA comme :code:`String.valueof(...)` sont des parseurs
de int/... vers String.