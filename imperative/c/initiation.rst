.. _c_initiation:

================================
Langage C - initiation
================================

.. note::

	Cette page donne des connaissances pour ceux pour lesquels le C est leur premier langage, à utiliser comme référence
	s'il y a des termes qui ne sont pas définis car ils ont étés supposés acquis.

	S'il y a d'autres termes bizarres, signalez le !

Fonction
	Une fonction est package regroupant un ensemble de code, généralement car il est utilisé de nombreuses
	fois dans le code (ex: fonction affichage).

	Les arguments sont les valeurs données à l'appel de la fonction. Si la fonction retourne un résultat,
	alors on parle de retour.

Variable
	Une variable est un conteneur dans lequel on peut mettre une valeur (par exemple 5 ou "toto"). Elle
	a généralement un nom et une adresse (une bloc dans la mémoire lui est réservé) et un type.

Type
	Pour représenter des valeurs, par exemple un nombre ou du texte, on introduit la notion de type.
	Un type est le domaine de définition d'une variable.

	On introduit généralement la notion de type car les fonctions ne marchent pas forcément
	si les données ne sont pas du bon type.

Compilateur
	Il s'agit d'une commande qui va transformer votre code (lisible par un programmeur) et en code
	au langage machine donc qui peut être exécuté directement sur votre machine.

Librairie
	Une librairie est un paquet de fonctions regroupés dans un ensemble appelé librairie. On y ajoute
	aussi des constantes et des nouveaux types.

man
	:code:`man` est une instruction en shell, que vous tappez dans votre terminal et qui vous donne
	des informations sur une commande.

	De nombreuses fonctions C sont répertoiriées dans le manuel, donc vous pouvez généralement
	tapper :code:`man 3 fread` (3 car les fonctions f... sont à la page 3, mais généralement
	vous ne mettez rien. Les fonctions système sont à la page 2).

ASCII
	Tous les caractères (a, b, ..., ?, !, <espace>, <saut de ligne>, ...) sont représentés
	en machine par un code hexadécimal (en base 16). La table ASCII est le tout premier
	jeu de caractères crée contenant 256 caractères (codes de 0 à 255).

Unicode
	La table ASCII ne contenant pas tous les caractères, la tables unicode a été crée.
	Il en existe 3 versions : 8 bits, 16 bits et 32 bits. C'est la version sur 8 bits la plus
	utilisée (UTF-8) car elle est petite et contient déjà tous les caractères nécessaires au quotidien.

