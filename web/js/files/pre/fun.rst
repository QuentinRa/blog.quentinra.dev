====================
Fonctions en JS
====================

Une fonction est un bloc de code, les variables n'existent que dans ce
bloc sauf si vous utilisez var.

.. code:: js

	function pow(x) {
		return x*x;
	}

	pow(2)

Vous pouvez aussi utiliser des arguments par défaut

.. code:: js

	function pow(x, k = 1) {
		return x ** k;
	}

