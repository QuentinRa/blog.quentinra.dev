==========================
Lambda expressions
==========================

Un ajout depuis la version 8 sont les
lambda expression (code qui n'est pas objet
mais fonctionnel).

On utilise généralement une lambda expression pour les interfaces
fonctionnelles c'est-à-dire des interfaces avec une méthode.

.. code:: java

	() -> {
		// ici du code
	}

Notes

	* () est censé contenir les arguments d'une méthode
	* le code entre {} est le code de la méthode
	* {} facultatif si une seule ligne de code

**Exemple**

.. code:: java

	...
	JButton b;
	...
	b.addActionListener(
	 (e) -> { // lambda expression de actionPerformed(ActionEvent e)
	  System.out.println("événement :"+e.toString());
	 }
	);