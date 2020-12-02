============================================
3. Opérations - Opérations arithmétiques
============================================

Opérations
	* Calculs
		* :code:`add{cond}{s} Rd,Rn,Operand2` : Rd = Rn + Operand2
		* :code:`sub{cond}{s} Rd,Rn,Operand2` : Rd = Rn - Operand2
		* :code:`rsb{cond}{s} Rd,Rn,Operand2` : Rd = Operand2 - Rn
	* Multiplications
		* :code:`mul{s}{c} Rd, Rn, Rm` : multiplication de nombre donnant un nombre sur 32bits
		* :code:`smull{s}{c} RdLo, RdHi, Rn, Rm` : multiplication d'entiers signés
		* :code:`umull{s}{c} RdLo, RdHi, Rn, Rm` : multiplication d'entiers non signés, rdLo : 32 bits de poids faible ; rdHi : 32 bits de poids fort
