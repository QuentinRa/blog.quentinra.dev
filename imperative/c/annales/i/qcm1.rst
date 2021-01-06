=====================================
1. QCM 2020 ENSIIE (1h30)
=====================================

Un projet est découpé en quatre modules Heavy_client, Web_app, Network et Core, organisés de la façon suivante :
– Heavy_client dépend de l’interface de Core ;
– Web_app dépend des interfaces de Network et Core ;
– chaque module dépend de sa propre interface.

On obtient le programme heavy_client en combinant les modules Heavy_client et Core,
et le programme web_app en combinant les modules Web_app, Network et Core.

En supposant qu'on n'a pas écrit de Makefile, parmi les réponses suivantes,
la ou lesquelles permettent-elles de compiler le moduleHeavy_client ?

	* gcc -Wall -o Heavy_client.o Heavy_client.c
	* gcc -Wall -c Heavy_client.c Heavy_client.h
	* gcc -Wall -c Heavy_client.c Heavy_client.h Core.h
	* Aucune de ces réponses.
	* gcc -c -Wall Heavy_client.c
	* gcc -Wall -c -o Heavy_client.c Heavy_client.o
	* gcc -Wall -c -o Heavy_client.o Heavy_client.c
	* gcc -Wall -c Heavy_client.c Core.c
	* gcc -Wall -o -c Heavy_client.o Heavy_client.c
	* gcc -Wall -c Heavy_client.c

En supposant que tous les modules nécessaires ont été compilés, toujours sans Makefile,
quelle commande faut-il taper pour créer le programme web_app (plusieurs réponses potentiellement possibles) ?

	* gcc -Wall -o web_app Web_app.o
	* gcc -Wall -o web_app Core.h Network.h Web_app.o
	* gcc -o -Wall web_app Web_app.o Core.o Network.o
	* Aucune de ces réponses.
	* gcc -Wall -o web_app Core.o Network.o Heavy_client.o Web_app.o
	* gcc -Wall Core.o Network.o Web_app.o -o web_app
	* gcc -Wall -o web_app -c Web_app.o Core.o Network.o
	* gcc -Wall -o web_app Network.o Web_app.o
	* gcc -Wall -o web_app Web_app.o Core.o Network.o

On modifie le module Core sans changer son interface, quel(s) module(s) faut-il recompiler ?

	* Web_app
	* Core
	* Network
	* Aucun
	* Heavy_client

On modifie l’interface du module Network, quel(s) module(s) faut-il recompiler ?

	* Web_app
	* Core
	* Network
	* Aucun
	* Heavy_client

Parmi les lignes suivantes, la ou lesquelles décrivent-elles correctement les dépendances de Web_app.o dans un Makefile ?

	* Web_app.c: Web_app.o Web_app.h Network.h Core.h
	* Web_app.o: Web_app.c Network.o Core.o
	* Web_app.o: Web_app.c Network.c Core.c
	* Web_app.o: Web_app.c Network.h Core.h
	* Web_app.o: Web_app.c Web_app.h Network.h Core.h
	* Aucune de ces réponses.
	* Web_app.o: Web_app.h Heavy_client.h Network.h Core.h
	* Web_app.o: Web_app.h Network.h Core.h

Étude de fonctions
==========================

.. code:: c

		/* Ce fichier ne contient volontairement pas les include
			 nécessaires pour le compiler sans erreur */

		/* On suppose les listes chaînées définies comme vu en cours */
		void add(value v, list *l) {
			*l = malloc(sizeof (struct bucket));
			if (*l == NULL) {
				fprintf(stderr, "Cannot allocate memory.\n");
				exit(2);
			}
			(*l)->val = v;
			(*l)->next = *l;
		}


		void print_coucou() {
			char t[7] = { 'c', 'o', 'u', 'c', 'o', 'u', 0 };
			printf("%i", t[7]);
		}


		int dichotomic_search(int e, int t[], int s) {
			int low, up, m;
			low = 0;
			up = s - 1;
			while (low < up) {
				m = (low + up) / 2;
				if (t[m] == e)
					return 1;
				else if (t[m] > e)
					up = m - 1;
				else
					low = m + 1;
			}
			return 0;
		}


		double approx_inverse(int x, int precision) {
			double den = x / precision;
			double num = 1 / precision;
			return num / den;
		}


		void add_last(value v, list l) {
			while (l != NULL)
				l = l->next;
			l = cons(v, l);
		}

L'appel de fonction approx_inverse(2, 10) retourne -nan. Pourquoi ?

	* Il y a une erreur de conversion de type.
	* Aucune de ces réponses.
	* Il y a une division par 0 à la troisième ligne.
	* Il y a une division par 0 à la deuxième ligne.
	* Le nombre calculé est trop petit pour être représenté par un flottant.
	* Il y a une division par 0 à la première ligne.

La fonction dichotomic_search est censée retourner 1 si e est un élément du tableau t de taille s, 0 sinon.
Elle est incorrecte, mais il suffit de modifier une seule ligne pour la rendre correcte. Laquelle ?

	* int low, up, m;
	* low = 0;
	* up = s - 1;
	* while (low < up) {
	* m = (low + up) / 2;
	* if (t[m] == e)
	* return 1;
	* else if (t[m] > e)
	* up = m - 1;
	* else
	* low = m + 1;
	* }
	* return 0;

Que peut afficher la fonction print_coucou ?

	* Obi-Wan Kenobi
	* Il y aura une erreur de segmentation.
	* Aucune de ces réponses.
	* -96
	* 42
	* Le caractère de code ASCII 0
	* 48

Que se passera-t-il si on appelle add_last(42, l)
alors que l contient la valeur NULL ?

	* La liste l pointera sur un maillon contenant 42 dans le champ val et NULL dans le champ next.
	* Il y aura une liste cyclique.
	* Il y aura une erreur de segmentation.
	* Il y aura une fuite mémoire.
	* Le programme affichera « Obi-Wan Kenobi ».
	* Rien du tout.

Quel(s) problème(s) la procédure add va-t-elle créer ?

	* La taille allouée ne sera pas correcte.
	* Il y a une erreur de conversion de type.
	* Il y a une division par 0.
	* Il y aura potentiellement une erreur de segmentation.
	* Il y aura une liste cyclique.
	* La fonction add ne va pas créer de problème.
	* La liste passée en paramètre ne sera pas modifiée.
	* Il y aura potentiellement une fuite mémoire.