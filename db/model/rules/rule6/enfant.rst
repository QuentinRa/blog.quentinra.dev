=============================================================
Règle 6 : héritage - traduction par classe fille
=============================================================

.. note::

	Généralement utilisé lorsque la classe mère est abstraite (donc en italique ou avec "abstract" devant) car très simple.
	Dans les autres cas, le modèle relationnel est très lourd, et cela demandera beaucoup de travail au programmeur.

Processus
	* \
		on applique une classe = une relation.
	* \
		Tous les attributs de la mère sont mis dans chacune des filles
	* \
		La clef de la mère devient la clef, la clef de la fille devient un attribut normal
	* \
		On a une contrainte cle donc non null et unique sur les clef des filles devenus des attributs
	* \
		Contrainte : Une classe mère ne peux pas avoir une clef déjà utilisée par une fille (sinon c'était une fille).
		ce qui s'écrit : proj(Mère.clef)  NOT IN UNION(proj(Fille.clef), ....).

		Ceci est dû que que les valeurs de la filles sont celle de la mère + ses valeurs dont les valeurs de la clef doivent uniques,
		voir point suivant
	* \
		Pour représenter le fait qu'une fille : valeur mère + valeurs de la fille, alors on créé une table virtuelle appelée
		vue qui va avoir pour donner celles de la fille + celles de la mère. On note cela VueMèreFille1
		= UNION(Mère.attr, Mere.attr2, ...., Fille1.attr1, ...).

Cas simple : classe mère abstraite
====================================

Si vous tombez sur une classe mère abstraite, alors
l'héritage est très simple.

Processus

	* \
		Une relation par fille, pas de relation pour la mère
	* \
		Tous les attributs de la mère sont mis dans chacune des filles
	* \
		La clef de la mère devient la clef, la clef de la fille devient un attribut normal
	* \
		On a une contrainte cle donc non null et unique sur les clef des filles devenus des attributs