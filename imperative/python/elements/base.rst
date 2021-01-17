======================================================
2. Particularités de python - Variables, Blocs, ...
======================================================

Les lignes ne finissent pas par un :code:`;` et les blocs
ne sont pas compris entre des accolades :code:`{code}` comme
dans d'autres langages.

Bloc
	Un bloc peut être un bloc if, une boucle for/while/..., une fonction, une déclaration de classe...

	Python oblige que l'on indente de 4 espaces (1 tabulation) a chaque fois qu'on entre dans un bloc.

	.. code:: python

	  un_bloc: #début de bloc
	      # ici le code est dans le bloc
	      # ici le code est toujours dans le bloc
	      un_bloc:
	          # code etc...
	  # ici le code n'est pas considéré comme dans le bloc

Types
	Les variables en python sont faiblement typées (les types des variables ne sont pas précisés).
	Par défaut, toutes les variables sont des objets.

======= =============== ============================================
Types	  Formats         Notation/Exemples
======= =============== ============================================
int	    %d	42
float   %f %.xf %0x.yf	0.5
object
string	%s              \'string\' ou \"string\" ou \"\"\"paragraphe\"\"\"
{aucun} %s %r %i        False ou True
======= =============== ============================================

%x ou %X affichent un nombre au format hexadécimal.

Créer une variable
	.. code:: python

		variable = 5.0 # crée un float
		variable1, variable2 = 5.0, 3.0 # crée plusieurs variables
		variable = object() # crée un object, il existe une telle méthode pour int et float
		variable = int(5) # crée un int

Identifier le type d'une variable
	.. code:: python

		# True si instance=du même type que type
		isinstance(variable, type)