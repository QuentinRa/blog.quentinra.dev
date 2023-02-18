# TestSuite

[Go back](../../../../../_kmp/_archives/info/very_old/php/index.md#tests-with-phpunit)

Here is an example of a test file/suite of tests. You don't need to create the `setup`/`tearDown` methods if you won't use them. A test method name must starts with `test`.

```php
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

    public function testMyTest() : void {
        // code
    }

}
```