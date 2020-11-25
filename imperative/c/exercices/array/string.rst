================================
Chaines de caractères
================================

Niveau débutant
***********************

1. Lecture
----------------

Écrivez un programme qui demande à l'utilisateur de taper un mot de passe
(ne faisant pas plus de 26 caractères) et indique ensuite si
l'authentification a réussi.

Vous ne devrez pour cela utiliser ni scanf ni fgets.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d1>

| :code:`[TAG] IUTSF APL S1 TP12 2019`

2. Statistiques
----------------

Écrivez un programme qui lit une ligne de texte (ne dépassant pas 200
caractères) et la stocke dans une chaîne de caractères, puis affiche :

	* le nombre de 'e' qu'elle contient,
	* le nombre de caractères différents qu'elle contient.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d2>

| :code:`[TAG] IUTSF APL S1 TP12 2019`

3. Initiales
----------------

Écrivez un programme qui affiche la première lettre de chacun de
ses arguments.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d3>

| :code:`[TAG] IUTSF APL S1 TP12 2019`

4. Multiplication
--------------------

Écrivez un programme qui affiche le produit de ses deux premiers arguments
(on suppose que ce sont des entiers).

Que donne le programme quand un des arguments n'est pas un entier ?
Quand un des arguments est manquant ? Pouvez-vous améliorer le programme
pour qu'il gère ces situations ?

5. Miroir
--------------------

Écrivez un programme qui affiche sa propre ligne de commande, mais en
inversant l'ordre des caractères :

.. code:: none

		bob@box:~$ ./a.out toto 456
		654 otot tuo.a/.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d5>

| :code:`[TAG] IUTSF APL S1 TP12 2019`

6. Truandage
--------------------

Qu'affiche le programme suivant ?

.. code:: c

		int main(void) {
			long long int n = 32217268732456802LL;
			printf("%s\n", &n);
			return EXIT_SUCCESS;
		}

Comment faire pour calculer la valeur qu'il faudrait donner à n pour qu'il
affiche bonsoir ? Commencez par afficher n en hexadécimal.
Voyez-vous les lettres ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d6>

| :code:`[TAG] IUTSF APL S1 TP12 2019`

7. Custom string.h
---------------------------------

1. Écrire une fonction qui retourne la longueur d'une chaîne de caractère, vue comme un tableau.
2. Écrire une fonction qui sur la donnée d'une chaîne de caractères retourne une copie de cette chaîne.
3. Écrire une fonction qui sur la donnée de deux chaînes de caractères retourne la concaténation de ces chaînes. (Exemple : avec "coucou" et "toto", retourne "coucoutoto".)
4. Écrire une fonction qui sur la donnée d'une chaîne de caractères et de deux indices i et j, retourne une copie de la sous-chaîne comprise entre l'indice i inclus et j non-inclus. Penser à bien renseigner les préconditions de la fonction !
5. Écrire une fonction qui sur la donnée d'un caractère sep et d'une chaîne s, retourne un tableau contenant les sous-chaînes de s délimitées par sep. Par exemple, pour sep = ';' et s = "ab;cde;;f;g hi", cette fonction retourne une tableau de taille 5 contenant les chaînes "ab" "cde" "" "f" et "g hi". [#2]_
6. Écrire une fonction qui sur la donnée d'une chaîne de caractère s et d'un caractère c retourne l'adresse de la première occurrence de c dans s, ou NULL si c n'est pas présent dans s.

.. [#2] NB : en pratique, pour pouvoir utiliser une telle fonction, il faudrait soit retourner également sa taille (avec un enregistrement, ou dans un paramètre supplémentaire passé par référence), ou alors ajouter une case supplémentaire contenant l'adresse NULL marquant la fin du tableau.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<string/d7>

| :code:`[TAG] ENSIIE IPI S1 TP5 2020`

Niveau supérieur
***********************

aucun

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Luc HERNANDEZ (enseignant à l'IUT de Sénart-Fontainebleau)