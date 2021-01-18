===============================
Récursivité
===============================

Le principe est le même qu'en C, il s'agit d'une méthode qui s'appelle elle même, avec deux branches,
l'un récursive et l'autre non (pour éviter récursion infinie).

.. code:: java

		int recursive(int param){
		 if(param < 5){//condition pour choisir la branche
		  return param + this.recursive(param-1);
		 } else {
		  return 1;//branche non récursive
		 }
		}