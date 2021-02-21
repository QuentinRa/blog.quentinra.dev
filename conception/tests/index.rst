.. _tests:

================================
Tests
================================

| :math:`\color{grey}{Version \ 0.0.1}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/02/2021}`

Le but premier est de vérifier si un logiciel fait bien ce qu’il doit faire.

1. Introduction aux tests
===================================

Il existe deux grandes familles de tests et une famille intermédiaire :

	* boite noire (on ne connait pas le code, seulement entrés&sorties)
	* boite blanche (on connait tout : code, entrés et sorties).
	* boite grise (on a des informations partielles, famille intermédiaire)

Il existe deux approches pour vos tests

	* faire des tests pour vérifier les comportement de votre code (Tests unitaires)
	* faire des tests pour forcer votre code s'adapter pour valider des tests (TDD, BDD)

Test unitaires
	Lorsqu'on test une partie d'un programme/logiciel ce qui se rapporte souvent à une méthode
	donc un bout de code.

2. Programmation par contrat :code:`théorie`
=================================================

La programmation par contract part du principe que si on vous donne de bonnes données, alors
votre code retourne un bon résultat.

préconditions
	Les préconditions représentent le fait que tout est correct lors de l’appel
	de la méthode (arguments/attributs...)

postconditions
		Les postconditions représente le fait que tout est correct après l’appel
		de la méthode. (vérifier résultat, vérifier valeurs globales, ...)

invariant
	Un invariant est une propriété/quelque chose qui reste vrai avant et après
	l’appel de la méthode. (taille liste si on ne fait qu'inverser deux éléments inchangée...)

La programmation par contrat part du principe que si les préconditions
sont correctes alors les postconditions les sont aussi.

	* on vérifie toujours les préconditions d'une méthode publique
	* on vérifie toujours les postconditions
	* on vérifie les invariants

En pratique

	* vérifiez les arguments de l'utilisateur (voir programmation défensive)
	* vérifier pour des arguments connus que votre méthode retourne le bon résultat
	* vérifier que pour des mauvais arguments votre méthode retourne les bonnes erreurs
	* écrire le contract (la documentation)

3. Programmation défensive :code:`théorie`
=============================================

Il s'agit d'une méthode de développement très simple :

	* vous ne devez pas faire confiance aux données des utilisateurs
	* vous ne devez pas faire confiance aux données des programmeurs
	* vous ne devez faire confiance à personne

Donc systématiquement, vous devrez tester les arguments de vos méthodes, les invariants, ...

	* tester si la valeur est nulle
	* tester si la valeur est en dehors de l'intervalle voulu (ex: r de rgb entre 0 et 255 mais c'est un int)
	* tester si le format des données est le bon (liste d'une certaine taille voulue, ...)
	* tester si des invariants sont présents (par exemple on doit d'abord appeler la connexion à la base de données avant de fetch)

En théorie, certaines erreurs peuvent être évitées par exemple une valeur est en dehors de l'intervalle voulu.
Beaucoup de programmeurs vont écrire par feignantise des valeurs en brut
dans le code comme "une valeur ici" alors qu'ils devraient créer et **utiliser des constantes**.

Lorsque une valeur prends un nombre fini de valeurs (ex: les classes d'un RPG comme héro, chevalier, magicien
et voleur) alors on peut faire une énumération, si un tel type existe dans le langage.

4. Trouver des tests :code:`théorie`
=====================================

Si vous cherchez à coder des tests pour tester votre programme
alors encore faut-il déterminer quels tests sont pertinents.

L'objectif est de couvrir au minimum tous les cas qui sont probables d'arriver. Vous pouvez
vous faire l'image mentale d'un automate de votre programme et essayer de détecter quelles branches
sont les plus concernées par des tests).

Attention, vous devez tester que votre programme marche bien et que votre programme
sort bien les bonnes erreurs dans les autre cas.

On va se placer dans le cas d'un test unitaire (test d'une fonction). En suivant le modèle **RightBicep**
(sert toi de ton bicep droit), on devra se demander

	* :code:`Right` : résultat ok ? travail accompli ?
	* :code:`B` : voir CORRECT
	* :code:`I` : s'il existe une méthode déjà faite qui fait l'inverse, alors on vérifie si on revient bien à l'état de départ
	* :code:`C` : faire un test croisé en testant avec d'autres méthodes
	* :code:`E` : tester les erreurs
	* :code:`P` : tester les performances

et pour CORRECT (le B), on a

	* :code:`C` : Conforme (arguments ok)
	* :code:`O` : Ordre (valeurs ordonnées, plus pour les langages faiblement typés)
	* :code:`R` : Intervalle des valeurs
	* :code:`R` : Reference (code référence quelque chose d’externe?)
	* :code:`E` : Vide (test null)
	* :code:`C` : cardinalité (fait varier la taille des données, bon nombre de valeurs reçu?)
	* :code:`T` : temps (appelé dans le bon ordre donc connexion avant fetch par exemple pour une base de données...)

5.
=====================

7. Tests en JAVA avec JUnit
============================

Programmation par contrat/défensive
	On utilise des méthodes comme :code:`Object.requireNonNull(Object)`, ...
	et on retourne des exceptions comme :code:`IllegalArgumentException` (argument pas bon)
	ou :code:`IllegalStateException` (préconditions empêchent de continuer car pas bonnes).

	Sinon pour tester les préconditions vous ferez généralement simplement des comparaisons
	mais parfois il existe des méthodes déjà faites comme vu plus haut.

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune