=============================================
Compter le nombre de machines/attribution
=============================================

Sous tous les réseaux, 2 adresses sont toujours réservées, il s’agît de l’adresse de diffusion
et le masque de sous réseau.

Le nombre de machines sur un réseau est calculable avec : :math:`2^(32 - nombre de bits fixes) - 2`.

:code:`Exemple (compliqué)`

Imaginons que nous soyons sur un réseau, ayant 22 bits fixes. On peut mettre dessus :
:math:`2^{32-22} - 2 = 1024 - 2 = 1022` machines sur le réseau.

Si on veut partager notre réseau et créer des sous-réseaux, on ne peut pas simplement faire
1022/nombre de sous-réseaux voulus on doit découper le réseau principal encore plus
(ajouter des bits fixes) pour former des sous-réseaux et séparer les adresses restantes en nouvelles plages.

Soit 22 bits fixes alors j’ai encore 10 bits de libres. À chaque bit de libre en moins qui devient
fixe, j’ai :code:`2^{nombre de bits fixes ajouté}` sous réseaux pouvant être crées de
taille :code:`2^{nombre de bits libres restants} - 2`.

On pouvait mettre 1022 sur UN seul réseau. Si on découpe en deux sous réseaux, alors :math:`2^1 = 2` suffit
pour mes deux réseaux (on regarde la forme qui disait
que par bit ajouté on aurait ... sous réseaux) donc je fixe 1 seul bit.

J’ai donc 23bits fixes, 9bits libres et :math:`2^9 - 2 = 510` machines par sous réseau
et non pas 1022/2 = 511.