.. _macro:

================================
Macroéconomie
================================

| :math:`\color{grey}{Version \ 2.2.5}`
| :math:`\color{grey}{Dernière \ édition \ le \ 29/11/2020}`

Ce cours est un cours très théorique sur la modélisation de
l'économie au niveau de grand groupes d'acteurs (**macro**).
Son utilité pratique reste à démontrer.

1. Définition et Objectifs
================================

L'économie est divisée en plusieurs sections ayant chacune des économistes spécialisés
(travail, croissance, publique, extérieur, environnemental, éducation, ...).

Agent (économique rationnel)
	achète un maximum de biens, dépense tout son budget pour être un maximum satisfait. On a
	4 agents : entreprises, ménages, état et le reste du monde.

Macroéconomie
	La macroéconomie est l'étude de l'économie à grande échelle (états, ...)
	en observant l'épargne, le PIB, les investissements, la consommation, la croissance, la
	stabilité des prix... appelés agrégats économiques.

	.. toctree::
		 :maxdepth: 1

		  Plus d'informations (objectifs, ...)        <macro/obj>

Politique économique
	Il s'agit de l'un des 4 objectif de la macroéconomie et le plus important. Il s'agit de directives
	prises pour corriger le déséquilibre en offre et demande pour atteindre une offre/demande voulue (objectifs).

	L'état peut prendre des politiques économiques

		* budgétaires : modifier les dépenses publiques/fiscalité
		* monétaires : modifier les taux d'intérêts (banque centrale)
		* offre : influencer les réglementation, la productivité et via la recherche (R&D)

On va globalement s'intéresser

	* aux décisions prises par des agents (en passant par des variables)
	* interactions entre agents (modèles et équations)

Économie fermée
	Il s'agit du cadre dans lequel on considère l'économie dans ce cours. Une économie fermée
	est une économie qui ne tiens pas compte des échanges avec l'extérieur.

2. Présentation des variables
================================

Afin de mesurer l'économie, on introduit des variables pour abstraire des types de données

	* variables endogènes : elles sont calculées dans le model, donc à partir de variables exogènes
	* variables exogènes : elles sont calculées à partir de données extérieures

Il existe trois grandes variables étudiées par la micro économie :

.. toctree::

	PIB (mesure de l'activité économie)     <macro/var/pib>
	Taux de chômage                         <macro/var/work>
	Taux d'inflation                        <macro/var/inf>

Ces variables sont en relation deux à deux :

	* **loi d'Okun** : PIB et Chômage
	* **loi de Phillips** : Inflation et Chômage
	* **relation  de Demande Agrégée** : PIB et Inflation

3. Présentation des modèles
=======================================

Les modèles utilisent des variables et permettent de représenter des situations complexes
assez facilement et tester des politiques économiques. Les modèles sont testés sur des jeux de données
pour vérifier leur validité.

Les inconvénients sont que seulement quelques variables sont prises en compte donc certains
phénomènes non quantifiables (effets psychologiques, l'histoire, ...) ne sont pas pris en compte.

Les modèles sont divisés par temporalité

	* court terme : changer une variable n'a pas encore de conséquences, rigidité des prix
	* moyen terme et long terme : on doit calculer des ajustements face aux conséquences

4. Le marché des biens et services
========================================

Une modification du marché des biens et services entraine une modification de la production donc de ceux qui produisent etc...

.. toctree::
	 :maxdepth: 1

		 L'offre                                               <macro/act/offer>
		 La demande                                            <macro/act/demand>
		 Modèle : équilibre Offre-Demande IS                   <macro/act/balance>

Cependant pour comprendre le fonctionnement de l'économie a court terme, il faut également voir la partie
sur les marchés financiers et la monnaie.

5. Le marché financier
============================================

Le marché financier constitue une étude de l'évolution de la valeur de
la monnaie, ce qui est au à l'inflation (ex: s'il faut plus de monnaie pour acheter
qu'avant = inflation, alors la valeur de votre monnaie a diminuée).

.. toctree::
	 :maxdepth: 1

		Définition de la monnaie                     <macro/fin/def>
		Motifs de détention de la monnaie            <macro/fin/motif>
		Vitesse de circulation de la monnaie         <macro/fin/circ>
		Situation d'équilibre : LM                   <macro/fin/balance>

6. Modèle IS/LM
============================================

La partie 4 présente la partie IS du modèle et la partie 5 présente la partie LM du modèle,
cette partie présente la mise en commun des deux modèles pour obtenir un modèle à court terme.

Ce modèle présente les variations du PIB (IS) si on fait varier les taux d'intérêts (LM).

La courbe I=S est négative, si le taux d'intérêt diminue, alors S augmente (car moins d'argent à dépenser)
donc Y augmente car S augmente. On a donc une courbe IS (Y+, i-) donc quand Y augmente i diminue et inversement.

La courbe L=M est positive, le taux d'intérêt augmente a mesure que Y augmente.

Le moment ou IS=LM c'est l'équilibre entre le marché financier et celui des biens et services.

.. figure:: /assets/business/macro/68747470733a2f2f7777772e6d656c6368696f722e66722f6c652d6d6f64656c652d6c6d.png

	Crédit : Image de melchior (https://www.melchior.fr/le-modele-lm)

7. Exercices
==========================

.. toctree::
	 :maxdepth: 1

		Macroéconomie                   <macro/exercices/general>
		Marché des biens et services    <macro/exercices/is>
		Marché financier                <macro/exercices/lm>
		Modèle IS/LM                    <macro/exercices/is_lm>

-----

**Crédits**
	* Nessrine OMRANI (enseignante à l'ENSIIE)
	* Cours de Macroéconomie (Université Paris-Saclay - C1EG00-400)
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* https://business.toutcomment.com/article/differences-entre-macroeconomie-et-microeconomie-269.html
	* https://fr.wikipedia.org/wiki/Carr%C3%A9_magique_de_Kaldor (carré de compétitivité de Kaldor)
	* https://fr.wikipedia.org/wiki/%C3%89conomie_(discipline)
	* https://www.studocu.com/fr/document/universite-paris-saclay/licence-economie-gestion-premiere-annee/notes-de-cours/macro-cours-1/1759259/view
	* https://fr.wikipedia.org/wiki/Demande_agr%C3%A9g%C3%A9e
	* https://macropol.wordpress.com/2015/02/15/la-demande-et-loffre-agregee/
	* https://www.lafinancepourtous.com/decryptages/politiques-economiques/theories-economiques/theorie-quantitative-de-la-monnaie/
	* https://www.melchior.fr/le-modele-lm
	* http://public.iutenligne.net/economie/simonnet/equilibre_macroeconomique/Chapitre-2/index.html
	*