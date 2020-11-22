================================================================
9. Autres notions - Arguments à la ligne de commande
================================================================

Lors de l'appel de l'exécutable, des arguments peuvent être envoyés
à la fonction main. Le premier argument est toujours le nom de l'exécutable.

.. code:: c

		//argc vaut minimum 1, et contient le nombre d'arguments
		//
		//argv contient les valeurs des arguments, c'est un tableau de chaine de caractères
		//(donc un tableau des tableaux de caractères).
		//la valeur argv[0] contient un tableau avec le nom de l'exécutable
		//par exemple argv[0] donnerais ['.','/','a','.','o','u','t',''].
		//Tous les arguments sont des tableaux de caractères, pour récupérer un nombre,
		//il faut donc le convertir avec les fonctions de strings.h.
		//
		//il est important de vérifier le nombre des arguments avant de les manipuler
		int main(int argc, char *argv[]);