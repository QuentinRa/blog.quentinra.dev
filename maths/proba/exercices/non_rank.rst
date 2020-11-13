================================
Exercices non triés
================================

Exercice 8 - Récurrence
---------------------------------------

Deux joueurs A et B lancent deux dés parfaits à tour de rôle et c’est A qui commence. Il sera gagnant
s’il obtient un total de 6 lors d’un lancer, auquel cas le jeu est fini, sinon c’est au tour de B. B gagne et
le jeu se termine s’il obtient un total de 7, sinon A rejoue. A quel joueur le jeu est-il profitable ?

Exercice 9 - Examen 2007
---------------------------------------

Un centre de production fabrique des puces électroniques dont certaines peuvent être défectueuses. Au
bout de la chaîne de fabrication des puces, celles-ci sont contrôlées par un testeur électronique.

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

Exercice 2 - Porcelaine cassée
------------------------------------

Une célèbre entreprise de porcelaine E dispose de 10 conteneurs d'assiettes.
Ces 10 conteneurs sont absolument identiques et contiennent les mêmes assiettes dans la même quantité.

L'entreprise E décide d'exporter via le transporteur T, ces 10 conteneurs à sa filiale F.
Malheureusement, lors du transport, trois des conteneurs se heurtent et de nombreuses assiettes sont abimées
dans chacun de ces trois conteneurs (au moins 5 % des assiettes par conteneur).
Par contre, les 7 autres conteneurs sont intacts.

Le transporteur, qui a connaissance de ces dégâts , décide de ne pas prévenir l'entreprise E,
ni sa filiale F et il dépose les conteneurs à la filiale F.

Un commerçant C arrive le lendemain à la filiale F et souhaite acheter,
pour son magasin, 6 de ces conteneurs. La filiale F accepte de vendre chaque conteneur 100 000 euros mais
elle refuse catégoriquement toute ristourne. Le commerçant C obtient néanmoins qu'en contrepartie d'un paiement
immédiat et au comptant de ces 6 conteneurs, il sera remboursé du prix de chaque conteneur
contenant plus de 5 % d'assiettes endommagées et, en outre, il obtiendra un dédommagement de 30 000 euros
pour chaque conteneur endommagé.

Le commerçant choisi alors 6 conteneurs au hasard (il ne peut en aucun cas ouvrir les conteneurs ni voir
ce qu'ils contiennent).

On note X le nombre de conteneurs endommagés et Z le coût total pour le
commerçant après vérification des conteneurs.

1. \
	Donner la loi de X ainsi que son espérance et sa variance.

2. \
	Exprimer Z en fonction de X et en déduire son espérance et sa variance.

3. \
	Sachant que chaque conteneur contient 10 000 assiettes et que chaque conteneur endommagé
	contient entre 500 et 1000 assiettes endommagées,
	à combien peut-on estimer le coût unitaire de chaque assiette non endommagée ?

Exercice 4 - Espérance et équivalant simple
-------------------------------------------------

Soit n un entier non nul.
Dans une urne contenant initialement n boules numérotées 1 à n,
on effectue deux tirages successifs d'une boule selon le protocole suivant :

Si on note k (:math:`k in [1,n]`) le numéro de la boule tirée au premier tirage,
celle-ci est remise dans l'urne avec k boules supplémentaires portant toutes le numéro k ;
on effectue alors un second tirage.

On appelle :math:`X_1` la variable égale au numéro de la boule tirée au premier tirage et :math:`X_2`,
celle égale au numéro de la boule tirée au second tirage.

1. \
	Déterminer la loi de probabilité de :math:`X_1`

2. \
	Déterminer la loi de probabilité de :math:`X_2` et vérifier que

	.. math::

		\sum_{k=1}^n p(X_2 = k) = 1

3. \
	Calculer

	.. math::

		j-n+\frac{n^2}{n+j}

	où :math:`j \in \mathbb{N}` et montrer que l'espérance de :math:`X_2` vaut

	.. math::

		E[X_2] = \frac{1-n}{2}+\frac{3n+1}{2} \sum_{k=1}^n \frac{1}{n+k}

4. Déterminer un équivalent simple de :math:`E[X_2]` lorsque :math:`n \rightarrow +\infty`.

Exercice 5 - étude de suite d'événements
------------------------------------------

Soit :math:`(A_i)_{i \in \mathbb{N}}` une suite d'évènements indépendants,
de même probabilité a (0 < a < 1), par exemple Ai { obtenir 421 au ième lancer de trois dés }.

Pour r entier > 1, on note :math:`N_r`, la variable aléatoire réelle numéro
du tirage où on obtient la r-ième réalisation d'un :math:`A_i`,
par exemple :math:`N_3` est le tirage où 421 sort pour la troisième fois.

1. \
	Quelle est la loi de probabilité de :math:`N_1`?

2. \
	Quelle est la loi de probabilité de :math:`N_r`?

3. \
	Calculer l'espérance [#f3]_ mathématique et la variance de :math:`N_r`.

.. [#f3] on pose X = \sum_{k=0}^{+\infty} (1-a)^{k+r-1} = \frac{(1-a)^{r-1}}{a}


Exercice 6 - loi classique (Examen 2008)
------------------------------------------------

Soit un ensemble E constitué de M éléments de type 1 et
N — M éléments de type 2.

On effectue n tirages sans remise dans E.

Soit :math:`X_k` la variable aléatoire définie par

.. math::

		\begin{cases}
		X_k = 1 \ si \ le \ kième\ tirage\ dans\ E\ donne\ un\ élément\ de\ type\ 1 \\
		X_k = 0 \ si \ le \ kième\ tirage\ dans\ E\ donne\ un\ élément\ de\ type\ 2 \\
		\end{cases}

et soit

.. math::

	X = \sum_{k=1}^n X_k

1. \
	Quelle est la loi de X?

2. \
	Déterminer la loi de :math:`X_k`, E(:math:`X_k`) et V(:math:`X_k`).

3. \
	Pour tous i et j distincts dans [1, n], déterminer cov(:math:`X_i, X_j`).

4. \
	Retrouver E(X) et V(X).

Exercice 4 - Somme de Riemann
--------------------------------

Soit :math:`n \in \mathbb{N}^*`. On considère la suite :math:`u_k` définie par :

.. math::

	\forall k \in \mathbb{N}, u_k = \frac{a_nk}{n^2+k^2}

1. \
	Déterminer le réel :math:`a_n` sous forme d’une somme pour que la relation (1) définisse une loi de probabilité.

2. \
	Étudier la convergence de la suite (:math:`a_n`).

Exercice 6 - Tirage de boules
---------------------------------------------

Soit n un entier non nul. Dans une urne contenant initialement n boules numérotées 1 à n, on effectue
deux tirages successifs d’une boule selon le protocole suivant : Si on note k (:math:`k \in [1,n]`) le numéro de
la boule tirée au premier tirage, celle-ci est remise dans l’urne avec k boules supplémentaires portant
toutes le numéro k ; on effectue alors un second tirage.

On appelle :math:`X_1` la variable égale au numéro de la
boule tirée au premier tirage et :math:`X_2`, celle égale au numéro de la boule tirée au second tirage.

1. \
	Déterminer la loi de probabilité de :math:`X_1`,

2. \
	Déterminer la loi de probabilité de :math:`X_2` et vérifier que

	.. math::

		\sum_{k=1}^{n} p(X_2 = k) = 1

|

-----

**Crédits**
	* Cyril BENEZET (enseignant à l'ENSIIE)
	* Vathana LY VATH (enseignant à l'ENSIIE)

**Références**
	* https://www.onlineocr.net/
	* https://jpg2pdf.com/
	* https://studylibfr.com/doc/4243048/exercice-1-un-sac-contient-deux-boules-blanches-et-3-boul...
	* https://capes-math.univ-rennes1.fr/cours-pdf/ExoProbas2.pdf
	* https://zwolska-psi.monsite-orange.fr/file/f1aac3fbe0b02648c5a1cb609bf39590.pdf
	* http://ericreynaud.fr/BDD-Exos/Exos?Affichage=Feuille&Arg=34&NumMenu=1