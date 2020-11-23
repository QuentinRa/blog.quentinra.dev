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