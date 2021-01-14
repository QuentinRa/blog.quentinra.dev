==============================================
Bases  (2, 8, 16, ...)
==============================================

Niveau débutant
***********************

1. Entrainement aux bases
-----------------------------

1. Convertir en base 10 (décimal) les nombres en base 2 suivants : 101, 0101, 1101110.

2. Convertir 193 en base 2, puis 1715 vers la base 12

3. Quelles représentations ne sont pas valides en base 18

	* 18830F35
	* E4139BHG
	* 0003477ABI027
	* 527FFHH4100
	* CHEDAB
	* DIGHO

4. Convertir vers la base 2 : 0x8A0F1, 0xF0F0F0F0F0, 074253

5. Convertir vers le base 16 : :math:`(11000100111001000111011)_2`, :math:`(37204607315)_8`.

6. Représenter sur 8 bits les entiers non signés : 0, 1, 117, 254, 257

7. Effectuer les opérations suivantes (non signées) sans passer par la base 10

	* :math:`(11010011)_2 + (10100011)_2`
	* :math:`(11010)_2 * (100111)_2`
	* 0xa73 + 0x1ce
	* :math:`(11010000)_2 - (10100011)_2`
	* 0xa733 - 0x1ce7

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<bases/d1>

| :code:`[TAG] IUTSF ASR TD5 2018 S1`

Niveau supérieur
***********************

1. Message crypté
------------------------------

| On récupère le fichier :download:`message.hex <../../../assets/system/linux/exercices/message.hex>`.
| On récupère le fichier :download:`message.oct <../../../assets/system/linux/exercices/message.oct>`.

1. \
	Après avoir regardé les fichiers, donner les commandes hexdump qui depuis un message.txt ont donné
	les fichiers message.hex et message.oct (vous n'avez évidement pas le message.txt pour tester).
2. \
	Déduire ce que signifie le premier champ sur chaque ligne, dans chacun des deux fichiers. On en
	donne les valeurs en décimal.
3. \
	On déduit, du point précédent la taille, en octets, du fichier message.txt

4. On affiche à l’aide de echo :

	1. \
		La chaîne de caractères formée par le caractère dont la valeur du code ascii est celle du
		premier octet dans le fichier message.hex

	2. \
		La chaîne de caractères formée par les deux caractères dont les valeurs du code ascii sont
		celles du premier et du deuxième octets dans le fichier message.hex
	3. \
		En utilisant des techniques des TP précédents, on affiche à l’écran, le résultat obtenu
		à partir du fichier message.hex, en omettant de chaque ligne son premier champ et en
		substituant chaque suite de caractères d’espacement par \x
	4. \
		En faisant un copier-coller, à partir du résultat obtenu à l’écran suite à la transformation
		précédente, on reconstitue le fichier message.txt dans son répertoire
	5. \
		On vérifie la taille du fichier trouvée avec la taille trouvée en 3

5. On refait 4 mais avec message.oct

.. toctree::
   :maxdepth: 1

		Proposition de correction n°1			<bases/s1>

| :code:`[TAG] IUTSF ASR TP8 2018 S1`

Niveau avancé
***********************

aucun

-----

**Crédits**
	* Selma NABOULSI (enseignant à l'IUT de Sénart-Fontainebleau)
	* Frédéric GERVAIS (enseignant à l'IUT de Sénart-Fontainebleau)
	* Luc DARTOIS (enseignant à l'IUT de Sénart-Fontainebleau)
	* Ivan Augé (enseignant à l'ENSIIE)

