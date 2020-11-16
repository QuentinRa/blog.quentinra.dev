=============================================================
Règle 6 : héritage - traduction par références
=============================================================

La traduction par référence consiste à mettre une clef référençant la
mère dans chacune des filles.

Processus
	* \
		on applique une classe = une relation.
	* \
		on met la clef dans la mère dans chacune des filles. Leurs anciennes clef deviennent des attributs
		normaux, mais uniques et non nulls.
	* \
		on crée une vue pour chaque fille qui contient la jointure entre les valeurs de la mère et celles
		de la fille (on prends celles avec la clef en commun), ce qui se note : Vue_Fille1 = join(Mère, Fille1, Mère.clef = Fille1.clef)