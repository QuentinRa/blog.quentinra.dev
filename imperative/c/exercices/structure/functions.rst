================================
Fonctions
================================

Niveau débutant
***********************

1. Découpage
--------------------

Écrivez le programme correspondant à la session suivante :

.. code:: none

		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? 1

		Hauteur ? 4

		*
		**
		***
		****
		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? 2

		Hauteur ? 5

		*****
		*   *
		*   *
		*   *
		*****
		_______________
		 1) Triangle
		 2) Carré
		 q) Quitter
		Votre choix ? q

		Au revoir...

Définissez une fonction qui affiche un triangle, une fonction qui affiche un carré,
et une fonction qui affiche le menu et renvoie le choix obtenu.

Modifiez la fonction principale pour qu'elle utilise ces trois fonctions.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<functions/d1>

| :code:`[TAG] IUTSF APL S1 TP13 2019`

2. Miroir
---------------

Écrivez un programme qui déclare un tableau de 10 cases de type int, puis le remplit
avec des valeurs choisies aléatoirement entre -50 et 50, et enfin affiche le contenu du tableau.

.. code:: none

		./a.out
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+
		|  12 |   0 | -49 |  35 |   8 |  -2 |  50 |  33 | -40 |  -1 |
		+-----+-----+-----+-----+-----+-----+-----+-----+-----+-----+

Modifiez le programme du premier exercice pour qu'il inverse l'ordre des valeurs du tableau.
Vous afficherez le tableau avant et après inversion pour vérifier votre travail.

Définissez une fonction qui affiche le tableau, une fonction qui le remplit
de valeurs aléatoires, et une fonction qui inverse le tableau.

Modifiez la fonction principale pour qu'elle utilise ces trois fonctions.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<functions/d2>

| :code:`[TAG] IUTSF APL S1 TP13 2019`

3. Zéro
---------------

Voici une fonction qui met une variable à zéro, dans un programme qui
illustre son usage :

.. code:: c

		void zero(double a) {
			a = 0.0;
		}

		int main(void) {
			double x=37.5;
			printf("avant : %f\n", x);
			zero(x);
			printf("après : %f\n", x);
			return EXIT_SUCCESS;
		}

Testez cet exemple. Est-ce que la fonction fait son travail ?
Pouvez-vous expliquer pourquoi ? Modifiez la définition de la fonction et
son appel pour que cela marche comme prévu.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<functions/d3>

| :code:`[TAG] IUTSF APL S1 TP13 2019`

4. Échange
---------------

Écrivez une fonction qui intervertit les valeurs de deux variables.
Servez-vous en pour simplifier la fonction d'inversion du deuxième exercice.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<functions/d4>

| :code:`[TAG] IUTSF APL S1 TP13 2019`

5. Produit
---------------

Écrivez un programme qui prend un nombre quelconque d'entiers sur la ligne
de commande et affiche leur produit. On souhaite que les arguments qui ne
sont pas des entiers soient ignorés. Lisez la page manuelle de la
fonction strtol et servez-vous en pour repérer les arguments
inutilisables.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<functions/d5>

| :code:`[TAG] IUTSF APL S1 TP13 2019`

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