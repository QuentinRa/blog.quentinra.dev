==========================
Assertions en java
==========================

Vous pouvez faire quelques assertions à la main mais préférez utiliser JUnit car les assertions
ne sont pas activées de base donc ne sont pas forcément lues.

	* "-ea" (-enableassertions) à java pour les activer partout
	* "-da:package" à java pour une activation dans certains packages

Une fois activées, on place dans notre code un assert qui lève une AssertionError si la
condition est évaluée à false.

.. code:: java

	assert(condition)
	assert(condition) : "message"