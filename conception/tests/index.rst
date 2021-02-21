.. _tests:

================================
Tests
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/02/2021}`

1. Introduction aux tests
===================================

Le but premier est de vérifier si un logiciel fait bien ce qu’il doit faire.

Il existe deux grandes familles de tests et une famille intermédiaire :

	* boite noire (on ne connait pas le code, seulement entrés&sorties)
	* boite blanche (on connait tout : code, entrés et sorties).

Et une famille intermédiaire

	* boite grise (on a des informations partielles)

Il existe deux approches pour vos tests

	* faire des tests pour vérifier les comportement de votre code
	* faire des tests pour forcer votre code s'adapter pour valider des tests

Dans la deuxième approche, il s'agit d'une méthodologie extrême appelée :code:`Test-driven development`
(TDD ou développement piloté par les tests), qui sera vu en dernière partie avec le BDD.

On parle de **test unitaire** lorsqu'on test une partie d'un programme/logiciel ce qui
se rapporte souvent à une méthode.

2. Trouver des tests
===============================

Si vous êtes dans la première approche et cherchez à coder des tests pour tester votre programme
alors encore faut-il déterminer quels tests sont pertinents.

L'objectif est de couvrir au minimum tous les cas qui sont probables d'arriver. Vous pouvez
par exemple faire un automate de votre programme et essayer de détecter quelles branches
sont les plus concernées par des tests).

Attention, vous devez tester que votre programme marche bien et que votre programme
sort bien les bonnes erreurs dans les autre cas.

On va se placer dans le cas d'un test unitaire. En suivant le modèle **RightBicep**
(sert toi de ton bicep droit), on devra se demander

	* :code:`Right` : résultat ok ? travail accompli ?
	* :code:`B` : voir CORRECT
	* :code:`I` : s'il existe une méthode déjà faite qui fait l'inverse, alors on vérifie si on revient bien à l'état de départ
	* :code:`C` : tester avec une autre méthode
	* :code:`E` : tester les erreurs
	* :code:`P` : tester les performances

et pour CORRECT (le B), on a

	* :code:`C` : Conforme (arguments ok)
	* :code:`O` : Ordre (valeurs ordonnées)
	* :code:`R` : Intervalle (matrice carré ligne=colonne)
	* :code:`R` : Reference (code référence quelque chose d’externe ?)
	* :code:`E` : Vide (null , ça marche)
	* :code:`C` : cardinalité (fait varier la taille, bon nombre de valeurs reçu)
	* :code:`T` : temps (appelé dans le bon ordre...)

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune