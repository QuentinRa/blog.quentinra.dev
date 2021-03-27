=============================================
Compter le nombre de machines/attribution
=============================================

Sous tous les réseaux, 2 adresses sont toujours réservées, il s’agît du masque de diffusion
et du masque de sous réseau.

Le nombre de machines sur un réseau est calculable avec : :math:`2^{(32 - nombre de bits fixes)} - 2`.

Diviser un réseau (compliqué)
------------------------------

Je vais juste mettre la théorie ici, regardez l'exemple dès que vous en aurez besoin.

	* on suppose que vous voulez x sous-réseaux, sachant que vous avez N bits fixes actuellement
	* résoudre n : :math:`2^{n} \ge x`
	* si :math:`32-N-n \le 0` alors pas possible
	* sinon c'est bon. Il faudra alors calculer le nombre de machines, puis les adresses.
	* voir formule plus haut, ce qui donnera : :math:`2^{(32 - {N+n})} - 2`
	* pour les adresses, il suffit de faire toutes les combinaisons de 0/1 comme valeurs de bits fixes ajoutés

		* donc 0,1 (n=1)
		* 10,01,11 (n=2)
		* 001,010,... (n=3)
		* etc.

En gros, si vous n'avez pas compris ces combinaisons, disons que j'ai deux adresses
avec 17 bits fixe. Si je fixe un 18e, alors s'il vaut

	* 0 : j'ai une adresse
	* 1 : j'ai une autre adresse

Donc en fait, diviser le réseau c'est créer des branches comme plus ceci.

Exemple (compliqué)
-----------------------

Imaginons que nous soyons sur un réseau, ayant 22 bits fixes. On peut mettre dessus :
:math:`2^{32-22} - 2 = 1024 - 2 = 1022` machines sur le réseau.

Si on veut partager notre réseau et créer des sous-réseaux, on ne peut pas simplement faire
1022/nombre de sous-réseaux voulus. On doit découper le réseau principal encore plus
(ajouter des bits fixes) pour former des sous-réseaux et séparer les
adresses restantes en nouvelles plages.

Soit 22 bits fixes alors j’ai encore 10 bits de libres. À chaque bit de libre en moins qui devient
fixe, j’ai :code:`2^{nombre de bits fixes ajouté}` sous réseaux pouvant être crées de
taille :code:`2^{nombre de bits libres restants} - 2`.

On pouvait mettre 1022 sur UN seul réseau. Si on découpe en deux sous réseaux, alors :math:`2^1 = 2` suffit
pour mes deux sous-réseaux (on regarde la forme qui disait
que par bit ajouté on aurait ... sous réseaux) donc je fixe 1 seul bit.

J’ai donc 23bits fixes, 9 bits libres et :math:`2^9 - 2 = 510` machines par sous réseau
et non pas 1022/2 = 511.