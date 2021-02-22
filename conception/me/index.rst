.. _me:

================================
Méthodologies extrêmes
================================

| :math:`\color{grey}{Version \ 2.0.0}`
| :math:`\color{grey}{Dernière \ édition \ le \ 23/02/2020}`

Les méthodologies extrêmes sont des pratiques pour maximiser
l'efficacité lors de l'écriture de code. Ces pratique demande
généralement une certaine maitrise et coutent du temps mais
sont censées faciliter grandement votre projet.

1. PairProgramming (PP) :code:`❤`
=====================================

Aucune connaissance requise, il s'agit simplement d'être à deux sur une machine.
L'utilité est qu'une personne code (A), tandis que l'autre (on va dire B)

	* aide A si besoin
	* demande des explications à A (ce qui doit faire comprendre qu'il doit documenter car pas évident)
	* propose des améliorations du code
	* pense à des problèmes plus généraux (dans quels cas le code peut bugger, ...)

Je trouve ça très pratique car à deux on est plus efficace dans la réflexion, on apprends
plus vite et si les deux personnes sont de niveaux différentes (avancé-débutant), alors
cela permet de former efficacement.

Vous pouvez également faire du pair-programming en distanciel, par exemple avec
le plugin CodeWithMe des logiciels Jetbrains (IntelliJ Idea, PHPStorm, CLion) et il existe
des plugins similaires dans d'autres IDE comme VSC.

2. Model-driven development (MDD) :code:`❤`
================================================

Il s'agit d'une mode de développement extrême
dans lequel un logiciel est entièrement conçu en conception
et le développement est le reflet exact de ce qui a été conçu.
(même classes, attributs, constructeurs, ... par exemple en Java).

Vous devez être un maitre en conception donc savoir manier les diagrammes
UML comme les DCU, les DC et les DSS car le Model-driven development n'est qu'une stratégie optimale
pour exploiter aux mieux les diagrammes UML.

Voici les 5 étapes

.. toctree::
	 :maxdepth: 1

		1. Trouver les cas d'usages <mdd/mdd1>
		2. Création du DC (basique) <mdd/mdd2>
		3. Diagrammes de séquence   <mdd/mdd3>
		4. Mise à jour du CDC       <mdd/mdd4>
		5. Code                     <mdd/mdd5>

3. Behavior driven development (BDD)
=======================================

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

4. Test-driven development (TDD) :code:`❤`
==============================================

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

			TDD en java (méthode 1)   <tdd/plan1>
			TDD en java (méthode 2)   <tdd/plan2>

-----

**Crédits**
	* Florent MADELAINE (enseignants à l'IUT de Sénart-Fontainebleau)
	* Luc Hernandez (enseignant à l'IUT de Sénart-Fontainebleau)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://www.tutorialspoint.com/software_testing_dictionary/test_driven_development.htm
	* https://paulund.developpez.com/tutoriels/php/developpement-pilote-tests/
