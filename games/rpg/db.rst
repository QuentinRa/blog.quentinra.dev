.. _rpgdb:

================================
RPG Database
================================

| :math:`\color{grey}{Version \ 0.0.1}`
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

Humains
---------

============================ ==============================================================================
Stat                         Explication
============================ ==============================================================================
Nom Prénom Age Genre         Le nom et le prénom, l'age et le genre (sexe) de l'entité
Classe Job/ Profession       Le metier de l'entité Voir Classes et Professions.

Niveau (level) & Points      Le niveau du joueur. Point de compétences à distribuer

                             (monter classe, stats, job, skills, ...)

Titre                        Le titre principal. Voir Titres.

Race                         Généralement, les mondes fantaisistes implémentent de nombreuses

                             "races" (voir races)

État                         Il s'agît de la condition de l'entité par exemple un taux de "fatigue",

                             "maladie", "faim", "maudit", "froid"...

Argent                       La quantité d'agent de l'entité

Faction/Guilde               Le joueur peut potentiellement rejoindre une guilde (guilde d'aventurier,

                             mercenaires, marchands, guilde en ligne...) ou rejoindre une faction dans

                             le jeu. On peut également afficher son rang dans la guilde (SSS->G).

Renommée/charisme            Votre notoriété. Elle peut augmenter si vous êtes le premier à tuer un boss,

                             découvrir ou conquérir un donjon/lieu, accomplissez des missions...

                             Elle peut permettre des réductions de prix, actions ou des conversations

                             spéciales (choix de dialogues)...

Attributs                    Liste des Attributs (HP, MP, ...)
Compétences                  Liste des Compétences/Skills
Titres                       Liste des titres. Voir Titres.
============================ ==============================================================================

Certains personnages peuvent avoir une croissance accélérée car ils sont nécessaires au déroulement du
scénario. Ils sont appelés les "named npc". Il est possible de les mettre en avant, par exemple
en mettant leur nom d'une autre couleur (or ?) ou tout simplement en leur donnant un nom (si vous n'en
donniez pas autres autres genre vous mettiez forgeron par exemple).

-----

**Crédits**
	* Quentin RAMSAMY--AGEORGES (étudiant à l'ENSIIE)

**Références**
	* aucune