============================================
3. Opérations - Opérations arithmétiques
============================================

Opérations
	* Calculs
		* :code:`add{cond}{s} Rd,Rn,Operand2` : Rd = Rn + Operand2
		* :code:`sub{cond}{s} Rd,Rn,Operand2` : Rd = Rn - Operand2
		* :code:`rsb{cond}{s} Rd,Rn,Operand2` : Rd = Operand2 - Rn
	* Multiplications
		* :code:`mul{cond}{s} Rd, Rn, Rm` : multiplication de nombre donnant un nombre sur 32bits
		* :code:`smull{cond}{s} RdLo, RdHi, Rn, Rm` : multiplication d'entiers signés
		* :code:`umull{cond}{s} RdLo, RdHi, Rn, Rm` : multiplication d'entiers non signés, rdLo : 32 bits de poids faible ; rdHi : 32 bits de poids fort

Les termes bizarres
	* les {cond} sont expliqués dans la partie conditions, facultatif
	* les {s} sont expliqués dans la partie conditions, facultatif

Explications
	* calculs
		* add : Rd=?, Rn=5, Operand2 = #7 alors Rd = 5+7 = 12
		* sub : Rd=?, Rn=5, Operand2 = #7 alors Rd = 5-7 = -2
		* rsb : Rd=?, Rn=5, Operand2 = #7 alors Rd = 7-5 = 2
	* Multiplications
		* multiplication mais pour les grand chiffres il y a des erreurs
		* chiffres positif, résultat stocké dans deux registres
		* chiffres pouvant être négatif, résultat stocké dans deux registres