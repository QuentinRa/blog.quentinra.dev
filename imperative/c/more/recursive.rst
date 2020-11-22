================================================================
9. Autres notions - Récursivité en C
================================================================

Le principe de la récursivité est une fonction qui s'apelle elle-même.
Il faut qu'il existe deux branche : une récursive et une autre non récursive pour éviter une récursivité infinie.

.. code:: c

		int recursive(int param){
		 if(param < 5){//condition pour choisir la branche
		  return param + recursive(param-1);
		 } else {
		  return 1;//branche non récursive
		 }
		}