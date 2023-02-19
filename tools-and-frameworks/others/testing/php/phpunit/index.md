# PHPUnit

<div class="row row-cols-md-2"><div>

[PHPUnit](https://phpunit.de/index.html) is a unit testing framework, such as JUnit in Java.

* 📚 [Documentation](https://phpunit.de/documentation.html)
* 🦄 [GitHub](https://github.com/sebastianbergmann/phpunit) (19k ⭐)

You will define classes with one or more tests (`TestCase`) that uses assertions that check that a condition is valid or raise an error.
</div><div>

You can install PHPUnit using composer

```bash!
$ composer require --dev phpunit/phpunit^9.5
```

To run tests, you can use

```bash!
$ ./vendor/bin/phpunit test_file.php
```
</div></div>

<hr class="sep-both">

## TestCases

<div class="row row-cols-md-2 mt-3"><div>

```php
<?php declare(strict_types=1);

use PHPUnit\Framework\TestCase;

class XXXTest extends TestCase {
    public function testXXX() : void {
        // code...
    }
    // more tests...
}
```

You can execute some code before/after **every** test

```php
// ...
class XXXTest extends TestCase {
    // ...
    public static function setUpBeforeClass(): void {}
    public static function tearDownAfterClass(): void {}
}
```

You can execute some code before/after **each** test

```php
// ...
class XXXTest extends TestCase {
    // ...
    protected function setUp(): void {}
    protected function tearDown(): void {}
}
```

</div><div>

Inside a test, here are examples of assertions you can use

```php
// boolean true/false
$this->assertTrue($condition);
$this->assertFalse($condition);

// equals
$this->assertEquals($expected, $value);
$this->assertNotEquals($expected, $value);

// empty
$this->assertEmpty($value);
$this->assertNotEmpty($value);

// type
$this->assertIsArray($value);
$this->assertIsInt($value);
$this->assertIsNotBool($value);
$this->assertInstanceOf($expected, $value);
// ...

// reference
$this->assertSame($expected, $value);
$this->assertNotSame($expected, $value);

// size
$this->assertCount($expected_size, $tab);
$this->assertNotCount($expected_size, $tab);
```
</div></div>