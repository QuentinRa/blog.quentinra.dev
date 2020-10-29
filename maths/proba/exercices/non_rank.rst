================================
Exercices non triés
================================

Exercice 8 - Récurrence
---------------------------------------

Deux joueurs A et B lancent deux dés parfaits à tour de rôle et c’est A qui commence. Il sera gagnant
s’il obtient un total de 6 lors d’un lancer, auquel cas le jeu est fini, sinon c’est au tour de B. B gagne et
le jeu se termine s’il obtient un total de 7, sinon A rejoue. A quel joueur le jeu est-il profitable ?

Un centre de production fabrique des puces électroniques dont certaines peuvent être défectueuses. Au
bout de la chaîne de fabrication des puces, celles-ci sont contrôlées par un testeur électronique.

Exercice 9 - Examen 2007
---------------------------------------

Malheureusement, à ce stade de la fabrication, avant la soudure des connexions et la mise en boîtier,
il n’est pas possible de réaliser un test exhaustif. En conséquence, une puce mauvaise est déclarée mauvaise
par le testeur avec une probabilité :math:`\beta \lt 1`.

Qui plus est, une puce bonne n’est déclarée
bonne par le testeur qu’avec une probabilité :math:`\gamma \le 1`. Le responsable de l’atelier des puces ne connaît pas la probabilité
qu’une puce soit mauvaise.

On définit les évènements suivants :

		- :math:`P(C_1)` = la puce est bonne,
		- :math:`P(C_0)` = la puce est mauvaise,
		- :math:`P(T_1)` = la puce est déclarée bonne par le testeur,
		- :math:`P(T_0)` = la puce est déclarée mauvaise par le testeur.

Question 1
		*
			1.1 Exprimer :math:`P(C_0)`, :math:`P(T_0=C_0)`, :math:`P(T_1=C_1)`,
			:math:`P(T_0=C_1)`, :math:`P(C_1)` en fonction de :math:`\alpha, \beta,\gamma`.
		* 1.2 En déduire la probabilité qu’une puce soit déclarée mauvaise par le testeur.
		*
			1.3 Application : des études antérieures ont montré que, pour le testeur
			utilisé, :math:`\beta` = 0.9 et :math:`\gamma` = 0.95.

			Représenter graphiquement :math:`P(T_0)` en fonction de :math:`\alpha`
			et interpréter les résultats pour :math:`\alpha = 0` et :math:`\alpha = 1`.

Question2
	*
		2.1 Exprimer en fonction de :math:`\alpha, \beta, \gamma` la probabilité qu’une puce déclarée mauvaise par
		le testeur soit réellement mauvaise.
	* 2.2 En déduire la probabilité qu’une puce déclarée mauvaise par le testeur soit bonne.
	*
		2.3 Application : :math:`\beta` = 0.9 et :math:`\gamma` = 0.95. Représenter graphiquement les deux probabilités précédentes
		en fonction de :math:`\alpha` et interpréter.

Question 3
		Exprimer la probabilité qu’une puce déclarée bonne par le testeur soit mauvaise. (Remarque : le
		rapport :math:`R = \frac{P(C_0)}{P(C_0/T_1)}` peut servir à exprimer l’efficacité du testeur.)

Exercice 10 - Le problème de Chicago - Examen 2008
------------------------------------------------------------

1. Dans une salle de danse, il y a n couples mariés et pas de célibataires. Les danseurs choisissent
chacun une danseuse au hasard. Quelle est la probabilité pour que chacun danse avec sa femme ?

2. Après la danse, chaque personne va s’assoir au hasard sur l’une des 2n chaises qui sont dans la salle.
Or ces chaises sont disposés par paires, chaque paire associée à une table pour deux. Quelle est la
probabilité pour que chaque mari soit assis en face de sa femme ?

3. On reprend une nouvelle danse dans les conditions de la question 1. Quelle est la probabilité pour
qu’aucun mari ne danse avec sa femme ? Quelle est la limite de cette probabilité quand n augmente
indéfiniment ?

|

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)