============================================================
5. Conditions - Opérations qui changent les flags
============================================================

.. code:: ca65

		; Comparaison : Rn - Operand2
		cmp Rn, Operand2

		; Comparaison : Rn + Operand2
		cmn Rn, Operand2

		; Fait un ET logique des bits
		tst Rn, Operand2

		; Fait un ou exclusif des bits
		teq Rn, Operand2