# Writing a test suite

[Go back](../index.md#tests-with-junit)

You may have to do some tests that require the same variables but are checking different things or like the same thing to be done before each test or after each test.

You can do that using

* `@BeforeAll - Junit5` / `@BeforeClass - Junit4`
  
Before all tests.

* `@AfterAll - Junit5` / `@BeforeClass - Junit4`

After all tests.

* `@BeforeEach - Junit5` / `@Before - Junit4`
  
Before each test.

* `@AfterEach - Junit5` / `@After - Junit4`

After each test.

Simply annotates a method with this annotation.

<hr class="sr">

```java
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
    public static void classInit(){ /* set attributes */ }

    @AfterAll
    public static void classFree(){ /* unset attributes */ }

    // ------------ before/after each ---------------- //

    @BeforeEach
    public void testInit(){ /* set attributes, ... */ }

    @AfterEach
    public void testFree(){ /* unset attributes, ... */ }

    // ------------ my tests ---------------- //

    @Test
    @DisplayName("empty test")
    public void myTest(){
        // code
    }

    @Test
    @DisplayName("empty test 2")
    public void monTest(){
        // code
    }
    
    // ...

}
```