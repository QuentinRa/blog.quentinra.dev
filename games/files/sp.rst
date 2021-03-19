===================
Smart programming
===================

Outre le côté potentiellement arrogant dans le nom, il s'agit d'astuces
ou de retours.

1. Conception d'application
==============================

Ces conseils sont plus orientés applications/logiciels mais peuvent aider (peut-être à faire
une bonne interface a.k.a. IHM).

	* ne pas oublier les raccourcis
	* ne pas oublier les menus basiques

		* fichier : ouvrir, fermer, sauvegarder, sauvegarder sous, quitter
		* peut être des menus importer/exporter
		* undo, redo
		* un menu de paramètres ?
		* un menu d'aide ?

	* essayer de penser au côté responsive

		* généralement les écrans sont plus large que haut !
		* peut être définir une taille minimale

2. Méthode générale
========================

Personnellement, j'ai très apprécié le fait de faire des maquettes fonctionnelles du jeu. Cela permet
de facilement voir à quoi va ressembler notre interface, mais ça nous permet aussi de voir certaines
fonctionnalités qu'on aurait pu oublier.

Pour faire des maquettes assez rapidement, je vais du code très moche avec boostrap, php
et du css directement dans le code. Je trouve que c'est assez rapide (pour faire le style tout ça),
mais sinon vous avez des outils existants (que personnellement je n'aime pas trop car trop génériques).

Je recommande toutefois justinmind parce que c'est le meilleur que j'ai trouvé https://www.justinmind.com/.
Sinon vous avez toujours toutes les solutions vues en IHM.

Le model driven development (MDD) est aussi un bon moyen de gagner du temps mais généralement trop
long et compliqué à mettre en place donc peut être pas le meilleur choix pour un jeu.

3. Premier jeu ?
==================

Si c'est votre premier jeu, commencez simple. Faites toujours en sorte de commencer petit
puis d'améliorer au fur et à mesure.