==================================
Structure d'une classe de tests
==================================

La structure ultra minimale est la suivante

.. code:: java

	import org.junit.jupiter.api.Test;

	public class TestSuite {

	 @Test
	 public void monTest(){
		// du code de test ici (voir assertions)
	 }

	}

mais bon peut faire plus complexe

	* ajouter du code, exécuté avant tous les tests (@BeforeAll - Junit5, @BeforeClass - Junit4)
	* ajouter du code, exécuté après tous les tests (@AfterAll - Junit5, @AfterClass - Junit4)
	* ajouter du code, exécuté avant chaque test (@BeforeEach - Junit5, @Before - Junit4)
	* ajouter du code, exécuté après chaque test (@AfterEach - Junit5, @After - Junit4)
	* désactiver un test (@Disabled - Junit5, @Ignore - Junit4)
	* afficher un nom avant l'exécution (@DisplayName("nom"))

Voici un exemple d'une classe de tests en JUnit5

Dans les méthodes init/free (nommés comme
vous le voulez) vous allez généralement initialiser ou réinitialiser des attributs, rappeler
des méthodes, ... pour définir un environnement correct pour les prochains tests.

.. code:: java

		import org.junit.jupiter.api.AfterAll;
		import org.junit.jupiter.api.AfterEach;
		import org.junit.jupiter.api.BeforeAll;
		import org.junit.jupiter.api.BeforeEach;
		import org.junit.jupiter.api.DisplayName;
		import org.junit.jupiter.api.Test;

		@DisplayName("My basic Test Suite")
		public class TestSuite {

		 // ------------ class ---------------- //

		 @BeforeAll
		 public void classInit(){ /* set attributes */ }

		 @AfterAll
		 public void classFree(){ /* unset attributes */ }

		 // ------------ before/after each ---------------- //

		 @BeforeEach
		 public void testInit(){ /* set attributes, ... */ }

		 @AfterEach
		 public void testFree(){ /* unset attributes, ... */ }

		 // ------------ my tests ---------------- //

		 @Test
		 @DisplayName("empty test")
		 public void monTest(){
			// du code de test ici (voir assertions)
		 }

		}