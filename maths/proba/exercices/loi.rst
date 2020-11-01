================================
Loi de probabilité
================================

Niveau débutant
***********************

1/3 - Application numérique
----------------------------

Connaissant la fonction de densité discrète :math:`f(x) = \frac{e^{-1}}{x!}, x = 0,1, 2...`.

1. \
	Déterminer P(X=2),

2. \
	Calculer P(X < 2),

3. \
	Démontrer que :math:`e^{-1}` est la constante pour laquelle la fonction c=x! est une densité de probabilité.

4. \
	A quelle condition portant sur :math:`\alpha`

	.. math::

		p_n = \alpha * \frac{\lambda^n}{n!} \ n \ge 0

	sont-ils les coefficients d’une loi de probabilité, pour :math:`\lambda > 0` ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<loi/d1>

2/3 - Série exponentielle
------------------------------------

Soit a un réel non nul. On considère la suite (:math:`u_n`) définie par :

.. math::

	\forall n \in \mathbb{N}, u_n = \frac{1}{8} * \frac{2+a^n}{n!}

Pour quelle valeur du réel a, la suite (:math:`u_n`) définit-elle bien une loi de probabilité ?

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<loi/d2>

3/3 Application numérique
------------------------------------------------

On considère une urne contenant une boule blanche et deux boules noires identiques. On effectue deux
tirages successifs dans cette urne, la première boule tirée étant remplacée par une boule de couleur
différente.

On demande de construire l’ensemble fondamental associé à cette épreuve aléatoire, si l’on
tient compte de l’ordre des tirages, et de déterminer la probabilité de chacun des évènements élémentaires.

En déduire la loi de probabilité de la variable aléatoire X qui représente le nombre de boules noires tirées.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<loi/d3>

Niveau supérieur
***********************

1/2 - Loi conditionnelle
-------------------------------------

Dans une urne, on place n boules portant des numéros 2 à 2 distincts.

Un premier joueur effectue des tirages d’une boule sans remise jusqu’à ce qu’il obtienne la boule portant
le plus grand numéro.

On note :math:`X_1` le nombre de tirages effectués par ce joueur.
S’il reste des boules dans l’urne, un second joueur effectue la même expérience sur les boules restantes.

On note :math:`X_2` le nombre de tirages effectués par ce second joueur.

1. \
	Déterminer la loi de probabilité de :math:`X_1`,

2. \
	Déterminer la loi de probabilité de :math:`X_2`, conditionnée par :math:`X_1`.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<loi/s1>

2/2 - Tirage de boules
-----------------------------------

Une urne contient n boules blanches et n boules noires. On tire les boules au hasard et sans remise jusqu’à
ce que l’on ait tiré la dernière boule blanche. Soit k le nombre total de boules tirées

1. \
	Déterminer la loi de probabilité de k,

2. \
	En déduire la valeur de la somme.

	.. math::

		Sn = \sum_{k=n}^{k=2n} \frac{(k-1)!}{(k-n)!}

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<loi/s2>

Niveau avancé
***********************

aucun

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)