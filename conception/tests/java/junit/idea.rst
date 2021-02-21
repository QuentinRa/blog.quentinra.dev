============================
Démarrage rapide (IntelliJ)
============================

Bon, faire des tests en Java, c'est généralement chiant pour les exécuter
(JUnitCore.runClasses, ...) donc on peut
se permettre d'utiliser un IDE : voir IntelliJ (:ref:`jetbrains`).

Maintenant rien de plus simple, pour exécuter un test, créez une classe.
Ensuite codez une méthode avec :code:`@test`.

Ensuite, pour exécuter un test vous cliquez
sur le (1) : exécuter tous les tests de la classe ou (2) : exécuter la méthode test de la
même ligne.

.. image:: /assets/conception/tests/junit/junit_idea.png

.. code:: java

		import org.junit.jupiter.api.DisplayName;
		import org.junit.jupiter.api.Test;

		import static org.junit.jupiter.api.Assertions.*;

		public class AllTests {

			@Test
			@DisplayName("testIdiot()")
			final void testIdiot(){
				assertTrue(true);
			}

		}