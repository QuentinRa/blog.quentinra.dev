=============================================================
Règle 6 : héritage - traduction par classe mère
=============================================================

La traduction par classe mère consiste à mettre tous les attributs
dans la classe mère (par inverse à celle par classe fille).
Il va donc falloir pouvoir distinguer si la seule relation
que nous avons est la mère ou une fille (et du coup laquelle ?).

Processus
	* \
		Tous les attributs des filles sont mis dans la mère
	* \
		les clefs des filles deviennent des attributs normaux
	* \
		on ajoute un attribut type qui peux uniquement prendre les valeurs {Mère, Fille1, ...}
	* \
		les anciennes clefs des filles sont uniques
	* \
		vous créez une vue pour chacune des relations, par exemple pour la mère on a V_mère = restriction(projection(mèrefilles), type=\"Mère\").
		Pour la vue d'une fille, type est soit celui de la mère, celui de la fille donc V_fille = Union(
		restriction(projection(mèrefilles), type=\"Fille1\"),restriction(projection(mèrefilles), type=\"Mère\"))

Cas simple : classe mère abstraite
====================================

Si vous tombez sur une classe mère abstraite, alors l'héritage est pareil que
précédemment sauf

	* Vous ne créez pas de vue pour la mère
	* le type n'inclus plus la mère
	* Contrainte : les anciennes clefs des filles ne peuvent pas être tous nulls en même temps