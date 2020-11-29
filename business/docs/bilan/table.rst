=============================================================
Ressource : La table comptable
=============================================================

La table comptable contient l'ensemble des opérations
comptables ainsi que leur code associé.

Les opérations sont triés dans des "classes", c'est à dire
qu'un comptable va par exemple dire "opération de classe 5"
pour indiquer que le code associé est de la forme "5." .

	* classe 1 : capitaux
	* classe 2 : immobilisations
	* classe 3 : stock
	* classe 4 : clients, fournisseurs et tiers
	* classe 5 : opérations financières
	* classe 6 : charges
	* classe 7 : produits
	* classe 8 : autres

Chaque classe a des sous-classes et ainsi de suite pour regrouper les opérations.
Vous devez utiliser le code qui se rapproche le plus de l'opération.

**Les plus utilisés sont en gras, toutes les sous classes ne sont pas présentes.**

Liste ultra complète : `memocompta <https://www.memocompta.fr/pcg/classe-1-comptes-capitaux/>`_.

Classe 1 : capitaux
=======================

====== ==============
code   description
====== ==============
10     **Capital et réserves**
11     Report à nouveau
12     Résultat de l'exercice
13     Subventions d'investissement
14     Provisions réglementées
15     Provisions
16     Emprunts et dettes assimilées
164    **Prêt bancaire, emprunt**
17     Dettes rattachées à des participations
18     Comptes de liaison des établissements et sociétés en participation
====== ==============

Classe 2 : immobilisations
=============================

Une immobilisation est un achat d'une machine, une maison, une voiture, ...
donc sur le long terme. Elle perds de la valeur chaque année,
on parle de dépréciation.

====== ==============
code   description
====== ==============
20     **Immobilisations incorporelles**
205    Logiciel
21     **Immobilisation corporelles**
211    Terrain
2182   Achat d'un véhicule
2183   Matériel informatique
22     Immobilisations mises en concession
23     Immobilisations en cours
26     Participation et créances rattachées à des participations
27     Autres immobilisations financières
28     Amortissements des immobilisations
29     Dépréciations
====== ==============

Classe 3 : stock
=============================

====== ==============
code   description
====== ==============
31     **Matières premières** (et fournitures)
32     Autres approvisionnements
33     En cours de production de biens
33     En cours de production de services
35     **Stock de produits**
37     **Stock de marchandises**
39     Dépréciation des stocks et en-cours
====== ==============

Classe 4 : clients, fournisseurs et tiers
=================================================

====== ==============
code   description
====== ==============
40     **Fournisseur** et comptes rattachés
401    **Fournisseur**
41     **Clients** et comptes rattachés
411    **Client**
42     Personnel et comptes rattachés
43     Sécurité sociale et autre organismes sociaux
44     État et autre collectivités publiques
45     Groupe et associé
46     Débiteurs divers et créditeurs divers
47     Comptes transitoires ou d'attente
48     Comptes de régularisation
49     Dépréciations des comptes de tiers
====== ==============

Classe 5 : opérations financières
=================================================

====== ==============
code   description
====== ==============
50     Valeurs mobilières de placement
51     Banques, établissements financiers et assimilés
512    **banque**
52     Instruments de trésorerie
53     **Caisse**
54     Régie d'avances et accréditifs
58     Virements internes
59     Dépréciations des comptes financiers
====== ==============

Classe 6 : charges
=================================================

====== ==============
code   description
====== ==============
60     **Achats**
603    **Variations des stocks**
607    **Achat de marchandises**
61     Services extérieurs
613    Location
615    Frais de maintenance
6156   Maintenance
616    Prime d'assurance
62     Autres services extérieurs
623    Publicité
626    Timbres poste
627    **Frais bancaires**
63     **Impôts, taxes et versements assimilés**
64     Charges de personnel
641    Rémunération du personnel
645    Cotisations sociales
65     Autres charges de gestion courante
651    Location/Abonnement d'un logiciel
66     **Charges financières**
67     **Charges exceptionnelles**
6712   Amende fiscale
68     Dotations aux amortissements, dépréciations et provisions
69     Participation des salariés, impôts sur les bénéfices et assimilés
====== ==============

Classe 7 : produits
=================================================

====== ==============
code   description
====== ==============
70     **Ventes de produits fabriqués, prestation de services, marchandises**
701    **Vente de produits finis**
707    **Vente de marchandises**
71     Production stocké/déstockée
72     Production immobilisée
74     Subventions d'exploitation
75     Autres produits de gestion courante
76     Produits financiers
77     Produits exceptionnels
78     Reprises sur amortissements, dépréciations et provisions
79     Transferts de charges
====== ==============