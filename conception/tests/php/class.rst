=======================================
Structure d'une classe et tests
=======================================

La syntaxe "minimum" est

.. code:: php

		<?php declare(strict_types=1);

		use PHPUnit\Framework\TestCase;

		class TestSuite extends TestCase {

		 // le nom commence forcément par test !!!!
		 public function testMonTest($err=NULL): void {
			//mon code de test
		 }

		}

Une version plus complète (explication dans la partie java si besoin)

.. code:: php

		<?php declare(strict_types=1);

		use PHPUnit\Framework\TestCase;

		class TestSuite extends TestCase {

		 // ---------------- before/after all tests

		 public static function setUpBeforeClass(): void { /* set attributes, ... */ }
		 public static function tearDownAfterClass(): void { /* unset attributes, ... */ }

		 // ---------------- before/after each test

		 protected function setUp(): void { /* set before test */ }
		 protected function tearDown(): void { /* unset after test */ }

		 // ---------------- my tests

		 public function testMonTest($err=NULL): void {
			//mon code de tests
		 }

		}

Typiquement, on rappelle les méthode vues en Java et quelques nouvelles

.. code:: php

	<?php
	public function testMonTest($err=NULL): void {

	 // valeur
	 $this->assertTrue(condition);
	 $this->assertFalse(condition);

	 // equals (méthode)
	 $this->assertEquals(expected,value);
	 $this->assertNotEquals(expected,value);

	 // vide
	 $this->assertEmpty(value);
	 $this->assertNotEmpty(value);

	 // type
	 $this->assertIsArray(value);
	 $this->assertIsInt(value);
	 $this->assertIsNotBool(value);
	 $this->assertInstanceOf(classExpected);
	 // ...

	 // référence
	 $this->assertSame(value);
	 $this->assertNotSame(value);

	 // taille
	 $this->assertCount(expected_size, tab);
	 $this->assertNotCount(expected_size, tab);

	}

Il en existe plein d'autres, lisez la doc (https://phpunit.readthedocs.io/en/9.5/assertions.html).

Pour les exceptions/erreurs, je vous invite à voir ce lien
https://phpunit.readthedocs.io/en/9.5/writing-tests-for-phpunit.html#testing-php-errors-warnings-and-notices.

Enfin, si votre page fait des redirections, je n'ai pas trouvé de moyen de faire
des tests autre qu'ajouter un paramètre à la méthode testée pour empêcher la redirection
si c'est un test (ex: tester le login avec différents tableaux POST).