======================================
Session et premier/arrière plan
======================================

Un seul groupe de processus d'une session est au 1er plan

	* peut bénéficier/droit aux entrées/sorties
	* peut lire/écrire
	* reçoit signaux (CTRL-C)

Les autres groupes sont à l’arrière-plan

	* ne peuvent pas lire/écrire sur le terminal
	* ne reçoivent pas les signaux (sauf CTRL-Z)

Par défaut dans certains cas, les processus en arrière plan peuvent écrire sur le terminal.
Il est possible de changer ce comportement en modifiant une variable d'environnement.
