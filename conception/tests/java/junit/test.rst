========================
Le code d'un test
========================

Avant de voir le code, voyons nos outils : les assertions

	*	:code:`assertEquals(Object, Objet)` : regarde si deux objets sont égaux
	*	:code:`assertTrue(condition)` :	vérifie condition vraie
	*	:code:`assertFalse(condition)` : vérifie condition fausse
	*	:code:`assertNull(objet)` : vérifie q’un objet est null
	*	:code:`assertNotNull(Objet)` : vérifie qu’un objet n’est pas null
	*	:code:`assertSame(Object, Object)` : vérifie que 2 instances ont la même référence
	*	:code:`assertNotSame(Object, Object)` : vérifie que 2 instances n'ont pas la même référence et réciproquement
	*	:code:`assertArrayEquals(t1,t2)` : regarde si t2 est égal à t1
	* :code:`assertThrows(NomException.class, methode)` : vérifie qu'une méthode (runnable) lève bien une exception (de
	*	:code:`fail()` : échoue un test sans message

**Attention** : vous pouvez lever un message personnalisé en cas d'erreur avec l'argument message
(souvent le dernier).

Ces assertions sont dans le package : `import static org.junit.jupiter.api.Assertions.*` (Junit5) et
:code:`import static org.junit.Assert.*;` (Junit4).

On remarque le :code:`import static` pour écrire directement le nom de la méthode sans le nom
de la classe devant. Vous pouvez remplacer le :code:`*` par le nom de la méthode à importer
si vous ne voulez pas tout importer.

Enfin pour en venir au code, vous allez d'un côté généré le résultat avec une méthode sure
et de l'autre utiliser votre fonction que vous tester et utiliser les assertions pour vérifier
si les propriétés sont ok.

Notes

	*

		vous pouvez par exemple utiliser fail, si vous avez un trycatch sur du code qui va potentiellement échouer
		et qui finit par échouer.

	* si un test ne fait aucune assertion, alors il est généralement considéré comme ayant échoué.

**Test : exception**

Dans le cas ou votre test est censé levé une exception alors vous pourrez utiliser

.. code:: java

	@Test( expected = ClasseException.class )

**Test : timeout**

Dans le cas ou votre test doit être effectué en moins de x ms alors vous pouvez utilisez

.. code:: java

	@Test( timeout = value )