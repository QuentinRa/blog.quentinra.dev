=====================================
1. PARTIEL MTG 2021 ENSIIE
=====================================

Exercice 1 — Ordonnancement - 8 points
=======================================

La société Vinci a remporté un appel d’offre international pour la réalisation d’une méga
usine de fabrication de vaccin contre le Covid-19 pour le compte de Pfizer pour que celle-ci
puisse répondre à la demande mondiale. Le devis a été réalisé grâce à l’emploi de méthode
d’ordonnancement potentiel tâche.

.. image:: /assets/math/graph/annales/p/partiel_1.png

1.
	Tracer le graphe des taches associé à la table des données décrite ci-dessous (les cases
	coût, allégement du coût et durée maximale n’interviennent pas pour le moment).

2.
	Mentionnée dans le graphes des taches la date de début au plus tôt et la date de début
	au plus tard de chaque tache.

3. En déduire la durée optimale du projet.

4. Calculer la marge totale et la marge libre de chaque tâche.

5. Identifier les taches critiques ainsi que le (ou les) chemin(s) critique(s).

6. Quel est le montant du devis ?

7.
	Alors que tout semblait conclu, le client de la société Vinci exige brusquement une réduction de prix de 45 millions d’euro et le maintien de la durée du chantier à la durée
	trouvée précédemment. L’état major de la société Vinci connaît les possibilités de diminution des coûts et d’allongement des tâches. En effet, on peut concevoir de ralentir la
	durée d’exécution des tâches en diminuant les moyens mis en œuvre, du moins jusqu’à
	une durée plafond au delà de laquelle la société Vinci refuse d’aller (durée maximale).
	Quelle solution proposez vous ?

Exercice 2 — Arbre couvrant de poids minimum - 7 points
=========================================================

Soit le graphe G = (V, E) suivant :

.. image:: /assets/math/graph/annales/p/partiel_1_2.png

1.
	**Trouver un arbre couvrant de poids minimum du graphe G en utilisant l’algorithme de**
	**Prim vu en cours et en démarrant l’algorithme à partir du sommet a. A chaque itération**
	**expliciter les sommets de l’ensemble S et les arêtes appartenant à l’arbre.**

2.
	**Soient G = (V, E) un graphe et T = (V, A) un arbre couvrant de G. Montrez que si T est**
	**un arbre couvrant de poids minimum, alors au moins une arête de poids minimum de G**
	**appartient à T . Qu’en est-il de la réciproque ?**

----

**On se propose maintenant d’étudier le problème de trouver l’arbre couvrant T de poids**
**maximum : T est toujours couvrant mais cette fois pour tout arbre couvrant T\' le poids de T**
**est supérieur ou égale au poids de T\'.**

3.
	**Est-ce que ce problème est relié au problème de recherche d’arbre couvrant de poids**
	**minimum ? Justifier.**

4.
	**Modifier l’instance (le graphe) donnée en entrée de l’algorithme de Prim pour que celui-ci**
	**calcule un arbre couvrant de poids maximum sans modifier l’algorithme de Prim.**

5.
	**Modifier l’algorithme de Prim pour que celui-ci trouve un arbre couvrant de poids maximum**
	**sans modification de l’instance donnée en entrée de l’algorithme.**

Exercice 3 — Le problème mystère - 5 points
=============================================

Une usine chimique fabrique cinq produits A, B, C, D et E. Le stockage dans un même
entrepôt de certains d’entre eux peut poser des problèmes. Le tableau suivant indique les
incompatibilités de stockage. La lettre \"i\" signifie incompatible.

.. image:: /assets/math/graph/annales/p/partiel_1_3.png

1. **Modéliser cette situation à l’aide d’un graphe G non-orienté.**

2.
	**L’entreprise cherche à minimiser le nombre d’entrepôts nécessaires au stockage de ces**
	**5 produits. A quel problème de graphe vu en cours correspond cette problématique ?**

3.
	**Grâce à un algorithme donnant une solution optimale vu en cours, trouver quel est**
	**le nombre minimum d’entrepôts nécessaires à cette entreprise. Les graphes résultants de**
	**chaque étape de l’algorithme doivent être explicités.**
