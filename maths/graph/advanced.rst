.. _graph_advanced:

================================
Théorie des graphes - avancé
================================

| :math:`\color{grey}{Version \ 1.0.2}`
| :math:`\color{grey}{Dernière \ édition \ le \ 16/11/2020}`

.. warning::

	Il s'agit de la partie avancée du cours sur les graphes (:ref:`graph`).

1. Noyau et base de cycles
======================================

1.1. Noyau
*********************

Stabilité
	Un ensemble stable S est un sous-ensemble tel que les sommets de l'ensemble ne sont jamais
	voisins.

	Stable maximal : on ajoute un sommet et il n'est plus stable

	Stable maximum : on ne peut pas créer d'ensemble S plus grand. On note :math:`\alpha (G) = card(stable\ maximum)`

	Soit h le degré maximal et n le nombre de sommets, :math:`|Stable\ maximal| \ge \lceil \frac{n}{h+1} \rceil`.

Partitionnement
	On peut partitionner un graphe en cliques. Une partition

		* est un ensemble de cliques
		* tous les sommets doivent être dans une clique
		* les sommets doivent être présent dans exactement une clique

	:math:`|S| \le |P|`. Si :math:`|S| = |P|` alors S est stable maximum et P une partition minimum.

Ensemble absorbant
	Une ensemble A absorbant est un ensemble tel que tout sommet qui
	n'est pas dans l'ensemble est un successeur d'un sommet dans A.

	:math:`\beta (G) = card(plus\ grand\ ensemble\ absorbant)`

Noyau
	Sous-ensemble stable et absorbant.

	Un graphe peut avoir 0,1 ou plusieurs noyaux.

Fonction de grundy
	Soit un graphe orienté, la fonction de grundy g(v) retourne le plus petit
	entier non attribué aux successeurs de v.

	Tous les sommets ayant comme valeur 0 sont censés composer le noyau (vérifiez!).

	Il est recommandé de partir d'un sommet qui n'a pas de prédécesseur,
	car il fait forcément parti du noyau.

1.2. base de cycles
*********************

Base de cycles
	On considère l'ensemble des arrêtes V ordonné. On note chaque cycle
	est comme un ensemble qui associe à chaque arrête une valeur : 0,1,-1.

		* 0 : si le cycle ne parcours par l'arrête
		* 1 : si le cycle parcours l'arrête dans le bon sens
		* -1 : si le cycle parcours l'arrête dans le sens inverse

	On note un cycle :math:`C_n = (0, ...,1,-1)`

	Une base de cycles B est un ensemble de cycles, tels
	que la base de cycles est libre et génératrice.

	On note :math:`\mu(G)` (mu) le nombre d'éléments d'une base de cycle,
	appelé nombre cyclomatique. :math:`\mu(μ(G) = m − n + p` avec n sommets m arcs et p composantes
	connexes.

Base de cocycles
	On appelle cocycle de A, l'ensemble des arcs incidents à A,
	noté :math:`\omega{(A)}`. On associe à chaque arc une valeur

  	* 0 : si le cocycle ne parcours par l'arrête
  	* 1 : si le cocycle parcours l'arrête dans le bon sens
  	* -1 : si le cocycle parcours l'arrête dans le sens inverse

  .. hint::

   	En gros il faut que les sommets du cocycles soit incidents à tous les autres

  Une base de cycle est un ensemble de cocycles, tel que la base
  soit libre et génératrice.

	On note :math:`\gamma(G)` (gamma) le nombre d'éléments d'une base de cocycle,
	appelé nombre cocyclomatique. :math:`\gamma(μ(G) = n - p` avec n sommets et p composantes
	connexes.

.. _ordonnancement_graph:

2. Ordonnancement
======================================

On dispose de

	* tâches à effectuer
	* certaines tâches dépendent de d'autre tâches
	* les tâches prennent un durée à s'effectuer donnée
	* on ne prends pas en compte le fait que certaines tâches ne peuvent pas se faire en même temps (problème de ressources etc...).
	* on ne prends pas en compte le fait si certaines tâches doivent être effectuée avant (ou commencée après) un certain moment

L'ordonnancement permet de trouver le moyen les plus efficace d'ordonner les tâches afin d'obtenir
un résultats en une durée optimale.

Les données traités sont généralement sous la forme d'un tableaux avec tâches, tâches dépendantes et durée.

Coût optimal
	La chaine ayant le plus haut coût.

Marges
	| **totale** : Retard possible pouvant être pris sur une tâche sans affecter le coût optimal.
	| :code:`calcul` : début max-début min
	| **libre** : marge totale mais sans modifier les dates de début des tâches suivantes
	| :code:`calcul` : pour chaque sommet, on regarde de combien on peut augmenter le début sans que début+cout > début des suivants
	| **certaine** : marge libre mais en considérant que toutes les tâches ont commencé au plus tard
	| :code:`calcul` : a est la marge libre si début max de i-(début max+coût prédécesseur) >= a > 0 pour tout prédécesseur de i

Tâche critique et chaine critique
	Une tâche est critique si ça date de début et sa date maximale de début sont la même.

	Une chaine critique est une chaine de tâches critiques.

Déterminer la date au plus tôt
	La date au plus tôt du premier est zéro. La date au plus tôt de n'importe quel sommet
	est le plus grand coût parmi la somme des (date au plus tôt + coût) des prédécesseurs.

Déterminer la date au plus tard
	On part de la fin, sa date au plus tard est sa date au plus tôt. La date au plus tard
	est le minimum parmi (date au plus tôt du sommet actuel - coût du prédécesseur).

Il existe deux méthodes qui dépendant dont l'efficacité varie selon votre projet

.. toctree::
			:maxdepth: 1

				Méthode Potentiel-tâches       <ordonnancement/mpt>
				Méthode P.E.R.T.               <ordonnancement/pert>

3. Exercices
==============

.. toctree::
    :name: exercices
    :maxdepth: 1

		Stabilité                       <exercices/stable>
		Fonction de Grundy              <exercices/grundy>
		Bases de cycles et cocycles     <exercices/bases>
		Non triés                       <exercices/non_rank>

------

**Crédits**
	* Massimissa MERABET (enseignant à l'ENSIIE)
	* Quentin Ramsamy--Ageorges (étudiant à l'ENSIIE)

**Références**
	* https://fr.wikipedia.org/wiki/Lexique_de_la_th%C3%A9orie_des_graphes
	* http://atomurl.net/math/
	* https://fr.wikiversity.org/wiki/Th%C3%A9orie_des_graphes/Propri%C3%A9t%C3%A9s
	* https://fr.wikipedia.org/wiki/Th%C3%A9orie_spectrale_des_graphes