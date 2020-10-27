================================
Exercices non triés
================================

Exercice 1- Dénombrement
--------------------------

Un jeu de cartes comprend 32 cartes. On distribue au hasard 5 cartes à chacun des 2 joueurs X et Y

| 1. Calculer la probabilité que X ait au moins 1 as.
| 2. Sachant que Y a exactement un as, calculer la probabilité que X ait au moins un as.

.. toctree::
   :maxdepth: 1

	Proposition de correction n°1			<non_rank/e1>

Exercice 2- Probabilités conditionnelles
----------------------------------------------------

Un sac contient 7 billes rouges, 5 billes blanches et 3 billes noires. Trois billes sont tirées successivement.
Quelle est la probabilité pour que la première bille tirée soit rouge, la deuxième blanche, la troisième
noire si chaque bille est :

| 1. remise dans le sac après tirage,
| 2. non remise dans le sac.

Exercice 3- Probabilités conditionnelles
----------------------------------------------------

Un candidat doit tirer 3 questions à l’oral sur les 22 préparées par l’examinateur, comprenant :
	* 10 questions d’algèbre,
	* 7 questions de trigonométrie,
	* 5 questions d’arithmétique.

Le candidat tire successivement les trois questions sans remettre dans le tas une question qu’il a tirée.

| 1. Quelle est la probabilité pour que les trois questions soient des questions d’algèbre ?
|
	2. Quelle est la probabilité de tirer, dans l’ordre, une question d’algèbre,une question de trigonométrie,
	une question d’arithmétique ?

Exercice 4- Probabilités conditionnelles
----------------------------------------------------

On considère 3 urnes U1, U2,U3. La première contient initialement 2 boules blanches et 3 boules rouges.
La deuxième contient 2 boules vertes et 4 boules blanches. La troisième contient 5 boules noires et 2
boules rouges.

On tire au hasard une boule dans l’urne U1 que l’on place dans l’urne U2. Puis on tire au
hasard une boule dans l’urne U2 que l’on place dans l’urne U3 . Enfin on tire une boule dans l’urne U3.

Quelle est la probabilité pour que les boules tirées soient toutes de couleurs différentes ?

Exercice 5- Probabilités conditionnelles
----------------------------------------------------

On cherche une lettre qui a la probabilité p de se trouver dans l’un des 4 tiroirs d’un secrétaire. Quelle
est la probabilité qu’elle se trouve dans le quatrième tiroir, sachant que l’on ne l’a pas trouvée dans les
trois premiers ?

Exercice 6- Théorème de Bayes
--------------------------------

Un voyageur arrive à un carrefour. Il sait qu’à cet endroit il va trouver 2 routes : une impasse et la bonne
route. Il y a 3 personnes à ce carrefour : B1, B2 et B3.

	* B1 dit une fois sur dix la vérité,
	* B2 dit cinq fois sur dix la vérité,
	* B3 dit neuf fois sur dix la vérité.

Il n’y a pas d’autre personne à ce carrefour.

Le voyageur s’adresse à une et une seule de ces personnes. Il demande son chemin et s’aperçoit que ce
chemin est le bon. Quelle est la probabilité qu’il se soit adressé à B1

Exercice 7- Théorème de Bayes
---------------------------------------

Pour dépister une maladie, on applique un test. Si le patient est effectivement atteint, le test donne un
résultat positif dans 96 % des cas. Mais il se peut aussi que le résultat du test soit positif alors que le
patient est en bonne santé, et ceci se produit dans 2 % des cas.

|
	1. Sachant qu’en moyenne 0.05 % des patients sont atteints de la maladie à dépister, calculer la
	probabilité pour qu’un client soit atteint sachant que son test a été positif.

|
	2. Sous les mêmes conditions calculer la probabilité pour qu’un client soit atteint sachant que deux
	tests (indépendants) ont été positifs.

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