==============================
Déclarations : if, while, for
==============================

Quelques instructions utiles

.. code:: py

		pass # bloc vide impossible, donc cette instruction ne fait rien
		break # quitte une boucle while/for
		continue # saute le code qui suit et passe au prochain tour d'un while/for

**branchement if**

If prends une condition (donne une expression qui renvoi un boolean : True ou False)
et exécute le bloc if si la condition est vraie, sinon test d'éventuels bloc elif et dans
le cas où toutes les conditions sont fausses, alors le bloc else est exécuté.

.. code:: py

		if {cond} : # ici on test votre condition
		 # bloc de code
		elif {autre_condition} :
		 # bloc, autant de elif que voulu, facultatif
		else : #facultatif
		 # code si tout est faux

**boucle while**

S'exécute tant qu'une condition est vraie. Effectue après sont exécution un
bloc else, seulement s'il est présent.

.. code:: py

	while {cond} :
	 # code de la boucle
	else :
	 # après l'exécution, facultatif

**boucle for**

.. code:: py

		# i prends les valeurs de [0, 10[
		for i in range(10) :
			# code

		# i prends les valeurs de [3, 7[
		for i in range(3,7) :
			# code

		# i prends les valeurs de [3, 7[ mais augmente de 2 à chaque passage
		for i in range(3,7,2) :
			# code