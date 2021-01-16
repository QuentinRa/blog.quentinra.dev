=============================
Plages A,B,C et CIDR
=============================

Historiquement, les organismes qui voulaient une plage
d'adresses IP avaient le choix entre

	* :code:`255.0.0.0` = classe A = réseaux de grande taille
	* :code:`255.255.0.0` = classe B = réseaux de taille intermédiaire
	* :code:`255.255.255.0` = classe C = réseaux de petite taille

Cette attribution est devenue obsolète car les réseaux de classes
B ont étés rapidement épuisés. On a alors introduit la technique
CIDR (Classless Inter Domain Routing) pour les adresses IPV4.