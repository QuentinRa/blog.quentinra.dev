=====================================
1. PARTIEL MTG 2021 ENSIIE
=====================================

Quentin RAMSAMY--AGEORGES

Exercice 1 — Ordonnancement - 8 points
=======================================

La société Vinci a remporté un appel d’offre international pour la réalisation d’une méga
usine de fabrication de vaccin contre le Covid-19 pour le compte de Pfizer pour que celle-ci
puisse répondre à la demande mondiale. Le devis a été réalisé grâce à l’emploi de méthode
d’ordonnancement potentiel tâche.

.. image:: /assets/math/graph/annales/c/rep/partiel_1.png

1.
	Tracer le graphe des taches associé à la table des données décrite ci-dessous (les cases
	coût, allégement du coût et durée maximale n’interviennent pas pour le moment).

2.
	Mentionnée dans le graphes des taches la date de début au plus tôt et la date de début
	au plus tard de chaque tache.

4. Calculer la marge totale et la marge libre de chaque tâche.

.. uml::

		class Début {
			{field} début min: 0
			{field} début max: 0
			{method} marge libre : 0
			{method} marge totale : 0
		}
		class TacheA {
			{field} début min: 0
			{field} début max: 0
			{method} marge libre : 0
			{method} marge totale : 0
		}
		class TacheB {
			{field} début min: 4
			{field} début max: 4
			{method} marge libre : 0
			{method} marge totale : 0
		}
		class TacheC {
			{field} début min: 0
			{field} début max: 6
			{method} marge libre : 6
			{method} marge totale : 6
		}
		class TacheD {
			{field} début min: 0
			{field} début max: 12
			{method} marge libre : 0
			{method} marge totale : 12
		}
		class TacheE {
			{field} début min: 4
			{field} début max: 27
			{method} marge libre : 23
			{method} marge totale : 23
		}
		class TacheF {
			{field} début min: 10
			{field} début max: 10
			{method} marge libre : 0
			{method} marge totale : 0
		}
		class TacheG {
			{field} début min: 4
			{field} début max: 17
			{method} marge libre : 1
			{method} marge totale : 13
		}
		class TacheH {
			{field} début min: 12
			{field} début max: 24
			{method} marge libre : 12
			{method} marge totale : 12
		}
		class TacheI {
			{field} début min: 34
			{field} début max: 34
			{method} marge libre : 0
			{method} marge totale : 0
		}
		class Fin {
			{field} début min: 37
			{field} début max: 37
			{method} marge libre : 0
			{method} marge totale : 0
		}

		Début --> TacheA : 0
		Début --> TacheC : 0
		Début --> TacheD : 0

		TacheA --> TacheB : 4
		TacheA --> TacheG : 4

		TacheB --> TacheF : 6

		TacheC --> TacheE : 4
		TacheC --> TacheF : 4

		TacheD --> TacheH : 12

		TacheF --> TacheI : 24

		TacheG --> TacheH : 7

		TacheH --> TacheI : 10

		TacheE --> Fin : 10
		TacheI --> Fin : 3

		hide class circle

3. En déduire la durée optimale du projet.

La durée optimale est de 37 semaines.

5. Identifier les taches critiques ainsi que le (ou les) chemin(s) critique(s).

Les taches critiques sont Début, A, B, F, I, Fin
et on a un seul chemin critique : (Début, A, B, F, I, Fin).

6. Quel est le montant du devis ?

15+11+12+50+50+120+18+40+12=328 M€.

7.
	Alors que tout semblait conclu, le client de la société Vinci exige brusquement une réduction de prix de 45 millions d’euro et le maintien de la durée du chantier à la durée
	trouvée précédemment. L’état major de la société Vinci connaît les possibilités de diminution des coûts et d’allongement des tâches. En effet, on peut concevoir de ralentir la
	durée d’exécution des tâches en diminuant les moyens mis en œuvre, du moins jusqu’à
	une durée plafond au delà de laquelle la société Vinci refuse d’aller (durée maximale).
	Quelle solution proposez vous ?

| On peut ralentir C de 3 mois (-6M€).
| On peut ralentir D de 6 mois (-15M€).
| On peut ralentir G de 4 mois (-16M€).
| On peut ralentir E de 4 mois (-6M€).
| On peut ralentir H de 1 mois (-2M€).
| On obtient donc une réduction de 45 M€ des coûts.

J'ai pris des tâches pouvant être retardés tout en veillant a ce que les durée
maximales ne soient pas dépassées et les marges totales non plus.

Pour trouver ces tâches, j'ai pris les durées possible pour chaque tache (pour c, on peut prendre
un nombre inférieur à 3 (maximale-durée) et inférieur à 6 (marge), ...) et j'ai testé jusqu'à obtenir
45.

Exercice 2 — Arbre couvrant de poids minimum - 7 points
=========================================================

Soit le graphe G = (V, E) suivant :

.. image:: /assets/math/graph/annales/c/rep/partiel_1_2.png

1.
	**Trouver un arbre couvrant de poids minimum du graphe G en utilisant l’algorithme de**
	**Prim vu en cours et en démarrant l’algorithme à partir du sommet a. A chaque itération**
	**expliciter les sommets de l’ensemble S et les arêtes appartenant à l’arbre.**

| On part de a
| S = {a}
| Plus petite arrête (a,b) donc on l'ajoute (4)
| S = {a,b}
| T = {(a,b)}
| Plus petite arrête (a,h) donc on l'ajoute (8)
| S = {a,b,h}
| T = {(a,b),(a,h)}
| Plus petite arrête (h,g) donc on l'ajoute (1)
| S = {a,b,h,g}
| T = {(a,b),(a,h),(h,g)}
| Plus petite arrête (g,f) donc on l'ajoute (2)
| S = {a,b,h,g,f}
| T = {(a,b),(a,h),(h,g),(g,f)}
| Plus petite arrête (f,c) donc on l'ajoute (4)
| S = {a,b,h,g,f,c}
| T = {(a,b),(a,h),(h,g),(g,f),(f,c)}
| Plus petite arrête (c,i) donc on l'ajoute (2)
| S = {a,b,h,g,f,c,i}
| T = {(a,b),(a,h),(h,g),(g,f),(f,c),(c,i)}
| Plus petite arrête (g,i) mais cycle donc pas ajoutée (6)
| Plus petite arrête (h,i) mais cycle donc pas ajoutée (7)
| Plus petite arrête (c,d) donc on l'ajoute (7)
| S = {a,b,h,g,f,c,i,d}
| T = {(a,b),(a,h),(h,g),(g,f),(f,c),(c,i),(c,d)}
| Plus petite arrête (b,c) mais cycle donc pas ajoutée (8)
| Plus petite arrête (d,e) donc on l'ajoute (9)
| S = {a,b,h,g,f,c,i,d,e}
| T = {(a,b),(a,h),(h,g),(g,f),(f,c),(c,i),(c,d),(d,e)}
| Plus petite arrête (f,e) mais cycle donc pas ajoutée (10)
| Plus petite arrête (b,h) mais cycle donc pas ajoutée (11)
| Plus petite arrête (d,f) mais cycle donc pas ajoutée (14)

| Donc on a
| S = {a,b,h,g,f,c,i,d,e}
| T = {(a,b),(a,h),(h,g),(g,f),(f,c),(c,i),(c,d),(d,e)}

2.
	**Soient G = (V, E) un graphe et T = (V, A) un arbre couvrant de G. Montrez que si T est**
	**un arbre couvrant de poids minimum, alors au moins une arête de poids minimum de G**
	**appartient à T . Qu’en est-il de la réciproque ?**

Si t n'a pas au moins une arrête de poids minimum c'est qu'il n'en a aucune. Or un arbre
couvrant qui n'a aucune arrête de poids minimum n'est pas un arbre couvrant de poids minimum
car il est toujours possible d'obtenir un poids plus petit en utilisant une arête de poids minimum
donc un arbre couvrant de poids minimum a forcément au moins une arête de poids minimum.

La réciproque est fausse, on peut voir que (h,i) de poids 7 est de poids inférieur a (d,e) de
poids 9 pourtant (h,i) n'est pas dans T mais (d,e) est dedans.

----

**On se propose maintenant d’étudier le problème de trouver l’arbre couvrant T de poids**
**maximum : T est toujours couvrant mais cette fois pour tout arbre couvrant T\' le poids de T**
**est supérieur ou égale au poids de T\'.**

3.
	**Est-ce que ce problème est relié au problème de recherche d’arbre couvrant de poids**
	**minimum ? Justifier.**

Ce problème est bien lié au problème de recherche d’arbre couvrant de poids
minimum car il suffit cette fois de faire les mêmes algorithmes mais en prenant l'arête
ayant le plus grand poids.

4.
	**Modifier l’instance (le graphe) donnée en entrée de l’algorithme de Prim pour que celui-ci**
	**calcule un arbre couvrant de poids maximum sans modifier l’algorithme de Prim.**

On retire tous les plus petites arêtes sauf les isthme et on obtient un graphe.

5.
	**Modifier l’algorithme de Prim pour que celui-ci trouve un arbre couvrant de poids maximum**
	**sans modification de l’instance donnée en entrée de l’algorithme.**

| 1: T = (V\', E\') <- (:math:`\emptyset`, :math:`\emptyset`)
| 2: S <- un sommet de G
| 3: Trier les arêtes de G par ordre de poids décroissant
| 4: Pour i allant de 1 à \|V\| − 1 Faire
| 5: Rechercher une arête [a, b] avec a appartient à S et b appartient à S de poids maximum
| 6: T <- T union [a, b]
| 7: S <- S union {b}
| 8: Fin Pour

Exercice 3 — Le problème mystère - 5 points
=============================================

Une usine chimique fabrique cinq produits A, B, C, D et E. Le stockage dans un même
entrepôt de certains d’entre eux peut poser des problèmes. Le tableau suivant indique les
incompatibilités de stockage. La lettre \"i\" signifie incompatible.

.. image:: /assets/math/graph/annales/c/rep/partiel_1_3.png

1. **Modéliser cette situation à l’aide d’un graphe G non-orienté.**

On considère deux sommets voisins s'ils sont incompatible.

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b [arrowhead = none];
		a->c [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		c->d [arrowhead = none];
		c->e [arrowhead = none];
		d->e [arrowhead = none];
	}

2.
	**L’entreprise cherche à minimiser le nombre d’entrepôts nécessaires au stockage de ces**
	**5 produits. A quel problème de graphe vu en cours correspond cette problématique ?**

Il s'agit d'une recherche du nombre de partition pouvant être faites pour grouper
les sommets donc un problème de coloration de graphe.

3.
	**Grâce à un algorithme donnant une solution optimale vu en cours, trouver quel est**
	**le nombre minimum d’entrepôts nécessaires à cette entreprise. Les graphes résultants de**
	**chaque étape de l’algorithme doivent être explicités.**

On applique l'algorithme de reliement-contraction.

Les arêtes manquantes sont [a,d],[a,e], [b,e].

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b [arrowhead = none];
		a->c [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		c->d [arrowhead = none];
		c->e [arrowhead = none];
		d->e [arrowhead = none];
	}

\

On travaille sur a,d

Contraction C1

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ad->b [arrowhead = none];
		ad->c [arrowhead = none];
		b->c [arrowhead = none];
		c->e [arrowhead = none];
		ad->e [arrowhead = none];
	}

\

Reliement R1

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b [arrowhead = none];
		a->c [arrowhead = none];
		a->d [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		c->d [arrowhead = none];
		c->e [arrowhead = none];
		d->e [arrowhead = none];
	}

On travaille sur a,e

On continue Contraction (C1)

Contraction C1-C2 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ade->b [arrowhead = none];
		ade->c [arrowhead = none];
		b->c [arrowhead = none];
	}

\

Reliement C1-R2

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ad->b [arrowhead = none];
		ad->c [arrowhead = none];
		ad->e [arrowhead = none];
		b->c [arrowhead = none];
		c->e [arrowhead = none];
	}

\

On continue Reliement (R1)

Contraction R1-C2 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ae->b [arrowhead = none];
		ae->c [arrowhead = none];
		ae->d [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		c->d [arrowhead = none];
	}

\

Reliement R1-R2

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b [arrowhead = none];
		a->c [arrowhead = none];
		a->d [arrowhead = none];
		a->e [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		c->d [arrowhead = none];
		c->e [arrowhead = none];
		d->e [arrowhead = none];
	}

On travaille sur b,e

On continue Reliement C1-R2

Contraction C1-R2-C3 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ad->be [arrowhead = none];
		ad->c [arrowhead = none];
		be->c [arrowhead = none];
	}

\

Reliement C1-R2-R3 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		ad->b [arrowhead = none];
		ad->c [arrowhead = none];
		ad->e [arrowhead = none];
		b->c [arrowhead = none];
		b->e [arrowhead = none];
		c->e [arrowhead = none];
	}

\


On continue sur Reliement R1-R2

Contraction R1-R2-C3 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->be [arrowhead = none];
		a->c [arrowhead = none];
		a->d [arrowhead = none];
		be->c [arrowhead = none];
		be->d [arrowhead = none];
		c->d [arrowhead = none];
	}

\

Reliement R1-R2-R3 (terminé)

.. graphviz::

	digraph {
		size="10,8";
		rankdir="LR";
		a->b [arrowhead = none];
		a->c [arrowhead = none];
		a->d [arrowhead = none];
		a->e [arrowhead = none];
		b->c [arrowhead = none];
		b->d [arrowhead = none];
		b->e [arrowhead = none];
		c->d [arrowhead = none];
		c->e [arrowhead = none];
		d->e [arrowhead = none];
	}

La plus petite clique est  C1-R2-C3
par exemple (taille 3)
donc

	* entrepot 1 : a et d
	* entrepot 2 : b et e
	* entrepot 3 : c

Il existe d'autre arrangements (voir C1-C2, ...).