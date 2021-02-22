========================
Test-driven en Java (1)
========================

1. on crée notre/nos classes de Test, pour contenir nos méthodes de tests.
2. On commence par écrire les méthodes de test (annotés @Test avec JUnit), une pour chaque test.

3.

	On écris le code de chaque méthode. Si une méthode utilise des classes/méthodes qui n'existent pas
	(100% le cas pour les premières méthodes) alors il faut créer la classe et créer la méthode en
	la laissant vide/avec le comportement par défaut.

4. s1: on lance tous les tests, ils sont tous faux.
5. s2: on code une méthode
6. s3: on relance tous les tests, les test codés sont vrais. (si une méthode codé est devenue fausse, alors il faut revoir son code)
7. on fait en boucle s1, s2, s3 jusqu'à avoir codé toutes les méthodes.

