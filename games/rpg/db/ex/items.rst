==============
Items naming
==============

Pattern des noms d'items

Voici un pattern assez commun pour nommer des items

	* [adjectif] [type d'item] [informations additionnelles]
	* [type d'item] <nom>

Par exemple

	*	Grande épée de chevalier
	*	Plastron d'Aldwin (set), Lance d'Aldwin de paralysie (set)
	*	Casque de mithril

=================== ========================================================================
Idée                Exemples
=================== ========================================================================
Matériau            Matériaux de l'item si c'est une arme/armure

                    (acier, argent, or, mithril, rubis, diamant, fer, émeraude, ronces,

                    bois, cuir, plume, jade, adamantine, écailles, cristal, pierre)

Un nom d'entité     Par exemple : Armure du [Roi des dragons], ...
Un nom de classe    Par exemple : Robe de magicien, habit d'assassin...

Un détail spécial   Sert à une fonction, à une personne d'un certain niveau de maitrise habit

                    d'entrainement, magique, de novice/amateur/...

Un détail visible   large/longue, courte, ancien, incurvé, usé, ...
Un détail de status empoisonné, paralysante, sainte, sombre, ardent, ...
Une couleur         rouge, ...
stats affectées     Bracelet de fuite, combat, puissance, protection...
la rareté           couleur (or, platine, diamant) mot (unique, légendaire, mythique)
=================== ========================================================================

=============== ========================================================================
Type            Description
=============== ========================================================================
Armures lourdes casque, plastron, gantelets, jambières, bottes, épaulières, bouclier

Armures légères chapeau, masque, cape, manteau, gants, pantalon, robe, ceinture,

                chaussures.

Accessoires     bague, bracelet, anneau, collier, boucles d'oreille, diadème,

                pendentif, couronne

Armes           arc, dague/poignard, lance/hallebarde, fouet, hache, marteau, poing,

                baton/sceptre/grimoire/orbe, katana/épée/rapière/sabre

Consommables    une catégorie créée pour regrouper tous les objets consommables comme

                les potions, la nourriture etc...

Matériaux       Peaux/Fourrure, viande, os, coeur, larme, plume
Quête/Clef      Objet utilisé dans une quête
Plantes         Champignons, de l'herbe, des feuilles (d'esprit, de feu, ...),

                des branches (de l'arbre monde)...

Potions         Antidote, Elixir, Potion mana/hp

Spéciaux        Recettes potions, Kit d'alchimie, Parcemin de compétence, clef, runes,

                pierre de retour/feu/…, plaque de statut, sifflet cheval, instrument...
=============== ========================================================================

=============== ========================================================================
Effet           Description
=============== ========================================================================
Stats           Affecte positivement ou négativement les stats de combat/de profession

                Attaque augmenté, résistance réduite, chance de forger [...] augmentée,

                augmentation nombre max mp/hp, dégats contre x...
Statut spécial	Paralysie, poison, saignement, ralentissement
Compétence      Vol de vie, explosion, renvoi dommages, transforme, invoque
Spéciaux        Augmente le taux de loot/de monstres. Options dialogues avec des PNJs.

                Chances de coups critiques...
=============== ========================================================================

Quelques nom que l'on retrouve associés aux items

========== ========================================================
Nom        Item
========== ========================================================
Hades      Haches, set d'Armure lourde
Venus      Lance
Ignis      Épée, set d'Armure lourde
Nocturne   Dague, set d'Armure d'assassin
Nautilus   Set d'Armure lourde
Médusa     Orbe
Vénom      lance (poison)
Merlin     baton/tome/sceptre/..., set de magicien/sorcier
Yggdrasil  Baton/sceptre
Masamune   Épée
Excalibur  Épée
Caladbolg  Épée/Lance/... avec drain de vie
========== ========================================================

Restrictions
------------------

Il est possible d'appliquer des restriction d'utilisation d'une arme,
par exemple empêcher l'utilisation jusqu'à

	*	ce qu'un certain niveau requis ou un certain degré d'expertise
	*	avoir une certaine classe
	*	avoir un certain titre
	*	avoir fait un certain événement

Croissance
------------------

Il est également possible de mettre en place un mécanisme d'amélioration des armes.
Par exemple si le joueur trouve

	*	un certain item permettant l'amélioration (en général)
	*	un certain item permettant l'amélioration de cette arme
	*	un forgeron qui peut améliorer les armes de cette qualité

L'amélioration peut augmenter les stats, ajouter de nouvelles propriétés etc...

Elles sont généralement notées +1, +2, ... et font généralement intervenir la RNG (% chance)
pour réussir une amélioration.

Encore plus...
------------------

Il est possible d'avoir des armes avec une âme dedans. Ils sont généralement plus puissants,
peuvent évoluer, choisir qui les utilises, s'adaptent à leurs utilisateurs

Les items uniques/forgés par des dieu sont généralement appelés items nommés
(named items) et sont appelés artefacts.