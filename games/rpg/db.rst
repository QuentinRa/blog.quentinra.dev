.. _rpgdb:

================================
RPG Database
================================

| :math:`\color{grey}{Version \ 2.17.93}`
| :math:`\color{grey}{Dernière \ édition \ le \ 19/03/2021}`

Cette page est la reconstruction de la partie Données de mon ancien site RpgDatabase.
Avide amoureux des isekai japonais, j'ai essayé de regrouper tout ce
que je trouvais sympa.

Elle contient énormément d'informations sur des compétences, classes,
monstres, etc... que vous pouvez trouver dans des Rpgs.

Alternativement, le site dungeon.bin.sh est une vraie mine de données pour vos Rpg
(aucune donnée de cette page ne vient de ce site, donc n'hésitez pas à y aller).

1. Général
=============

Il peut être intéressant de sauvegarde le nombre d'heures jouées.

L'inventaire peut avoir un poids.

Qu'elle est la monnaie du jeu ?
	*	son nom ?
	*	est-elle unique ? ou propre à un lieu/peuple etc...
	*	son taux de change ? (fixe ? variable ?)
	*	son histoire ?
	*	les différentes pièces de la monnaie (cuivre, argent, or, platine par exemple ou encore centimes et euros)

Dés
	Les dés sont un moyen pratique de générer aléatoirement une valeur selon un certain patron,
	par exemple simplement augmenter les chances ou les réduire.

	Vous avez peut être déjà vu des :code:`1D6` qui veut dire qu'on lance :code:`1` dé, à :code:`six`
	faces. Le résultat étant par exemple le nombre de points pour une compétence qui seront ajoutés.
	On en a d'autres comme :code:`2D6+2` qui lance 2 dés à 6 faces et ajoute 2 au résultat...

2. Status
==========

Les stats permettent de représenter les propriétés des entités
(force d'une personne, le poids d'un objet etc...)

L'ensemble des données d'une entité est généralement représenté sous la forme d'un status.

.. image:: /assets/games/status.png

(Disclaimer: la photo de profil vient de RpgMaker).

Les stats déterminent le % de chance de bloquer une attaque,
d'esquiver, de toucher, la quantité de dommages etc...

.. toctree::
	 :maxdepth: 1

			Les stats des humains                  <db/stats/humans>
			Les stats des items                    <db/stats/items>
			Les stats des monstres                 <db/stats/monsters>
			Les stats des Sorts et des compétences <db/stats/skills>

3. Attributs
=======================

Les attributs sont le nom que je donne au stats qui servent à représenter les compétences des entités
(par exemple la vitesse).

Voici la liste pour les Humains, les monstres, les items et les sorts/compétences. A vous de juger
lesquels sont intéressantes pour chaque entité.

==================== =============================================================================
Attribut             Explication
==================== =============================================================================
Force/Attaque        Détermine les dégâts infligés au corps-à-corps.
HP/Vitalité          Points qui représentent la vie d'une entité (hp 0=mort).
MP/Mana/Magie        Points qui représentent la quantité de magie à disposition.
Stamina/Endurance    Énergie de l'entité. (durée sprints/combat/sans dormir/...)
Vitesse              Détermine qui attaque en premier.
Agilité/esquive	     Possibilité d'éviter les attaques.
Intelligence/Sagesse Capacité à manipuler la magie/les magies. Détermine les dégâts magiques.
Chance               Influence la chance de tomber sur des trésors, ennemies rares, connaissances,

                     coups critiques,...

Dextérité/Précision  Augmente les chances de toucher sa "cible".

Growth/Croissance    Possiblement une stat caché, qui permet à certaines entités de monter de

                     niveau/stats/... plus rapidement/lentement.

Resistances/Défenses Résistance: prends moins de dégâts. Défense: encaisse une partie (+- grande)

                     des dégâts sans perdre de vie. Les res/def sont : peur, paralysie, magique,

                     physique, poison, douleur, mentale, pétrification, évanouissement, sommeil,

                     drogue, maladie, confusion, acide... On peut voir abrégé magic/physique

                     def/res par m/p res/def.
==================== =============================================================================

4. Classes, Jobs et races
==========================

Les classes, les professions ou encore les jobs peuvent
être considérés comme un seul et même stat.

Ici, on considère qu'un classe est orienté combat alors qu'une profession représente plus
le métier exercé (=vie de tous les jours).

Un RPG introduit de nombreuses races "fantasy". Je vous en liste ici quelques unes connus.
Il peut exister des croisement entre deux espèces.
On appelle généralement la race engendré demi-<race dominante> (demi-humains, demi-dwarf, ...).

.. toctree::
	 :maxdepth: 1

			Classes    <db/class>
			Jobs       <db/jobs>
			Races      <db/races>

5. Gimme examples please
===========================

Cette partie ultra longue, contient plein d'exemple sur les façon de trouver
des titres, noms d'items ou de monstres et enfin des sorts.

C'est tout en français (pour l'instant) mais bon vous serez traduire.

.. toctree::
	 :maxdepth: 1

			Titles           <db/ex/titles>
			Monster naming   <db/ex/monsters>
			Spells naming    <db/ex/spells>
			Items naming     <db/ex/items>

Les 7 péchés capitaux (7 deadly sins) sont souvent utilisés comme

	* le pouvoir d'une personne (skill gluttony qui dévore les ennemis vaincus, ...)
	* le pouvoir d'une arme (pareil que plus haut, mais une arme qui possède le skill)
	* un PNJ (créer 7 démons ayant les noms des deadly sins et leur donner le skill du péché par exemple)

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* mangadex.org