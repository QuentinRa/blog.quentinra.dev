====================================================
2. Définitions avancées - Graphes planaires
====================================================

Planaire
	Un graphe est planaire si on peut le représenter tel qu'aucune arrête ne traverse
	une autre arrête.

	On appelle Graphe planaire topologique la représentation planaire d'un graphe planaire.

	Un graphe est planaire

		* si n-m+f = 2 avec n sommets, m arêtes et f faces (donc f=m-n+2).
		* si m < 3n -5 avec G connexe, n sommets et m arêtes
		* si le degré de chaque sommet est strictement supérieur à 5, le graphe n'est pas planaire

	Si un graphe est planaire, alors il existe forcément un sommet e tel que d(e) < 6.

	Kuratowski
		Les graphes K3,3 et K5 ne sont pas planaires. Tout graphe
		contenant un sous-graphe qui soit l'un de ces deux là n'est pas planaire.

	Robertson–Seymour
		Graphe est planaire ssi il ne contient pas comme mineur K3,3 et K5

Face
	Une face est une région d'un graphe planaire délimitée/entourée par des arrêtes.

	Les arrêtes externes (celles vers l'extérieur) du graphe délimites la face
	dite infinie.

Frontière et contour
	On appelle frontière ou contours, les arrêtes qui entourent une face.

	Le contour cependant est un cycle élémentaire et ne dépend pas de la représentation.

	Dans un graphe planaire topologique, les contours forment une base de cycles.

Graphe dual
	Un graphe dual noté G* est un graphe dans lequel les sommets sont
	les faces de G et les arrêtes leur frontières.

Mineur d'un graphe
	Le mineur d'un graphe G est obtenu en effectuant un nombre quelconque d'opérations parmi :

		* supprime un sommet isolé (d(sommet) = 1)
		* supprime une arrête
		* contracte une arrête : les deux sommets aux extrémités sont fusionnés.