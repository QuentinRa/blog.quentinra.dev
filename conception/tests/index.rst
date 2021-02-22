.. _tests:

================================
Tests
================================

| :math:`\color{grey}{Version \ 0.4.7}`
| :math:`\color{grey}{Dernière \ édition \ le \ 21/02/2021}`

Le but premier est de vérifier si un logiciel fait bien ce qu’il doit faire.

Pour lire ce cours, sachez que les première parties sont très facile à lire
(peu complexes) mais beaucoup de blabla qui vous aidera à avoir une vision
de ce qu'on veut faire. En théorie, vous pouvez directement sauter aux
tests dans votre langage et revenir aux premières parties (si vous êtes perdus) plus tard.

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

5. Méthode SOLID
====================

...

6. Assertions et framework de tests
==========================================

Les assertions sont un "print" qui permet d'asserter (confirmer xD) les valeurs
d'invariants, ... Le forme généralement en JAVA par exemple est :code:`assert(condition) : "message"`.

Les frameworks de test ont tous repris la même idée donc vous aurez
un paquet de méthodes :code:`assert...` comme :code:`assertTrue()`.

Un test va être un ensemble d'assertions, et il est considéré comme
réussi si toutes ses assertions sont vraies.

Dans tous les frameworks de tests vus ici, vous allez créer une classe de tests par
exemple :code:`AllTests.java`, et coder des méthodes dont le nom doit généralement
commencer par :code:`test` (sauf en java ce n'est pas obligé).

7. Tests en JAVA avec JUnit
============================

De façon générale

.. toctree::
	 :maxdepth: 1

			Programmation par contrat/défensive <java/pre>
			Assertions en java                  <java/as>

Le cours s'oriente vers JUnit 5
mais a été anciennement rédigé pour JUnit4.

Essayer de donner un nom significatif à vos fichiers comme
TestNomClasse ou TestNomClasseMethode.

.. toctree::
	 :maxdepth: 1

			Introduction                      <java/junit/intro>
			Démarrage rapide (IntelliJ)       <java/junit/idea>
			JUnit4, lancer une suite de tests <java/junit/suite>
			Structure d'une classe de tests   <java/junit/class>
			Le code d'un test                 <java/junit/test>
			Tests paramétriques               <java/junit/param>

8. Tests en PHP avec PHPUnit
==============================

Le fonctionnement étant le même qu'en Java, je permettrais d'aller un peu vite sur la théorie.

L'installation facile se fait avec composer (:code:`composer require --dev phpunit/phpunit ^9.5`),
lisez la doc (https://phpunit.readthedocs.io/en/9.5/installation.html#composer).

.. toctree::
	 :maxdepth: 1

			Démarrage rapide (PHPStorm)       <php/phpstorm>
			Structure d'une classe et tests   <php/class>

Si vous n'êtes pas dans PHPStorm, pas de panique, vous devriez pouvoir compiler
vos tests avec :code:`phpunit mon_fichier_de_tests.php` en supposant que phpunit ai été installé
comme vu plus haut.

Je n'ai pas testé, mais il semble possible d'utiliser des annotations
(https://phpunit.readthedocs.io/en/9.5/annotations.html).

9. Tests en C avec CUnit
==============================

Le fonctionnement étant le même qu'en Java, je permettrais d'aller un peu vite sur la théorie.

sudo apt-get install libcunit1-ncurses-dev
ls /usr/include/CUnit

10. Méthodologies extrêmes
==============================

Behavior driven development (BDD)
	Le behavior driven development (BDD) consiste à imaginer les comportements liés à la
	fonctionnalité (méthode) avant de la coder.

		* que doit faire ma méthode
		* est-ce que ça corresponds à ce qu'on attends
		* quels problèmes/... l'ajout de ma méthode peut poser

	La syntax du BDD est :

		* étant donné (Given) une action (utilisateur est/fait)
		* Quand (When) cet action entraine...
		* Alors (Then) je fais...
		* Et (And) cela entraine...

	On écrit les cas négatif et positifs (tous les cas).

	Je n'ai pas encore trouvé d'utilité à l'utiliser mais les 4 étapes (Given, when, then, and)
	peuvent aider à la conception de tests.

Test-driven development (TDD)
	Le développement piloté par les tests (TDD) consiste en la création de tests avant même
	que l’application soit créé.

	Le principe consiste à écrire des bouts de codes, et de ne les relier ensembles qu’à la fin.
	Donc en gros on écrit la méthode X qui est demandée par le test Y et ce pour chaque test. Puis on fusionne
	toutes les méthodes et on obtient un programme.

	Le procédé est de la forme :

		* Crée des tests
		* Lance les tests, vérifie qu’ils échouent car pas encore codés
		* Écrit du code pour réussir un test (et les précédents test aussi s'il y en avait)
		* Lance les tests et on vérifie qu’il passe
		* et on recommence

	Ensuite, on factorise le code et on revérifie les tests.

	Pour penser nos test, on pense à quel fonctionnalités notre programme doit avoir.
	On pense ensuite des tests pour chacune d’entre elles. C'est généralement très dur car vous n'avez
	rien codé donc ne connaissez ni classes ni méthodes. Il faudra les inventer en écrivant les tests.

.. toctree::
	 :maxdepth: 1

			TDD en java (méthode 1)   <java/tdd>
			TDD en java (méthode 2)   <java/tdd2>

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://luc-hermitte.developpez.com/tutoriels/c++/programmation-par-contrat/partie-1-un-peu-theorie/
	* https://julien-blanc.developpez.com/articles/cpp/Programmation_par_contrat_cplusplus/
	* https://www.developpez.com/actu/109767/Quelques-points-cles-sur-la-programmation-defensive-destinee-a-assurer-la-fonction-continue-d-un-logiciel-dans-des-circonstances-imprevues/
	* https://baptiste-wicht.developpez.com/tutoriels/java/tests/mocks/easymock/
	* https://www.tutorialspoint.com/software_testing_dictionary/test_driven_development.htm
	* https://paulund.developpez.com/tutoriels/php/developpement-pilote-tests/
	* https://gfx.developpez.com/tutoriel/java/junit/
	* https://openclassrooms.com/fr/courses/3504461-testez-linterface-de-votre-site/4270561-pourquoi-ecrire-des-tests
	* https://duckduckgo.com/?q=d%C3%A9veloppement+pilot%C3%A9+par+les+tests&ia=web&atb=v230-1
	* https://stackoverflow.com/questions/48823573/junit-5-console-does-not-find-tests
	* https://stackoverflow.com/questions/52373469/how-to-launch-junit-5-platform-from-the-command-line-without-maven-gradle
	* https://junit.org/junit5/docs/current/user-guide/#running-tests-console-launcher
	* https://openclassrooms.com/fr/courses/6100311-testez-votre-code-java-pour-realiser-des-applications-de-qualite/6440036-tirez-un-maximum-de-ce-cours
	* https://manpages.debian.org/unstable/libcunit1-ncurses-dev/CUnit.3.en.html