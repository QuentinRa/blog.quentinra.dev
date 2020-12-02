===================================================
4. Fonctions - Exemple des valeurs de pc/lr
===================================================

.. code:: ca65

		; pc contient 4 par exemple, lr contient 5
		4: mov r1, #13

		; pc contient 5 par exemple, lr contient 6
		5: bl max;
		6: cmp r0, #13

		; et dans max

		max:
		 ; pc contient 10 lr contient 6

		 10: mov r5, r0
		 ; pc contient 11, lr contient 12
		 ; ...

		 15: bl sprintfd @appel de printf
		 ; pc contient 16, lr contient 17
		 ; ...
		 ; le problème est que après la dernière instruction, il faut donner
		 ;  à pc la valeur 6, pour qu'il retourne dans le programme principal
		 ; cependant printf peut modifier tous les registres, donc on ne vas pas sauvegarder
		 ; lr dans un registre mais dans la pile

		.end