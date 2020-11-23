==========================================
Adresses
==========================================

Niveau débutant
***********************

1. Cartographie
------------------

Écrivez un programme qui déclare des variables de type

	*	float
	*	double
	*	long double
	*	char
	*	short int
	*	int
	*	long long unsigned int

puis qui affiche l'adresse de chacune d'entre elles.

Faites le plan de la mémoire comme si c'était une avenue et placez-y les
variables à l'aide des adresses obtenues. Que constatez-vous ?
Faites plusieurs exécutions d'affilée : qu'est-ce qui ne change pas ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<address/d1>

| :code:`[TAG] IUTSF APL S1 TP11 2019`

2. Alphabet
------------------

Sans l'exécuter, prédisez ce que ce programme va afficher :

.. code:: c

		int main(void) {
		 char min, maj;
		 char *p = NULL;

		 for(min = 'a', maj = 'A'; maj <= 'Z'; min++, maj++) {
		  p = (p == &min) ? &maj : &min;
		  putchar(*p);
		 }
		 putchar('\n');
		 return EXIT_SUCCESS;
		}

Une fois votre prédiction couchée par écrit, exécutez ce programme pour
vérifier votre raisonnement.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<address/d2>

| :code:`[TAG] IUTSF APL S1 TP11 2019`

3. Mort-vivant
----------------

Considérez le programme suivant :

.. code:: c

		#include <stdlib.h>
		#include <stdio.h>
		#include <time.h>

		int main(void) {
			int* p;

			if(time(NULL)%2) {
				int x = 59;
				p = &x;
			} else {
				int y = 31;
				p = &y;
			}
			/* fragment inactif
			printf("x=%d\n", x);
			printf("y=%d\n", y);
			*/
			printf("%d\n", *p);
			return EXIT_SUCCESS;
		}

Quelle valeur pensez-vous voir s'afficher ? Dans quelle variable cette valeur
était-elle stockée au moment de l'affichage ? Si vous remettez dans
le programme les instructions en commentaire, que constatez-vous ?
Avez-vous repéré le mort-vivant ?

Remarque Une telle situation est nommée « dangling pointer» (pointeur ballant).
Il faut à tout prix l'éviter, car utiliser de la mémoire non réservée ne
peut amener que des ennuis.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<address/d3>

| :code:`[TAG] IUTSF APL S1 TP11 2019`

4. Conversion
----------------

Voici une façon très étrange d'afficher π :

.. code:: c

		int main(void) {
			long long int n = 4614256656552045848LL;
			double* p = (double*) &n;
			printf("π = %f\n", *p);
			return EXIT_SUCCESS;
		}

Le format %f et le type du pointeur p conduisent printf à penser que la valeur
qui lui est fournie est un double. Il interprète donc les bits qui la
composent (qui sont pourtant les bits de n) comme s'ils décrivaient un réel.
Il ne s'agit pas vraiment d'une conversion mais plutôt d'une réinterprétation.

Quelle valeur faut-il donner à n pour que ce programme affiche 2π ?

Vous pouvez écrire un autre programme pour vous aider à trouver la réponse.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<address/d4>

| :code:`[TAG] IUTSF APL S1 TP11 2019`

5. Étapes
----------------

Considérez (sans l'exécuter) le programme suivant :

.. code:: c

		int main(void) {
		 int a = 1, b = 2, c = 3;
		 int *p, *q;

		 p=&a;
		 q=&c;
		 *p=(*q)++;
		 p=q;
		 q=&b;
		 *p-=*q;
		 ++*q;
		 *p*=*q;
		 a=++*q**p;
		 p=&a;
		 *q=*p/(*q);
		 return EXIT_SUCCESS;
		}

Simulez sur papier le déroulement du programme. Après l'exécution de chaque
instruction, répondez aux questions suivantes :

	* Que contiennent a, b et c ?
	* Vers quoi pointent p et q ?

Vous pouvez tester vos réponses en exécutant réellement le programme, auquel
vous aurez rajouté quelques appels à printf.

Remarque Ce programme est spécifiquement écrit pour vous donner du fil à
retordre. Il n'est absolument pas représentatif de l'usage habituel des
pointeurs.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<address/d5>

| :code:`[TAG] IUTSF APL S1 TP11 2019`

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