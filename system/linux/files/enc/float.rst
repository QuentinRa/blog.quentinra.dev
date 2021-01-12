=========================================
Encodage des flottants
=========================================

Sur le même principe que la notation scientifique (1 * 10^5 par exemple) en base 10,
on va noter le nombre sous la forme de :code:`nombre * 2^valeur` en base 2.

Ex : :math:`1.011 * 2^{-5} = 0.00001011`

Écrire un nombre a virgule en base 2

:code:`Comment`

	* prenez un nombre a virgule
	* a: on traite la partie après la virgule

		* on multiplie le nombre par 2
		* on obtient un nombre de la forme 0.[chiffre] ou 1.[chiffre]
		* si [chiffre] est égal à 0 : on arrête
		* sinon on recommence mais avec [chiffre] au lieu de notre nombre
		*
			:code:`résultat` : on met \"0.\" puis les les 0/1 trouvés à la suite et
			on obtient la représentation en base 2 dans l'ordre

	* b: on traite la partie avant la virgule comme si c'était un entier
	* on obtient alors :math:`(b.a)_2` donc la représentation en base 2 du nombre (on ne met pas le "0." du nombre après la virgule)

Exemple avec 11,75

	* prends 0.75

		* 0.75*2 = 1.5
		* 0.5*2 = 1.0

	* on a donc :math:`0.75=(0.11)_2`
	* on a :math:`11=(1011)_2` (juste 11 en base 2)
	* donc :math:`11,75=(1011,11)_2`

Norme IEEE754

On considère un float sur 32 bits, on a alors une répartition de la forme

	* S - 1 bit - signe
	* E - 8 bits - exposant décalé
	* M - 23 bits - mantisse (partie décimale du chiffre)

On obtient notre flottant avec le calcul :math:`(-1)^S * 1.M * 2^{E - 127}`.

	* Vous pouvez le remarquer, mais tous les nombres ne sont donc pas représentables.
	* Si vous avez :math:`... * 2^{-5}` par exemple, alors E = 127 - 5.
	* on utilise 127 qui correspond a 2^8-1 (32 bits) mais dans le cas d'un double (64 bits) on utilise 2^10-1

Exemple : :math:`11,75=(1011,11)_2`

Son écriture est :math:`1011,11 * 2^0` soit :math:`1.01111 * 2^3` et S=0 car 11 positif
donc :math:`(-1)^0 * 1.01111 * 2^3`.

On cherche donc E : 127 + 3 = 130.

	* S = 0
	* E = 100 0001 0
	* M = 011 1100 0000 0000 0000 0000

Soit 0x413C0000.