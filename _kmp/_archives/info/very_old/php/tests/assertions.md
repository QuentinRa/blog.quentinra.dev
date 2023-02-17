# Assertions

[Go back](../index.md#tests-with-phpunit)

You will use these methods in your test classes, inside your test methods, to assert that the code is doing what you expected it to do.

```php
// some values
// $condition = false;
// $expected = null;
// $value = null;
// $class = \PHPUnit\Util\Test::class;
// $actual = self::class;
// $tab = []
// $expected_size = 0;

// value
$this->assertTrue($condition);
$this->assertFalse($condition);

// equals
$this->assertEquals($expected, $value);
$this->assertNotEquals($expected, $value);

// vide
$this->assertEmpty($value);
$this->assertNotEmpty($value);

// type
$this->assertIsArray($value);
$this->assertIsInt($value);
$this->assertIsNotBool($value);
$this->assertInstanceOf($class, $actual);
// ...

// reference
$this->assertSame($expected, $value);
$this->assertNotSame($expected, $value);

// size
$this->assertCount($expected_size, $tab);
$this->assertNotCount($expected_size, $tab);
```